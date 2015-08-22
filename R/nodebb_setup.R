#' @title Setup NodeBB API
#'
#' @description
#' \code{nodebb_setup} sets the base URL and API token for the environment.
#' @param url NodeBB base url (e.g., 'https://domain.com')
#' @param json_token JSON Web Token Secret
#' @param bearer_token User token
#' @export nodebb_setup
nodebb_setup <- function(url = NULL, json_token = NULL, bearer_token = NULL){
  # Check valid url
  if(grepl(pattern = "http", url)){
    nodebb_url <<- url
  } else {
    stop('Please supply a valid URL.')
  }

  # Prefer json_token
  if(!is.null(json_token) && nchar(json_token) > 0){
    nodebb_token <<- json_token
    nodebb_token_type <<- 'json'
  } else if(!is.null(bearer_token) && nchar(bearer_token) > 0){
    nodebb_token <<- bearer_token
    nodebb_token_type <<- 'bearer'
  } else {
    stop('You must supply an API token.')
  }
}
