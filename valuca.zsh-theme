# name abbreviations (from dieter theme)
typeset -A host_abbrev
typeset -A user_abbrev

# Defines host_abbrev and user_abbrev
source ${ZSH_CUSTOM}/themes/Valcula/abbrevs.zsh

# @host
local host_name="%{$fg[magenta]%}@${host_abbrev[$HOST]:-$HOST}%{$reset_color%}"

# User colored by priviliges (if not overridden in username abbreviation)
local user_name="%(!.%{$fg[blue]%}.%{$fg_bold[magenta]%})${user_abbrev[$USER]:-$USER}%{$reset_color%}"
local path_string="%{$fg[cyan]%}%~"
local prompt_string="ยป"
local time_string="%{$fg[magenta]%}%T"

# Make prompt_string red if the previous command failed (and change bat to duck).
local return_status="%(?:%{$fg[blue]%}๐ฆ$prompt_string:%{$fg[red]%}๐ฆ%?$prompt_string)"

# From agnoster theme; Indicate if background jobs are running
job_status() {
    typeset -a job_running

    if [[ $(jobs -l | wc -l) -gt 0 ]]
    then
        job_running+="%{%F{cyan}%}โ "
    # else # maybe too distracting
    #   job_running+="%{%F{cyan}%}โญ "
    fi

    echo "$job_running"
}

# git-prompt options
ZSH_THEME_GIT_PROMPT_PREFIX="" # "("
ZSH_THEME_GIT_PROMPT_SUFFIX="" # ")"
ZSH_THEME_GIT_PROMPT_SEPARATOR="|"
ZSH_THEME_GIT_PROMPT_BRANCH="๎  %{$fg_bold[magenta]%}"
ZSH_THEME_GIT_PROMPT_STAGED="%{$fg[red]%}%{โ%G%}"
ZSH_THEME_GIT_PROMPT_CONFLICTS="%{$fg[red]%}%{โ%G%}"
ZSH_THEME_GIT_PROMPT_CHANGED="%{$fg[blue]%}%{โ%G%}"
ZSH_THEME_GIT_PROMPT_BEHIND="%{โ%G%}"
ZSH_THEME_GIT_PROMPT_AHEAD="%{โ%G%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{โฆ%G%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%}%{โ%G%}"

# From agnoster theme; Add virtual environment information
virtual_env() {
    typeset -a venv_prompt
    if [[ ! -z "$VIRTUAL_ENV" ]]; then
        # venv_prompt+=" ะฒ:${VIRTUAL_ENV##*/}"
        # Shorten venv name by first occurence of a hyphen (pipenv)
        venv_prompt+=" $(echo "ะฒ:`basename $VIRTUAL_ENV`" | cut -d'-' -f1-1)"
    fi
    echo "${venv_prompt}"
}

# Don't let other actions to the virtual environment prompt interfere
VIRTUAL_ENV_DISABLE_PROMPT=1

# Left prompt
PROMPT='$(job_status)${user_name}${host_name}$(virtual_env) ${path_string} ${return_status} %{$reset_color%}'
# Right prompt
RPROMPT='$(git_super_status) ${time_string}%{$reset_color%}'

# Other symbols (scratch): โ โ โ โกโญ โญฒ
