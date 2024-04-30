MLM_PATH=../mlm

fairseq-train \
    data-bin/multilingual_translation \
    --encoder-from-pretrained $MLM_PATH \
    --arch transformer --share-all-embeddings \
    --encoder-layers 12 --decoder-layers 12 \
    --encoder-embed-dim 512 --decoder-embed-dim 512 \
    --encoder-ffn-embed-dim 2048 --decoder-ffn-embed-dim 2048 \
    --encoder-attention-heads 8 --decoder-attention-heads 8 \
    --max-epoch 50 --save-interval 1 \
    --optimizer adam --adam-betas '(0.9, 0.98)' --clip-norm 0.0 \
    --lr-scheduler inverse_sqrt --warmup-updates 4000 --warmup-init-lr 1e-7 \
    --lr 0.0005 --min-lr 1e-9 \
    --criterion label_smoothed_cross_entropy --label-smoothing 0.1 \
    --weight-decay 0.0001 \
    --dropout 0.3 --attention-dropout 0.1 --relu-dropout 0.1 \
    --max-tokens 4000