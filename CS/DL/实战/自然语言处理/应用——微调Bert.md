在微调期间，不同应用之间的BERT所需的“最小架构更改”是额外的全连接层。在下游应用的监督学习期间，额外层的参数是从零开始学习的，而预训练BERT模型中的所有参数都是微调的。

![../_images/bert-one-seq.svg](imags/bert-one-seq.svg)