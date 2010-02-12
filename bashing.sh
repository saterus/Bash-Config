
# Emacs settings
export EDITOR="emacsclient -c"
export SVN_EDITOR="emacsclient -t"
alias nox="emacsclient -tty"
alias ec="emacsclient"
alias ed="emacsdaemon"

# Terminal Prompt Settings
export PS1="[\u@\h \W]\\$ "
export PS2="> " 
# export PS1="∴ "
# export PS2="."

# Fixes terminal colors
export LS_COLORS='no=00:fi=00:di=01;93:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.svgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.lzma=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.rar=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:';

#Apt-related aliases
alias gimme="sudo apt-get install"            #Install new software
alias acs="aptitude search"                    #Search available packages
alias purge="apt-get --purge remove"        #Removes package and its config files
alias aptu="sudo apt-get update"
alias debclean="sudo apt-get clean &amp;&amp; sudo apt-get autoremove"  #Removes some unneeded files

#Misc useful aliases
alias svnst="svn st --ignore-externals | grep -v '^X'"
alias ll="ls -l"                         #Detailed list in long format
alias la="ls -la"                         #Detailed list with hidden files
alias config="dpkg-reconfigure"                #Re-run the configuration step for a package
alias cmi="./configure &amp;&amp; make &amp;&amp; sudo make install"    #Common steps to install package from source
alias numfiles="echo $(ls -1 | wc -l)"          #Count the number of files in current directory
alias psx="ps aux"
alias psg="ps aux | grep -E"

# Changes directory and prints contents
function cdd() { cd "$1" && ls -l; }

alias vgrep="grep -v "$@""
alias where2="find . | xargs grep -v "\.svn" | grep -v "svn-base" | grep -E --color=ALWAYS "$@""
alias where3="find . | xargs grep -v "\.svn" | grep -v "svn-base" | grep -E "$@""
function where() { find . | grep -v .svn | xargs grep "$1"; }
function linecount() { find . | xargs grep "^.*[^ ]+$" -E | grep -v .svn | wc -l; }
function set_title() { TITLE="$1"; PROMPT_COMMAND='echo -ne "\033]0;${TITLE} - ${USER}@${HOSTNAME}: ${PWD}\007"'; }
function set_short_title() { TITLE="$1"; PROMPT_COMMAND='echo -ne "\033]0;${TITLE}\007"'; }
alias sst="set_short_title"

alias i="pwd && echo "${USER}@${HOSTNAME}""
alias logs="wc -l log/* | grep -v -E \"^ +[0|1] \w\""
