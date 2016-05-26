setup_ckanr_connection <- function() {
  
  ckanr_setup("http://www.data.gov.au")
  
}

update_known_orgs <- function(img.directory) {
  
  ## 
  orgs <- get_org_list()
  
  if(!dir.exists(path.expand(img.directory))) dir.create(path.expand(img.directory))
  
  failures <- c(character(0))
  
  for (ifile in seq_len(nrow(res))) {
    
    file.name <- orgs$image_display_url[ifile]
    if (file.name != "") {
      file.ext <- tools::file_ext(file.name)
      local.file.name <- paste0(path.expand(img.directory),orgs$name[ifile],".",file.ext)
      
      dl.file = tryCatch({
        # download.file(file.name, local.file.name, method="internal", mode="wb", quiet=TRUE)
        download.file(file.name, local.file.name, method="curl", mode="wb", quiet=TRUE, extra = "-k")
      }, warning = function(w) {
        message(paste0("** Failed to downloaded", local.file.name), appendLF=TRUE)
        # message(w)
        failures <<- c(failures, local.file.name)
      }, error = function(e) {
        message(paste0("** Failed to downloaded", local.file.name), appendLF=TRUE)
        # message(e)
        failures <<- c(failures, local.file.name)
      }, finally = {
        message(paste0("Sucessfully downloaded", local.file.name), appendLF=TRUE)
      })
      
    } else {
      next
    }
  }
  
  if(length(failures)>0) {
    message("\n** Failed to download the following:\n")
    print(failures)
  }
  
}