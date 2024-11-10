if type lsd > /dev/null 2>&1
	alias ls='lsd'
end
alias l='ls -alFh'
alias ll='ls -lFh'

if type batcat > /dev/null 2>&1
	alias bat=batcat
end
if type bat > /dev/null 2>&1
	alias cat='bat -pp'
end

if type ugrep > /dev/null 2>&1
	alias grep=ugrep
end

if type nvim > /dev/null 2>&1
	alias vi=nvim
end
