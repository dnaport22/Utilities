#!/bin/bash

# In the example below I'm storing base url as an angular constant.

load_url() {
  echo "Generating Base Urls for environment ..."
  
  branch=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')
  case $branch in
    master)
      echo "app.constant('BASE_URL', 'http://production-env.url/')" > js/base_url.js
      ;;
    develop)
      echo "app.constant('BASE_URL', 'http://develop-env.url/')" > js/base_url.js
      ;;
    *)
      echo "app.constant('BASE_URL', 'http://develop-site.url/')" > js/base_url.js
      ;;
  esac
}

# Example
run_app() {
  load_url
  ionic serve
}

$1