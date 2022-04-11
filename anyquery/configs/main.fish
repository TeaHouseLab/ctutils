set -lx prefix '[anyquery]'
switch $argv[1]
    case xray
        xray_query $argv[2] $argv[3]
    case hysteria
        hysteria_query $argv[2]
    case ssh
        ssh_query
    case v version
        logger 0 'QuickSliverR@build1'
    case '*'
        help_echo
end
