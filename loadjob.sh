#!/usr/bin/env sh

set -o verbose

# sed "s/{{DATE}}/$(gdate --utc +%Y-%m-%dT%H:%M:%SZ --date "+1 minutes")/" Dockerjob > job
sed "/{{DATE}}/d" Dockerjob > job

curl -L -H 'Content-Type: application/json' -X POST -d @job 10.141.141.10:8081/scheduler/dependency

# rm job
