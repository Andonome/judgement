# Judgement

|             Downloads                |         Resources             |
|:-------------------------------------|:------------------------------|
| [Download][judgement]                | [Wiki][wiki]                  | 
| [Judge Shield][shield]               | [World Wiki][fenwiki]         |
| [Condensed Rules][rules]             | [Email an idea][issues email] |
| [Introduction Module][goblin hole]   | [Issues Board][board]         |

*The Book of Judgement* lays out the world of the BIND RPG, through procedures and bullet-points.
It lays out creating your own map, step by step, then describes dangerous vegetation, how to harvest basilisk gizzards to create alchemical concoctions, and what scares liches.

# Getting the Book

Download it from the [link][judgement], then take it to your local, friendly, print-shop.
Everything in the book has been optimized for reading on paper.
Reading two-columns of blinding-white PDF on a monitor will only give you a headache.

## Compiling the Book Yourself

1. Install the required packages:
    * For Debian/ Mint/ Ubuntu: `apt install inkscape make texlive-full git-lfs latexmk`.
    * For Arch Linux: `pacman -S inkscape make git git-lfs texlive-binextra texlive-latexextra texlive-fontsrecommended texlive-fontsextra && git lfs install`
    * For Void Linux: `xbps-install inkscape make texlive-full git-lfs texlive-latexmk`.
1. Clone this repo.
1. Enter the repo, and do `make all`.

For full setup instructions, see the [wiki][compiling].

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

- For a short introduction module, grab a copy of [the Goblin Hole][goblin hole].
- The complete [core rules][core] are structured mostly as a reference, rather than required reading.
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

[rules]: https://gitlab.com/bindrpg/config/-/jobs/artifacts/master/raw/booklet.pdf?job=build
[wiki]: https://gitlab.com/bindrpg/core/-/wikis/home
[fenwiki]: https://gitlab.com/bindrpg/aif/-/wikis/home
[compiling]: https://gitlab.com/bindrpg/core/-/wikis/dev/Compiling
[issues email]: mailto:contact-project+bindrpg-judgement-47918887-issue-@incoming.gitlab.com
[board]: https://gitlab.com/bindrpg/judgement/-/issues
[shield]: https://gitlab.com/bindrpg/metabind/-/jobs/artifacts/master/raw/complete/shield.pdf?job=build
[core]: https://gitlab.com/bindrpg/metabind/-/jobs/artifacts/master/raw/complete/Core_Rules.pdf?job=build
[stories]: https://gitlab.com/bindrpg/metabind/-/jobs/artifacts/master/raw/complete/Stories.pdf?job=build
[judgement]: https://gitlab.com/bindrpg/metabind/-/jobs/artifacts/master/raw/complete/Judgement.pdf?job=build
[goblin hole]: https://gitlab.com/bindrpg/aif/-/jobs/artifacts/master/raw/The_Goblin_Hole.pdf?job=build
[shield]: https://gitlab.com/bindrpg/metabind/-/jobs/artifacts/master/raw/complete/shield.pdf?job=build
