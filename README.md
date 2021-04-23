# Deep Learning for Natural Language Processing - Lectures 2021

This repository contains slides for the course "20-00-0947: Deep Learning for Natural Language Processing" (Technical University of Darmstadt, Summer term 2021). 

This online course is taught by [Ivan Habernal](https://www.trusthlt.org) and [Mohsen Mesgar](https://mohsen-mesgar.io). 

The slides are available as PDF as well as LaTeX source code (we've used Beamer because typesetting mathematics in PowerPoint or similar tools is painful)

![Logo](https://upload.wikimedia.org/wikipedia/commons/thumb/d/d0/CC-BY-SA_icon.svg/88px-CC-BY-SA_icon.svg.png)

The content is licenced under [Creative Commons CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/) which means that you can re-use, adapt, modify, or publish it further, provided you keep the license and give proper credits.

Accompanying video lectures are linked on YouTube

## Lecture 1

* Topics: Kick-off (challenges in NLP, Deep Learning in NLP, Terminology, History of DL, Perceptron)
* [Slides as PDF](/pdf/dl4nlp2021-lecture01-video.pdf)
* [YouTube video](https://youtu.be/AbmAFprJhJo)

## Lecture 2

* Topics: Machine learning basics, Cross-validation, Evaluation, Loss functions
* [Slides as PDF (as in video)](/pdf/dl4nlp2021-lecture02-video.pdf), [Slides as PDF (updated)](/pdf/dl4nlp2021-lecture02-with-fixed-issues.pdf)
* [YouTube video](https://youtu.be/ncoMF4zURSw)

## Lecture 3

* Topics: Training as optimization and (neural) language models 
* [Slides as PDF](/pdf/dl4nlp2021-lecture03-video.pdf)
* [YouTube video](https://youtu.be/m3PeX3lYyBc)


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

```plain
$ lualatex dl4nlp2021-lecture*.tex && biber dl4nlp2021-lecture*.bcf && \
lualatex dl4nlp2021-lecture*.tex && lualatex dl4nlp2021-lecture*.tex
```

### Compiling slides using Docker

If you don't run a linux system or don't want to mess up your latex packages, I've tested compiling the slides in a Docker.

Install Docker ( https://docs.docker.com/engine/install/ )

Create a folder to which you clone this repository (for example, `$ mkdir -p /tmp/slides`)

Run Docker with Ubuntu 20.04 interactively; mount your slides directory under `/mnt` in this Docker container

```plain
$ docker run -it --rm --mount type=bind,source=/tmp/slides,target=/mnt \
ubuntu:20.04 /bin/bash
```

Once the container is running, update, install packages and fonts as above

```plain
# apt-get update && apt-get dist-upgrade -y && apt-get install texlive-latex-recommended \
texlive-pictures texlive-latex-extra texlive-fonts-extra texlive-bibtex-extra \
texlive-humanities texlive-science texlive-luatex biber wget -y
```

Fonts

```plain
# wget https://github.com/mozilla/Fira/archive/refs/tags/4.106.zip -O 4.106.zip \
&& unzip -o 4.106.zip && mkdir -p ~/.fonts/FiraSans && cp Fira-4.106/otf/Fira* \
~/.fonts/FiraSans/ && rm -rf Fira-4.106 && rm 4.106.zip && fc-cache -f -v && mktexlsr
```

And compile

```plain
# cd /mnt/dl4nlp/latex/lecture01
# lualatex dl4nlp2021-lecture*.tex && biber dl4nlp2021-lecture*.bcf && \
lualatex dl4nlp2021-lecture*.tex && lualatex dl4nlp2021-lecture*.tex
```

which generates the PDF in your local folder (e.g, `/tmp/slides`).
