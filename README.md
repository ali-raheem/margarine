# Margarine  v0.1.1
Simple anigram finder in Haskell. Aiming to be functional equivalent to anigramer.

├── LICENSE       GPL v3
├── margarine     Prebuilt static binary
├── margarine.hs  The Source
└── README.md     This readme

## Building

By default ghc will build a statically linked binary which weighs in at about 2.2MB, this is how the pre-built binary is made.

ghc --make -O2 margarine.hs


To get a smaller dynamically linked one about 25KB use the -dynamic flag.

ghc --make -O2 -dynamic margarine.hs

## Usage

./margarine word_list

### Example

./margarine /usr/share/dict/american-english
Enter letters: anigramer
margarine

### Todo

1. Handle not getting any arguments
