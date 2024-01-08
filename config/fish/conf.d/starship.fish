if test -e (type -p starship) >/dev/null 2>&1
   source (starship init fish --print-full-init | psub)
end
