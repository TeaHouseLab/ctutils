set -lx prefix [ctnvswitch]
switch $argv[1]
    case switch
        switch $argv[2]
            case 1
                switcher 1
            case 2
                switcher 2
            case 3
                switcher 3
            case '*'
                logger 4 'Unexpected Input at switch.MainActivity.ctnvswitch'
        end
    case v version
        logger 0 'QuickSliverR@build1'
    case h help
        help_echo
    case '*'
        tui
end
