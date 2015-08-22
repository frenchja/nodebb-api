# nodebb-api
R Interface for the [NodeBB Write API](https://github.com/NodeBB/nodebb-plugin-write-api)

# Overview
[NodeBB](https://nodebb.org/) is an actively developed forum software system.  The `nodebb-api` package exposes the various endpoints of the [NodeBB Write API](https://github.com/NodeBB/nodebb-plugin-write-api/blob/master/routes/v1/readme.md).  In doing so, a user can easily post regular updates from R output and obtain data for additional analytics.

# Installation
```r
# install.packages('devtools')
library(devtools)
devtools::install_github(repo = 'frenchja/nodebb-api')
```

# Usage
## Initial Setup
```r
library(nodebb-api)
nodebb_setup(url = "http://www.domain.com", json_token = "random_string")
```

## Post Topic
```r
body <- paste('Today is', Sys.Date())
nodebb_topic_post(cid = 1, content = body, title = 'Test Topic')
```
