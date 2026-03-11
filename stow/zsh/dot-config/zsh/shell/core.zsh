# Checks if file exists and sources it if it does
safesource() {
	local dir=$XDG_CONFIG_HOME/zsh/shell
	[[ -f ${dir}/$1 ]] && source ${dir}/$1
}

safesource alias.zsh
safesource environment.zsh
safesource bindings.zsh
safesource completions.zsh
safesource options.zsh
