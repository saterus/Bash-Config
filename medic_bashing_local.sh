# env variables
export SVN="https://svn.vpn.rapleaf.com/main"
export EMACS_HOME=/usr/local/include/emacs/nextstep/Emacs.app/Contents/MacOS/
export HADOOP_HOME=/usr/lib/libhadoop/hadoop
export HADOOP_CONF=/usr/lib/libhadoop/hadoop/conf
export MYSQL_HOME=/opt/local/var/run/mysql5/
export POSTGRES_HOME=/opt/local/lib/postgresql84
export MAVEN_HOME=/apps/atlassian-plugin-sdk-3.1.3/bin
# export CLOJURE_HOME=~/Library/Clojure/
# export ANDROID_HOME=/Users/alex/Library/Android

# path
export PATH=~/.cabal/bin:/usr/local/bin:/usr/local/sbin:/opt/local/bin:/opt/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/usr/local/BerkeleyDB.4.7/lib:$HADOOP_HOME/bin:$JAVA_HOME/include:$MYSQL_HOME:$POSTGRES_HOME:$POSTGRES_HOME/bin:~/rapleaf/bin:$MAVEN_HOME

# alias mysql="/usr/local/mysql/bin/mysql"

# run emacs + emacs daemon from terminal
alias edaemon="/usr/local/include/emacs/nextstep/Emacs.app/Contents/MacOS/Emacs --daemon"
alias eclient="/usr/local/include/emacs/nextstep/Emacs.app/Contents/MacOS/bin/emacsclient"

alias server='ruby script/server'
alias console='ruby script/console'

# dir switching aliases
alias gh="cd $GEM_HOME && echo $GEM_HOME && ls"

