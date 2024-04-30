# 指定输入文件和输出目录
INPUT_FILE=x_tokenized/all_tokenized.txt
OUTPUT_DIR=x_mlm

# 预处理数据
fairseq-preprocess \
    --only-source \
    --trainpref $INPUT_FILE \
    --destdir $OUTPUT_DIR \
    --workers 20

# 训练模型
fairseq-train $OUTPUT_DIR \
    --task masked_lm \
    --criterion masked_lm \
    --arch roberta_base \
    --optimizer adam \
    --adam-betas '(0.9, 0.98)' \
    --clip-norm 0.0 \
    --lr 0.001 \
    --lr-scheduler polynomial_decay \
    --total-num-update 125000 \
    --warmup-updates 10000 \
    --dropout 0.1 \
    --attention-dropout 0.1 \
    --weight-decay 0.01 \
    --max-sentences 8 \
    --update-freq 16 \
    --max-update 125000 \
    --log-format simple \
    --log-interval 1 \
    --save-dir $OUTPUT_DIR/checkpoints