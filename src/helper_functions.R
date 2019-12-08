require(data.table)

'%!in%' <- function(x,y)!('%in%'(x,y))

dt.append = function(table1, table2){
  return(rbindlist(list(table1,table2), use.names=FALSE))
}

add.id.columns = function(base_table, node_table_from, node_table_to){
  joined <- merge(
    merge(base_table, node_table_from, by.x = 'from_val', by.y = 'val')
    , node_table_to
    , by.x = 'to_val', by.y = 'val'
    ) # join from and to ids
  return(joined[, c('id.x', 'id.y', 'from_val', 'to_val', 'type', 'weight.x')])
}
