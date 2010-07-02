# Emacs settings
export EDITOR="vi"
export SVN_EDITOR="vi"

# Terminal Prompt Settings
# export PS1="[\u@\h \W]\\$ "
# export PS2="> " 
# export PS1="§ "
# ֆ ☣ 
# export PS1="\e[0;36m[\u@\h \W]\\$\e[m "
export PS1="[\u@\h \W]\\$ "
export PS2="> "

#Apt-related aliases
alias gimme="sudo apt-get install"            #Install new software
alias acs="aptitude search"                    #Search available packages
alias purge="apt-get --purge remove"        #Removes package and its config files
alias aptu="sudo apt-get update"
alias debclean="sudo apt-get clean &amp;&amp; sudo apt-get autoremove"  #Removes some unneeded files

# useful svn stuff
alias svnst="svn st --ignore-externals | grep -v '^X'"
alias svnup="svnup-fast"
alias svnls="svn ls -v | sort -nr"
function svnba() { svn blame "$@" | awk '{print $2}' | sort | uniq -c | sort -nr; }


#Misc useful aliases
alias ll="ls -lF"                         #Detailed list in long format
alias la="ls -lFa"                         #Detailed list with hidden files
alias config="dpkg-reconfigure"                #Re-run the configuration step for a package
alias cmi="./configure &amp;&amp; make &amp;&amp; sudo make install"    #Common steps to install package from source
alias numfiles="echo $(ls -1 | wc -l)"          #Count the number of files in current directory
alias psx="ps aux"
alias psg="ps aux | grep -E"
alias targets="grep --color=never \"<target\" build.xml | sed -e 's/^.*name=\"\([^\"]*\)\".*$/\1/g' | sort"


alias vgrep="grep -v "$@""
alias where="find . | xargs grep -s "$@" | grep -sv "svn" | grep -sE --color=ALWAYS "$@""
alias where2="find . | xargs grep -s"$@" | grep -sv "svn" | grep -sE "$@""

function linecount() { where2 "$@" | wc -l; }
function set_title() { TITLE="$1"; PROMPT_COMMAND='echo -ne "\033]0;${TITLE} - ${USER}@${HOSTNAME}: ${PWD}\007"'; }
function set_short_title() { TITLE="$1"; PROMPT_COMMAND='echo -ne "\033]0;${TITLE}\007"'; }
alias sst="set_short_title"


alias i="pwd && echo "${USER}@${HOSTNAME}""
alias logs="wc -l log/* | grep -v -E \"^ +[0|1] \w\""

