### my_env
switch (uname)
case Darwin
  export PAGER=most
  export EDITOR=nano
  export DOCKER_HOST="unix://$(podman machine inspect| jq '.[].ConnectionInfo.PodmanSocket.Path' | tr -d '"')"
end
