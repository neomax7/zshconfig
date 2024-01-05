### my_path
fish_add_path -p "~/.yarn/bin" # /yarn bin
fish_add_path -p "$JAVA_HOME/bin" # java bin
fish_add_path -p "~/.local/bin" # local bin

switch (uname)
case Darwin
    fish_add_path -a "/opt/homebrew/opt/coreutils/libexec/gnubin" # gnu bins
    fish_add_path -p "/opt/homebrew/opt/ruby/bin" # ruby bin
    fish_add_path -p "/opt/homebrew/opt/curl/bin" # gnu_curl
end
