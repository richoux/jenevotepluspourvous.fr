#!/bin/bash

for i in $(cat deputes.txt)
do
    wget http://www.nosdeputes.fr/depute/photo/$i/160 ; mv 160 photos/$i.jpg
done
