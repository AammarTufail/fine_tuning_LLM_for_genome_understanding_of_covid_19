# **Literature Review- Genome Understanding using LLMs**
**Author:** `Muhammad Aammar Tufail (Ph.D.)`

## `Overview`

The purpose of this literature review is to investigate the use of large language models (LLMs) for understanding genomic sequences, specifically `FASTA` sequences. As genomics is a data-rich field, the ability to effectively analyze and interpret these sequences is essential for advances in` Bioinformatics`, `Biotechnology` and `Personalized Medicine`. This review explores the commonly used models for analyzing genomic data, the format requirements of training data, the amount of data typically used in related studies, and whether there are existing pretrained models suitable for this problem.

### `Key Questions to Address`
- Which models are commonly used for genomic sequence analysis?
- What format must the training data have?
- How much training data is typically used for similar problems?
- Are there pretrained models available for genomic sequence analysis using LLMs?

Approaches or solutions that have been tried before on similar projects.

**Summary of Each Work**:

- **Source 1**: `DNABERT: pre-trained Bidirectional Encoder Representations from Transformers model for DNA-language in genome`

  - **[Link](https://academic.oup.com/bioinformatics/article/37/15/2112/6128680?login=false)**
  - **Objective**: 
    - To adapt large language models (LLMs) to effectively interpret and analyze DNA sequences from genomic FASTA files, enhancing their ability to predict and understand genomic elements.
  - **Methods**:
    - `Tokenization:` DNA sequences are converted into k-mer tokens, which capture contextual information by representing overlapping sequences.
    - `Pre-training:` The model learns DNA syntax and semantics through self-supervision, using masked language modeling on sequences from the human genome.
    - `Attention Mechanism:` DNABERT uses a multi-head self-attention mechanism to capture global contextual information from the entire input sequence
    - `Fine-tuning:` The pre-trained model is fine-tuned with task-specific data to predict genomic elements like promoters and splice sites.
  - **Outcomes**: 
    - `Improved Prediction Accuracy:` DNABERT achieves state-of-the-art performance in predicting genomic elements such as promoters, splice sites, and transcription factor binding sites, even with limited task-specific labeled data
    - `Cross-Organism Applicability:` The pre-trained DNABERT model, initially trained on the human genome, can be effectively applied to other organisms, demonstrating exceptional performance across different species
  - **Relation to the Project**:
    - This approach aligns with the project's aim to leverage advanced LLM pretraining techniques for genomic analysis, providing a robust framework for understanding complex DNA sequences and facilitating cross-organism genomic studies.

- **Source 2**: `DNABERT-2: Efficient Foundation Model and Benchmark For Multi-Species Genomes`

  - **[Link](https://arxiv.org/html/2306.15006v2)**
  - **Objective**: 
    - To enhance the understanding of genome sequences by fine-tuning large language models (LLMs) using efficient tokenization and model adaptation techniques.
  - **Methods**: 
    - Replace traditional k-mer tokenization with Byte Pair Encoding (BPE) to improve computational efficiency and overcome sample inefficiencies.
    - Utilize Attention with Linear Biases (ALiBi) and Low-Rank Adaptation (LoRA) to handle long sequences and optimize model parameters for genomic data.
    - Implement standard fine-tuning with specific hyperparameters like learning rate and batch size for models like DNABERT and DNABERT-2.
  - **Outcomes**: 
    - DNABERT-2 achieves comparable performance to state-of-the-art models with significantly fewer parameters and reduced GPU time, demonstrating efficiency in genome understanding tasks.
  - **Relation to the Project**: 
    - The methods and outcomes provide a framework for fine-tuning LLMs to effectively process and understand DNA sequences in FASTA files, aligning with the project's goal of improving genome analysis.

- **Source 3**: `The Nucleotide Transformer: Building and Evaluating Robust Foundation Models for Human Genomics`

  - **[Link](https://www.biorxiv.org/content/10.1101/2023.01.11.523679v3)**
  - **Objective**:
    - To bridge the gap between genetic information and observable traits by predicting molecular phenotypes from DNA sequences using foundation models pre-trained on DNA sequences.  
  - **Methods**:
    - Utilize transformer models, named the Nucleotide Transformer, pre-trained on a large dataset of DNA sequences from diverse genomes.
    - Fine-tune these models in low-data settings to solve various genomics applications, focusing on key genomic elements like enhancers.
  - **Outcomes**:
    - Achieved accurate molecular phenotype predictions even with limited data.
    - Improved prioritization of functional genetic variants using model representations.
  - **Relation to the Project**:
    - The study demonstrates the potential of using pre-trained models for genomic data, which can be applied to understand and analyze DNA sequences in FASTA files effectively.

- **Source 4**: `BioGPT: generative pre-trained transformer for biomedical text generation and mining`

  - **[Link](https://academic.oup.com/bib/article/23/6/bbac409/6713511)**
  - **Objective**:
    - The paper discusses the development of BioGPT, a generative pre-trained transformer model specifically designed for biomedical text generation and mining. While it does not directly address genomic data, the objective is to enhance the model's ability to handle domain-specific tasks in the biomedical field.
  - **Methods**:
    - BioGPT is pre-trained on large-scale biomedical literature, which involves using a vast corpus of domain-specific texts to fine-tune the model's understanding and generation capabilities. This approach could be adapted for genomic data by using a corpus of DNA sequences in FASTA format for pre-training.
  - **Outcomes**:
    - The model demonstrates superior performance on various biomedical NLP tasks, such as relation extraction and question answering, indicating its potential effectiveness in understanding complex domain-specific data.
  - **Relation to the Project**:
    - While the paper does not specifically address genomic data, the methods and outcomes of BioGPT suggest a framework that could be adapted for fine-tuning LLMs to understand genomic sequences by using a similar pre-training approach with genomic data.


----------------------------------------------------------------------------------------------------------------------------
> ## Summary of Key Findings
>1. **Common Models**: The most common models used for genomic sequence analysis are transformer-based architectures, including DNABERT1, DNABERT2, NT, and BioGPT. These models, when adapted to biological data, show significant promise in understanding complex genomic structures.
>2. **Training Data Format**: Genomic data must be preprocessed and tokenized into formats that these LLMs can handle. FASTA sequences are often converted into tokenized sequences of nucleotides, which serve as input data for the models.
>3. **Amount of Training Data**: Similar problems typically require large amounts of training data, often millions of sequences, to ensure that the models can capture the diverse and complex patterns found in genomic data.
>4. **Pretrained Models**: While there are pretrained models such as BioGPT and DNABERT, these models often require additional fine-tuning on specific genomic tasks to achieve optimal performance. Researchers may need to train their own models if domain-specific tasks are highly specialized.

> ## Conclusion
>The use of large language models in genomics, specifically for analyzing FASTA sequences, represents an exciting frontier in computational biology. Pretrained models such as DNABERT and BioGPT provide a strong starting point, but substantial training data and fine-tuning are often required for specific applications. The ability of LLMs to learn complex patterns within genomic sequences offers significant potential for advancing personalized medicine and biotechnological research.
---


