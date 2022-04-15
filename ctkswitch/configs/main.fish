set -lx prefix [ctkswitch]
switch $argv[1]
    case d day
        switcher 0
    case n night
        switcher 1
    case v version
        logger "QuickSand@build1"
    case h help '*'
        help_echo
end
