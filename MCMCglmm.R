library(ape)
library(MCMCglmm)

setwd("Path_to/Data.txt")
data <- read.table("Data.txt",sep = "\t",header = TRUE)
Tree <- read.tree("Tree.phy")
data <- data[data$Name %in% Tree$tip.label,]

inv_phylo <- inverseA(Tree, nodes = "TIPS", scale = FALSE)

prior <- list(
  G = list(G1 = list(V = 1, nu = 0.002)),
  R = list(V =1, nu = 0.002)
)

model <- MCMCglmm(
  log2 ~ Diet,
  random = ~ Name,
  family = "gaussian",
  ginverse = list(Name = inv_phylo$Ainv),
  prior = prior,
  data = data,
  nitt = 130000,
  burnin = 30000,
  thin = 10
)
summary(model)
