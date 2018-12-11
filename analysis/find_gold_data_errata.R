library(data.table)
set.seed(45L)

comp_dt <- fread("data/nodes_component.csv")
comp_mult_ids <- comp_dt[ , .(cnt_dist = uniqueN(res_id)), by=.(componentnumber)][cnt_dist > 1]
comp_mashkook <- merge(comp_mult_ids, comp_dt, by="componentnumber")[order(cnt_dist, componentnumber)]
fwrite(comp_mashkook, "data/nodes_component_mashkook.csv")
remove(comp_dt, comp_mult_ids)
