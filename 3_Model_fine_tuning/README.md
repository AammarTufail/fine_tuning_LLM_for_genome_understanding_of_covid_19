# Fine Tuning LLM for Genome Understanding

## For fine-tuning LLM for genome understanding, we need to follow the following steps:

First, I generated 3 csv files from your dataset: `train.csv`, `dev.csv`, and `test.csv`. In the training process, the model is trained on `train.csv` and is evaluated on the `dev.csv` file. After the training if finished, the checkpoint with the smallest loss on the `dev.csv` file is loaded and be evaluated on `test.csv`. 

> `Note:` If anyone using this repository do not have a validation set, please just make the `dev.csv` and `test.csv` the same. Please see the `fine_tuing_Data` folder as data format. Each file should be in the same format, with the first row as document head named sequence, label. Each following row should contain a DNA sequence and a numerical label concatenated by `a , (e.g., ACGTCAGTCAGCGTACGT, 1 ).`


I followed the following steps to fine-tune the LLM model using shell scripts `.sh` and python scripts instructed on the [github repository](https://github.com/MAGICS-LAB/DNABERT_2?tab=readme-ov-file#62-fine-tune-dnabert2-on-your-own-datasets) of the DNABERT2 model:

Here is the [shell script](./fine_tuning_script.sh) file to fine-tune the model, which can also be seen here:

```bash
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
```



