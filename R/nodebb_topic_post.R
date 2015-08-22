#' @title Post new topic
#'
#' @description
#' \code{nodebb_topic_posts} posts a new topic to a given category.
#' @param cid Category ID
#' @param content String
#' @param title Topic title
#' @export nodebb_topic_post
nodebb_topic_post <- function(cid = NULL, content = NULL, title = NULL, url = nodebb_url, token = nodebb_token){
  api_url <- paste0(nodebb_url, '/api/v1/topics')
  if(is.null(cid) || is.null(content) || is.null(title)){
    stop('This function requires the cid, title, and content.')
  }
  cid <- as.integer(cid)
  if(!is.integer(cid)){
    stop('Please supply an integer for cid.')
  }
  if(nodebb_token_type == 'json'){
    api_url <- paste0(api_url, '?token=', nodebb_token)
    post_body <- list(title = title, content = content, cid = cid, token = token)
    r <- POST(url = api_url, body = post_body, encode = "json")
  } else if(nodebb_token_type == 'bearer'){
    post_body <- list(title = title, content = content, cid = cid)
    r <- POST(url = api_url, body = post_body, encode = "json",
              add_headers(Authorization = paste("Bearer", nodebb_token)))
  } else {
    stop('Token not detected. Run nodebb_setup.')
  }
}
