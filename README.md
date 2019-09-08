# Advent of Code 2018 Haskell Starter Kit with Solutions

This repository is a fork of the Advent of Code 2018 Haskell Starter Kit created
by [Dennis Gosnell](https://github.com/cdepillabout) intended for use in coding competitions. The solutions
contained in the `app` directory are written by [Chris Schappert](https://github.com/cschappert).

The kit provides a few niceties for attempting the Advent of Code 2018 problems
in Haskell:

1. an easy way to build, run, and test solutions
2. an opinionated file layout that makes it easy to attempt multiple problems
3. a couple popular libraries pre-installed
4. often-used language pragmas listed in the cabal file

As as example the `app` directory currently contains solutions to Parts 1 and 2
of Day 1. The original problem is located at https://adventofcode.com/2018/day/1.
As each day's problem contains two parts, there are two `.hs` files for each day
following the naming convention below.

* Day 1, Part 1: `Day01-1.hs`
* Day 1, Part 2: `Day01-2.hs`

Likewise, executables are declared in `advent-of-code2018.cabal` following the
following naming convention.

* Day 1, Part 1: `day01-1`
* Day 1, Part 2: `day01-2`

## How to use

You can download and setup this repo as follows.  You will need
[`stack`](https://docs.haskellstack.org/en/stable/README/) installed:

```sh
$ git clone git@github.com:cschappert/advent-of-code2018.git
$ stack test
```

This should download GHC, as well as compile all necessary libraries.
It should also compile this library, as well as all tests.  This will probably
take 10 to 20 minutes the first time you do it.

The solutions for the individual days should be stored in the `app/` directory.
There is an `app/Day01-1.hs` file that you can base your solutions on.  There is some
documentation in that file that you should read.

You can build and run your solution like the following:

```sh
$ stack build --fast advent-of-code2018:day01-1
$ stack exec -- day01-1
```

The `--fast` flag specifies that you don't want GHC to do that much
optimization.  This makes compiling faster.  This is generally okay to use,
unless you need your code to be really fast.  The `advent-of-code2018:day01-1`
parameter says that you want to only build the executable called `day01-1` from
the `advent-of-code2018` package.

When you want to start working on the solution for Part 2 of Day 1, you should copy
the `app/Day01-1.hs` file to a new file called `app/Day01-2.hs`.  You also need to
add a new `executable` section to the `advent-of-code2018.cabal` file.  You can
copy and paste the existing `executable day01-1` section.  Just be sure to rename
things as suggested in the documentation. Likewise you can create `app/Day02-1.hs`
when you are ready to try Part 1 of Day 2.

There is also a shared library in `src/` that can be accessed from any
executable.  If you put code in any module under `src/` you can use it in
multiple executables.  Although it will probably just be easier to copy and
paste code between executables.

## Other Stuff

There are a couple other nice things this repo sets up for you.

### Doctests

Doctests have been setup to run automatically if you run `stack test` as follows:

```sh
$ stack test --fast
```

You can see an example of using doctests if you look at any of the Haskell
files.  This lets you easily write tests inline.  This can be quite useful for
these types of programming competitions.

If you want to run the doctests for a new executable (for instance `Day02-1.hs`),
you have to add a parameter to the `doctests` section in the
`advent-of-code2018.cabal` file.  There is a note in the `test-suite doctests`
section that explains how to do this.  If you forget to do this, then the
doctests will not be run.

### Language Pragmas and Libraries

There is a big list of language pragmas and libraries that have already been
added to the cabal file.  These are widely-used language pragmas and libraries.
This makes it a little easier to just get to work on your solution without
having to manually add pragmas and libraries.

### Continuous Building

Some people like to have `stack` rebuild their code every time they save in
their editor.  This is easy to do with the `--file-watch` argument to stack:

```sh
$ stack build --fast --file-watch advent-of-code2018:day01-1
```

It is also possible with `test`:

```sh
$ stack test --fast --file-watch
```
