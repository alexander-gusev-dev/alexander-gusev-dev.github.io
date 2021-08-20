#!/bin/zsh

SOURCE=./source
OUT=./assets/b1/videos

for file in $SOURCE/*
do
    filename=$(basename "${file%.*}")
    echo Rendering $filename
    # ffmpeg -loglevel warning -y -i $file -ss 00:00:00 -t 00:00:05 -aspect 16:9 -s 512x288 $OUT/$filename.mp4
    ffmpeg \
        -y \
        -i $file \
        -vcodec libwebp \
        -filter:v fps=fps=20 \
        -lossless 0 \
        -compression_level 3 \
        -q:v 70 \
        -loop 0 \
        -preset picture \
        -an \
        -vsync 0 \
        -s 512:288 \
        -ss 00:00:00 \
        -t 00:00:05 \
        $OUT/$filename.webp
done

echo Done
