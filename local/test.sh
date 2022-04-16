#!/bin/bash

# rm ~/tmp/mysql/slow.log
bash localApiTestOnly.sh > result.log
cat ~/tmp/mysql/slow.log | docker run -i --rm matsuu/pt-query-digest > analyzed-slow.log
