set starshipbin (type -p starship)
source ($starshipbin init fish --print-full-init | psub)
