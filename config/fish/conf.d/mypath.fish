### my_path
if test -d ~/.yarn/bin
	fish_add_path -p "~/.yarn/bin" # /yarn bin
end

if test -d $JAVA_HOME/bin
	fish_add_path -p "$JAVA_HOME/bin" # java bin
end

if test -d ~/.local/bin
	fish_add_path -p "~/.local/bin" # local bin
end

switch (uname)
case Darwin
	if test -d /opt/homebrew/opt/coreutils/libexec/gnubin
	    fish_add_path -a "/opt/homebrew/opt/coreutils/libexec/gnubin" # gnu bins
	end
	if test -d /opt/homebrew/opt/ruby/bin
		fish_add_path -p "/opt/homebrew/opt/ruby/bin" # ruby bin
		fish_add_path -p $(gem environment gemdir)'/bin' # ruby gem bin
	end
	if test -d /opt/homebrew/opt/curl/bin
		fish_add_path -p "/opt/homebrew/opt/curl/bin" # gnu_curl
	end
end
