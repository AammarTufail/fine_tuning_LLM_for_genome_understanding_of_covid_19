cd finetune

export DATA_PATH=../GUE  # I used here only virus dataset, but you can use any dataset in this format to fine-tune the model
export MAX_LENGTH=100 # Please set the number as 0.25 * your sequence length. 
											# e.g., set it as 250 if your DNA sequences have 1000 nucleotide bases
											# This is because the tokenized will reduce the sequence length by about 5 times
export LR=3e-5 # Learning rate

# Training use DataParallel
python train.py \
    --model_name_or_path zhihan1996/DNABERT-2-117M \
    --data_path  ${DATA_PATH} \
    --kmer -1 \
    --run_name DNABERT2_${DATA_PATH} \
    --model_max_length ${MAX_LENGTH} \
    --per_device_train_batch_size 8 \
    --per_device_eval_batch_size 16 \
    --gradient_accumulation_steps 1 \
    --learning_rate ${LR} \
    --num_train_epochs 5 \
    --fp16 \
    --save_steps 200 \ # save the model every 200 steps
    --output_dir output/dnabert2 \ # output directory to save the fine tuned model and logs
    --evaluation_strategy steps \
    --eval_steps 200 \
    --warmup_steps 50 \
    --logging_steps 100 \
    --overwrite_output_dir True \
    --log_level info \
    --find_unused_parameters False
    
# Training use DistributedDataParallel (more efficient)
export num_gpu=32 # please change the value based on your setup

torchrun --nproc-per-node=${num_gpu} train.py \
    --model_name_or_path zhihan1996/DNABERT-2-117M \
    --data_path  ${DATA_PATH} \
    --kmer -1 \
    --run_name DNABERT2_${DATA_PATH} \
    --model_max_length ${MAX_LENGTH} \
    --per_device_train_batch_size 8 \
    --per_device_eval_batch_size 16 \
    --gradient_accumulation_steps 1 \
    --learning_rate ${LR} \
    --num_train_epochs 5 \
    --fp16 \
    --save_steps 200 \
    --output_dir output/dnabert2 \
    --evaluation_strategy steps \
    --eval_steps 200 \
    --warmup_steps 50 \
    --logging_steps 100 \
    --overwrite_output_dir True \
    --log_level info \
    --find_unused_parameters False