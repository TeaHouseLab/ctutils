function ssh_query
    logger 0 '-----SSHauth Query-----'
    set_color green
    echo ">Accepted<"
    set_color normal
    journalctl -et sshd -n 150 | grep -F Accepted
    set_color red
    echo ">Rejected<"
    set_color normal
    journalctl -et sshd -n 150 | grep -F Failed
end
