library(igraph)
library(data.table)

# g <- read_graph('D:/University/PHDResearch/Dev/java/name-matching/matching/out/arxiv_ref_sim_halfRel_and_2tokens_allVs.graphml', format = 'graphml')
# g <- read_graph('D:/University/PHDResearch/Dev/java/name-matching/matching/out/arxiv_ref_sim_halfRel_and_1tokens_allVs.graphml', format = 'graphml')
g <- read_graph('D:/University/PHDResearch/Dev/java/name-matching/matching/out/arxiv_ref1tokens_sim_of_all_levels.graphml', format = 'graphml')

# vcount(g)
# list.vertex.attributes(g)
# list.edge.attributes(g)

# imc <- cluster_infomap(g)
imc <- cluster_louvain(g)
# imc <- cluster_label_prop(g)
# imc <- cluster_fast_greedy(g)
# imc <- cluster_walktrap(g)
# imc <- cluster_leading_eigen(g)
  
# membership(imc)
# communities(imc)

tp= fp= fn = 0
resid_dt <- data.table(k=vertex_attr(g, "res_id"), v=vertex_attr(g, "weight"))
resid_dt <- resid_dt[, .(v=sum(v)), by=.(k)]

for (cluster in communities(imc)) {
# mbrship <- components(g)[[1]]
# for (i in 1:max(mbrship)) {
#   cluster <- which(mbrship == i)
  
  dt <- data.table(k = vertex_attr(g, "res_id")[cluster], v =  vertex_attr(g, "weight")[cluster])
  dt <- dt[, .(v=sum(v)), by=.(k)]
  cluster_ref_cnt <- sum(dt$v)
  
  for (i in 1:nrow(dt)) {
    resid <- dt[i,]$k
    cnt <- dt[i,]$v
    
    tp <- tp + cnt * (cnt - 1) / 2
    fn <- fn + cnt * (resid_dt[which(k == resid), ]$v - cnt)
    fp <- fp + cnt * (cluster_ref_cnt - cnt)
  }
}


precision = tp /(tp + fp)
recall = tp/ (tp + fn)
f1 = 2 * precision * recall / (precision + recall)
sprintf("F1=%f, Precision=%f, Recall=%f", f1, precision, recall)

remove(cnt, i, tp, fn, fp, dt, resid_dt, cluster, cluster_ref_cnt, resid)

# export cluster as a graph
g2 <- set.vertex.attribute(g, 'cluster', value = membership(imc))
g2 <- delete.vertices(simplify(g2), degree(g2)==0)
View(as_data_frame(g2, 'vertices'))
write.graph(g2, 'D:/University/PHDResearch/Dev/java/name-matching/matching/out/arxiv_ref_sim_halfRel_and_2tokens_allVs_Clustered.gml', "gml")
