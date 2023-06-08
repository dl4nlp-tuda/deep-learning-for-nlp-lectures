#!/bin/bash

# Inspired by: https://tex.stackexchange.com/a/1501

# current lecture file name
lecture_filename="dl4nlp2023-lecture08"

# create the output folder (might already exist)
mkdir -p pdf

# Compile the lecture version with pauses

# set empty flags
echo "" > flags.tex

lualatex --jobname=${lecture_filename}-lecture --output-directory=pdf ${lecture_filename}.tex
biber pdf/${lecture_filename}-lecture.bcf
lualatex --jobname=${lecture_filename}-lecture --output-directory=pdf ${lecture_filename}.tex
lualatex --jobname=${lecture_filename}-lecture --output-directory=pdf ${lecture_filename}.tex

# Compile the handout (no slide unfolding)

# set the flag
echo "\handouttrue" > flags.tex

lualatex --jobname=${lecture_filename}-handout --output-directory=pdf ${lecture_filename}.tex
biber pdf/${lecture_filename}-handout.bcf
lualatex --jobname=${lecture_filename}-handout --output-directory=pdf ${lecture_filename}.tex
lualatex --jobname=${lecture_filename}-handout --output-directory=pdf ${lecture_filename}.tex

# Cleaning up temporary latex files
rm -f pdf/*.dvi pdf/*.idx pdf/*.aux pdf/*.toc pdf/*.log pdf/*.bbl pdf/*.blg pdf/*.lof pdf/*.out pdf/*.bcf pdf/*.synctex.gz pdf/*.run.xml pdf/*.nav pdf/*.snm pdf/*.vrb pdf/*.rubbercache
