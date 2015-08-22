#' @title Post topic reply
#'
#' @description
#' \code{nodebb_topic_reply} replies to an existing topic.
#' @param tid Topic ID
#' @param content String
nodebb_topic_reply <- function(tid = NULL, content = NULL, url = nodebb_url, token = nodebb_token){
  if(is.null(tid) || is.null(content)){
    stop('This function requires the tid and content.')
  }
  tid <- as.integer(tid)
  if(!is.integer(tid)){
    stop('Please supply an integer for tid.')
  }
  api_url <- paste0(nodebb_url, '/api/v1/topics/', tid)

  if(nodebb_token_type == 'json'){
    api_url <- paste0(api_url, '?token=', nodebb_token)
    post_body <- list(content = content, token = token)
    r <- POST(url = api_url, body = post_body, encode = "json")
  } else if(nodebb_token_type == 'bearer'){
    post_body <- list(content = content)
    r <- POST(url = api_url, body = post_body, encode = "json",
              add_headers(Authorization = paste("Bearer", nodebb_token)))
  } else {
    stop('Token not detected. Run nodebb_setup.')
  }
}
