# Synchronization-Aware Analysis of Asynchronous Programs

Experiments for a SPIN 2014 paper submission.

## Requirements

Reproducing our experiments requires the following tools to be installed, and
accessible in your path.

- [Ruby](https://www.ruby-lang.org/), and the `eventmachine`, `colorize`, and
`curses` gems -- a gem in installed via the command `gem install <gem-name>`.
Our submission results were reported with Ruby version 2.1.0p0.

- [c2s-ocaml](https://github.com/michael-emmi/c2s-ocaml) -- our submissions results were
reported with commit
\#[5a5a804](https://github.com/michael-emmi/c2s-ocaml/commit/5a5a8047b090120df88017c94e3717f7727fb8ba).

- [Boogie](http://boogie.codeplex.com)

- [Corral](http://corral.codeplex.com)

Note: See the [SMACK](https://github.com/smackers/smack) install script for
help on installing Boogie and Corral.

## Usage

Reproduce our experiments by running `./param-tests.rb`

## Notes

Each `.bpl` file was generated manually, yet systematically, from the original
C\# source file, as discovered from their respective sources.
 