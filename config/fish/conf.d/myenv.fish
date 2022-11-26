### my_env
switch (uname)
case Darwin
  if type most > /dev/null 2>&1
	export PAGER=most
  end
  if type nano > /dev/null 2>&1
	export EDITOR=nano
  end
  if type podman > /dev/null 2>&1
    if test -S (podman machine inspect| jq '.[].ConnectionInfo.PodmanSocket.Path' | tr -d '"')
  	export DOCKER_HOST=unix://(podman machine inspect| jq '.[].ConnectionInfo.PodmanSocket.Path' | tr -d '"')
    end
  end
case Linux
  if set -q XDG_RUNTIME_DIR
    if test -S $XDG_RUNTIME_DIR/podman/podman.sock
  	export DOCKER_HOST=unix://$XDG_RUNTIME_DIR/podman/podman.sock
    end
  end
end
