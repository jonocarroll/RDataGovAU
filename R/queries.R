get_org_list <- function() {
  
  res <- organization_list(as="table")
  
  return(res)
  
}