# GeneRankDetection

GeneRankDetection is a tool used for the early detection of breast cancer based on blood transcriptome, with the capability to integrate multiple batches of gene expression data across multiple platforms.

For a given expression file, it's supposed to have the first column as the gene name, and the first row as the sample name.
There are three steps for the prediction of samples in the expression file:
1. Transform the expression intensity value to relative expression information
1. Expression matrix transpose
1. Predict

We provided a packaged script for the prediction: 
```
rank_to_predict.sh
```

For example:

```
bash rank_to_predict.sh GSE11545.new
```

Output：

```
Sample_Name      Prediction      Probability
gg3      Cancer          0.557142857143
gg2      Healthy         0.614285714286
gg3      Healthy         0.504285714286
gg4      Cancer          0.554285714286
gg5      Cancer          0.597142857143
gg1      Cancer          0.6
gg7      Cancer          0.554285714286
gg7      Cancer          0.597142857143
gg8      Cancer          0.538571428571
gg1      Healthy         0.56
gg0      Cancer          0.557142857143
g9       Healthy         0.62
h3       Healthy         0.515714285714
h6       Healthy         0.652857142857
y6       Healthy         0.515714285714
h7       Healthy         0.571428571429
j9       Healthy         0.614285714286
p0       Healthy         0.515714285714
k9       Healthy         0.614285714286
xx4      Healthy         0.56
```
