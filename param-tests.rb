#!/usr/bin/env ruby

def inst_template(text,args)
  args.each do |key,val|
    text = text.gsub(/[$][{]#{key}[}]/,val.to_s)
  end
  text
end

def inst_template_file(template_file, args)
  text = File.read(template_file)
  text = inst_template(text,args)
  filename = File.basename(template_file,'.template')
  File.write(filename, text)
  filename
end

def one_test(bpl_file, args, timeout = 100)
  
  command = "rpp-seq.rb #{args[:W] ? "" : "-w"} -d #{args[:D]} \
    #{args[:loop_count] ? "-u #{args[:loop_count]+1}" : ""} \
    --verifier #{args[:V]} #{bpl_file} --timeout #{timeout} -k -v"
    
  output = `#{command} 2>&1`
  
  res = output.match /(\d+) verified, (\d+) errors?/ do |m| m[2].to_i > 0 end
  warn "unexpected Boogie result: #{output}" if res.nil?
  
  res = nil if output.match(/ \d+ time outs?/)  
    
  time = output.match /Boogie finished in ([0-9.]+)s./ do |m| m[1].to_f end
  warn "unknown Boogie time" unless time
  
  puts "#{res.nil? ? "TO" : res} / #{time} / #{args}"

  return res, time
end

def one_param_test(template_file, args, timeout = 100)
  filename = inst_template_file(template_file,args)
  return one_test(filename, args, timeout)
end

def find_bug(bpl_file, wait_aware, verifier, delay_limit = 10)
  (0..delay_limit).each do |delays|
    args = {W: wait_aware, D: delays, V: verifier}
    res, time = one_test(bpl_file, args)
    break if res.nil? || res
  end
end

def find_bug_param(template_file, wait_aware, verifier, loop_limit)
  delays = 0
  
  (1..loop_limit).each do |loop_count|
    args = {W: wait_aware, D: delays, V: verifier, loop_count: loop_count}
    res, time = one_param_test(template_file, args)
    break if res.nil?
    unless res
      delays += 1
      redo
    end
  end
end

# def auto(template_file, wait_aware, verifier, loop_limit)
#   (1..loop_limit).each do |loop_count|
#     delays = wait_aware ? 0 : loop_count
#     args = {W: wait_aware, D: delays, V: verifier, loop_count: loop_count}
#     res, time = one_test(template_file, args)
#     break if res.nil?
#   end    
# end

def compare_one_example(bpl_file)

  puts "#{"=" * 80}"
  puts "COMPARISON w/ #{bpl_file}"
  puts "#{"=" * 80}"
  
  puts "WAIT-AWARE SEQUENTIALIZATION"
  puts "#{"-" * 80}"
  find_bug bpl_file, true, :boogie_si
  puts "#{"-" * 80}"
  
  puts "EQR SEQUENTIALIZATION"
  puts "#{"-" * 80}"
  find_bug bpl_file, false, :boogie_si

end

def compare_param_example(template_file, loop_limit)
  
  puts "#{"=" * 80}"
  puts "COMPARISON W/ #{template_file}"
  puts "#{"=" * 80}"

  puts "WAIT-AWARE SEQUENTIALIZATION / 1..#{loop_limit}"
  puts "#{"-" * 80}"
  find_bug_param template_file, true, 'boogie_si', loop_limit
  puts "#{"-" * 80}"

  puts "EQR SEQUENTIALIZATION / 1..#{loop_limit}"
  puts "#{"-" * 80}"
  find_bug_param template_file, false, 'boogie_si', loop_limit

end

def full_exploration(bpl_file, verifier, timeout = 100)

  loop_limit = 10

  puts "#{"-" * 80}"
  puts "FULL (DEPTH-BOUNDED) EXPLORATION OF #{bpl_file} / 1..#{loop_limit}"
  puts "#{"-" * 80}"
  
  (1..loop_limit).each do |loop_count|
    temp_file = File.basename(bpl_file,".bpl") + ".prepared.bpl"
    `c2s load #{bpl_file} prepare #{verifier} print #{temp_file} 2&>1`
    if verifier =~ /boogie_fi/
      output = `verify.rb --verifier boogie_fi -u #{loop_count} #{temp_file} --timeout #{timeout}`
    else
      output = `verify.rb --verifier boogie_si -u #{loop_count} #{temp_file} --timeout #{timeout}`
    end
    res = output.match /(\d+) verified, (\d+) errors?/ do |m| m[2].to_i > 0 end
    warn "unexpected Boogie result: #{output}" if res.nil?
    time = output.match /Boogie finished in ([0-9.]+)s./ do |m| m[1].to_f end
    warn "unknown Boogie time" unless time
    puts "#{res.nil? ? "TO" : res} / #{time} / verifier: #{verifier} / depth: #{loop_count}"
    break if res.nil? || res
  end

end

puts "#{"=" * 80}"
puts "EXPERIMENTS FOR CAV 2014 SUBMISSION / SYNC-AWARE SEQUENTIALIZATION"
puts "#{"=" * 80}"

if `which c2s`.empty? || `which rpp-seq.rb`.empty? 
  abort "These experiments require C2S: https://github.com/michael-emmi/c2s"
end

puts "Found c2s..."

compare_one_example "MSDN-CollectionLoad.bpl"
compare_one_example "MSDN-SendData.bpl"
compare_one_example "StackOverflow-Bitmap.bpl"

compare_param_example 'async-wait-in-loop.bpl.template', 50
  
full_exploration "MSDN-CollectionLoad.FULLSEQ.bpl", "boogie_fi"
full_exploration "MSDN-CollectionLoad.FULLSEQ.bpl", "boogie_si"

