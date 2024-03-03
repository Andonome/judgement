- [Download PDF][download]
- [Shield][shield]

*The Book of Judgement* lays out the world of the BIND RPG, through procedures and bullet-points.
It lays out creating your own map, step by step, then describes dangerous vegetation, how to harvest basilisk gizzards to create alchemical concoctions, and what scares liches.

# Getting the Book

Download it from the [link][download], then take it to your local, friendly, print-shop.
Everything in the book has been optimized for reading on paper.
Reading two-columns of blinding-white PDF on a monitor will only give you a headache.

## Compiling the Book Yourself

1. Clone this repo.
1. Install the required packages:
    * For Debian/ Mint/ Ubuntu: `inkscape`, `make`, `texlive-full`, `git-lfs`, and `latexmk`.
    * For Arch Linux: `inkscape`, `make`, `texlive-most`, `git-lfs`, and `texlive-binextra`.
    * For Void Linux: `inkscape`, `make`, `texlive-full`, `git-lfs`, and `texlive-latexmk`.
1. Enter the repo, and do `make all`.

For full setup instructions, see the [wiki](https://gitlab.com/bindrpg/core/-/wikis/dev/startup).

# Setting

*Judgement* focusses on the kinds of events you would see in a world of 'wandering monsters'.
How do people trade?
How do they farm?
How do they even survive when anyone might encounter a basilisk on the roll of a '12'?

We begin with the temples which protect people from the gods.
Each one holds a divine monopoly on their protection.
The temple of frost is the guild of weavers, who shields people from death by cold.
The temple of hatred and bigotry make the armourers guild, who craft armour and negotiate peace deals before war arises.

The map isn't cheap.
You will need to set aside an hour (at least), to go through the steps to reveal a map of your little area in Fenestra.

The forests of Fenestra swarm with predators.
...well five.
They have five main predators, and the book takes a long look at how they interact with people and each other, at how they change their environment.

We finish with a few 'GM tips' just for running campaigns in Fenestra, with a troupe of the doomed Night Guard who resist the onslaught of beasts, and fight for civilization.

## Related Books

- For a short introduction module, grab a copy of [Escape from the Horde][intro module], and the pre-gen [character handouts][intro handouts].
- The complete [core rules][core download] are structured mostly as a reference, rather than required reading.
- For a more detailed look at the sentient creatures of Fenestra, print a copy of the [players' guide][stories].

# Compiling

The dependencies are

- `texlive-full`
- `git`
- `git-lfs`
- `inkscape`
- `make`

To make the document,

1. type `make`.
2. Take the pdfs to your local, friendly, printing store.

[core download]: https://gitlab.com/bindrpg/metabind/-/jobs/artifacts/master/raw/complete/core.pdf?job=build
[download]: https://gitlab.com/bindrpg/metabind/-/jobs/artifacts/master/raw/complete/judgement.pdf?job=build
[shield]: https://gitlab.com/bindrpg/metabind/-/jobs/artifacts/master/raw/complete/shield.pdf?job=build
[issues email]: contact-project+bindrpg-judgement-47918887-issue-@incoming.gitlab.com
