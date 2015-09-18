##############################################################################################
#
# My first R program: It's a simple script to read some CSV, and join them into a single file
#
# Date: 10/09/2015
#
# Author: Pedro A. Alonso Baigorri
#
#


library(data.table)

rm(list=ls())
gc()


a<-fread("D:/DATOS CHURN_COLOMBIA/SOLAPAMIENTO/ProbsBaseEnsambladoSinTrain.csv", header = TRUE, sep = ";", colClasses = "character")
b<-fread("D:/DATOS CHURN_COLOMBIA/SOLAPAMIENTO/MCK_201505.txt", header = TRUE, sep = "|", colClasses = "character")

setkeyv(a, "Pseudo_Id")
setkeyv(b, "KEY")

length(unique(a$Pseudo_Id))
length(unique(b$KEY))

c=unique(a)
d=unique(b)

#rm(a,b)


e<-merge.data.frame(c,d, by.x="Pseudo_Id", by.y="KEY")

#rm(c,d)

length(unique(e$Pseudo_Id))

write.table(e, file="D:/DATOS CHURN_COLOMBIA/SOLAPAMIENTO/scoring_solapamiento_v3_sin_training.csv", col.names = TRUE, row.names=FALSE, sep=";")

