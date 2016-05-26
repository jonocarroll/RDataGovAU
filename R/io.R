setup_ckanr_connection <- function() {
  
   ckanr_setup("http://www.data.gov.au")
 
}

update_known_orgs <- function(img.directory) {
  
  ## 
  orgs <- get_org_list()
  
  if(!dir.exists(img.directory)) dir.create(img.directory)
  
  
}