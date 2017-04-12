export PATH=${PATH}:/Users/T-Mac/Documents/platform-tools/
export PATH=${PATH}:/Users/T-Mac/Documents/apache-tomcat-8.5.11/bin
###############color terminal#################
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
##############################################


##########terminal display like unix#########
PS1="[\u@\h \W]\$"
###################end#######################


###############vi alias == vim #############
alias vi=vim
##################end#######################

###############Custom Variable #############
CurrentDate=`date +%Y-%m-%d:%H:%M:%S`
############################################



#proxy 
LANTERN=127.0.0.1:1080
COW='127.0.0.1:1080'
defp=$COW

# No Proxy
function noproxy
{
    unset http_proxy HTTP_PROXY https_proxy HTTPS_PROXY all_proxy ALL_PROXY ftp_proxy FTP_PROXY dns_proxy DNS_PROXY JAVA_OPTS GRADLE_OPTS MAVEN_OPTS
    echo "clear proxy done"
}


function setproxy
{
    if [ $# -eq 0 ]
    then
        inArg=$defp
    else
        inArg=$1
    fi
    HOST=$(echo $inArg |cut -d: -f1)
    PORT=$(echo $inArg |cut -d: -f2)
    http_proxy=http://$HOST:$PORT
    HTTP_PROXY=$http_proxy

    
    all_proxy=$http_proxy
    ALL_PROXY=$http_proxy
    ftp_proxy=$http_proxy
    FTP_PROXY=$http_proxy
    dns_proxy=$http_proxy
    DNS_PROXY=$http_proxy
    https_proxy=$http_proxy
    HTTPS_PROXY=$https_proxy
    JAVA_OPTS="-Dhttp.proxyHost=$HOST -Dhttp.proxyPort=$PORT -Dhttps.proxyHost=$HOST -Dhttps.proxyPort=$PORT"
    GRADLE_OPTS="-Dgradle.user.home=$HOME/.gradle"
    MAVEN_OPTS=$JAVA_OPTS
    no_proxy="localhost,127.0.0.1,localaddress,.localdomain.com,.coding.net,192.168.99.100,.ruby-china.org"
    echo "current proxy is ${http_proxy}"
    export no_proxy http_proxy HTTP_PROXY https_proxy HTTPS_PROXY all_proxy ALL_PROXY ftp_proxy FTP_PROXY dns_proxy DNS_PROXY JAVA_OPTS GRADLE_OPTS MAVEN_OPTS
}

#setproxy
