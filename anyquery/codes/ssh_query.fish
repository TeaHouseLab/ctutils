function ssh_query
    logger 0 '-----SSHauth Query-----'
    set_color green
    echo ">Accepted<"
    set_color normal
    zgrep sshd /var/log/auth.log* -h | grep -F Accepted
    set_color red
    echo ">Rejected<"
    set_color normal
    zgrep sshd /var/log/auth.log* -h | grep -F Failed
end
