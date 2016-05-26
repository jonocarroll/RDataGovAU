get_org_list <- function() {
  
  res <- organization_list(as="table")
  
  return(res)
  
}

search_data <- function(query) {
  
  ds_search(q=query, plain=TRUE, as="table")
  
}