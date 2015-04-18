docker inspect -f '{{.Id}},{{.State.Running}},{{.State.FinishedAt}}' $(docker ps -qa) | \
  awk -F, 'BEGIN { TIME=strftime("%FT%T.000000000Z",systime()-60*60*24); } $2=="false" && $3 < TIME {print $1;}' | \
  xargs --no-run-if-empty docker rm >/dev/null 2>/dev/nul
