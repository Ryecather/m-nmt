#!/bin/bash

# 指定分词模型的路径
MODEL_PATH=data/x_langs.txt-sp-48000.model

# 指定输入和输出目录
INPUT_DIR=data/x_data
OUTPUT_DIR=x_tokenized

# 创建输出目录
mkdir -p $OUTPUT_DIR

# 对每个文件进行分词
for file in $INPUT_DIR/*; do
    filename=$(basename -- "$file")
    output_file="$OUTPUT_DIR/${filename%.*}_tokenized.txt"
    spm_encode --model=$MODEL_PATH --output_format=piece < $file > $output_file
done

# 合并所有分词后的文件
cat $OUTPUT_DIR/*_tokenized.txt > $OUTPUT_DIR/all_tokenized.txt