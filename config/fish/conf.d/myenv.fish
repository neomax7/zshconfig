### my_env
switch (uname)
case Darwin
  if type most >/dev/null 2>&1
	export PAGER=most
  end
  if type nano >/dev/null 2>&1
	export EDITOR=nano
  end
  if test -S (podman machine inspect| jq '.[].ConnectionInfo.PodmanSocket.Path' | tr -d '"')
	export DOCKER_HOST=unix://(podman machine inspect| jq '.[].ConnectionInfo.PodmanSocket.Path' | tr -d '"')
  end
case Linux
  if test -S $XDG_RUNTIME_DIR/podman/podman.sock
	export DOCKER_HOST=unix://$XDG_RUNTIME_DIR/podman/podman.sock
  end
end
