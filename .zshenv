# Turn on proxy environmental variables.
proxy(){
    export http_proxy=http://%4535%2F3342%2F2012%40students:5st%40uon@proxy.uonbi.ac.ke:80/
    export https_proxy=http://%4535%2F3342%2F2012%40students:5st%40uon@proxy.uonbi.ac.ke:80/
    export rsync_proxy=http://%4535%2F3342%2F2012%40students:5st%40uon@proxy.uonbi.ac.ke:80/
    export ftp_proxy=http://%4535%2F3342%2F2012%40students:5st%40uon@proxy.uonbi.ac.ke:80/

    export HTTP_PROXY=http://%4535%2F3342%2F2012%40students:5st%40uon@proxy.uonbi.ac.ke:80/
    export HTTPS_PROXY=http://%4535%2F3342%2F2012%40students:5st%40uon@proxy.uonbi.ac.ke:80/
    export FTP_PROXY=http://%4535%2F3342%2F2012%40students:5st%40uon@proxy.uonbi.ac.ke:80/
    export RSYNC_PROXY=http://%4535%2F3342%2F2012%40students:5st%40uon@proxy.uonbi.ac.ke:80/
}

# Turn off proxy environmental variables.
proxyoff(){
    unset http_proxy
    unset https_proxy
    unset rsync_proxy
    unset ftp_proxy

    unset HTTP_PROXY
    unset HTTPS_PROXY
    unset FTP_PROXY
    unset RSYNC_PROXY
}
