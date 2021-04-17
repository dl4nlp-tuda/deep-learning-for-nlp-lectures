# Deep Learning for Natural Language Processing - Lectures 2021

This repository contains slides for the course "20-00-0947: Deep Learning for Natural Language Processing" (Technical University of Darmstadt, Summer term 2021)

The slides are available as PDF as well as LaTeX source code (I've used Beamer because typesetting mathematics in PowerPoint or similar tools is painful)

![Logo](https://upload.wikimedia.org/wikipedia/commons/thumb/d/d0/CC-BY-SA_icon.svg/88px-CC-BY-SA_icon.svg.png)

The content is licenced under [Creative Commons CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/) which means that you can re-use, adapt, modify, or publish it further, provided you keep the license and give proper credits.

Accompanying video lectures are linked on YouTube

## Lecture 1

* Topics: Kick-off (challenges in NLP, Deep Learning in NLP, Terminology, History of DL, Perceptron)
* [Slides as PDF](/pdf/dl4nlp2021-lecture01-video.pdf)
* [YouTube video](https://youtu.be/AbmAFprJhJo)

## Lecture 2

* Topics: Machine learning basics, Cross-validation, Evaluation, Loss functions
* [Slides as PDF](/pdf/dl4nlp2021-lecture02-video.pdf)
* [YouTube video](https://youtu.be/ncoMF4zURSw) (to be released publicly on Tuesday, April 20, 2021)

## Compiling slides to PDF

If you run a linux distribution (e.g, Ubuntu 20.04 and newer), all packages are provided as part of `texlive`. Install the following packages

```plain
$ sudo apt-get install texlive-latex-recommended texlive-pictures texlive-latex-extra \
texlive-fonts-extra texlive-bibtex-extra texlive-humanities texlive-science \
texlive-luatex biber wget -y
```

Install Fira Sans fonts required by the beamer template locally

```plain
$ wget https://github.com/mozilla/Fira/archive/refs/tags/4.106.zip -O 4.106.zip \
&& unzip -o 4.106.zip && mkdir -p ~/.fonts/FiraSans && cp Fira-4.106/otf/Fira* \
~/.fonts/FiraSans/ && rm -rf Fira-4.106 && rm 4.106.zip && fc-cache -f -v && mktexlsr
```
Compile each lecture's slides using ``lualatex``

```$ lualatex dl4nlp2021-lecture*.tex && biber dl4nlp2021-lecture*.bcf && \
lualatex dl4nlp2021-lecture*.tex && lualatex dl4nlp2021-lecture*.tex
```
