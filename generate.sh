#!/bin/zsh

SOURCE=./source
OUT=./assets/b1/videos

for file in $SOURCE/*
do
    filename=$(basename "${file%.*}")
    echo Rendering $filename
    ffmpeg -loglevel warning -y -i $file -ss 00:00:00 -t 00:00:05 -aspect 16:9 -s 512x288 $OUT/$filename.mp4
done

echo Done
