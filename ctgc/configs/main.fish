set -lx prefix '[ctgc]'
switch $argv[1]
    case h help
        help_echo
    case swap
        sudo sync
        echo 1 | sudo tee /proc/sys/vm/drop_caches &>/dev/null
        sudo sync
        echo 2 | sudo tee /proc/sys/vm/drop_caches &>/dev/null
        sudo sync
        echo 3 | sudo tee /proc/sys/vm/drop_caches &>/dev/null
        sudo swapoff -a
        sudo swapon -a
        logger 1 'Cache and swap refreshed'
    case v version
        logger 0 'QuickSliverR@build1'
    case '*'
        sudo sync
        echo 1 | sudo tee /proc/sys/vm/drop_caches &>/dev/null
        sudo sync
        echo 2 | sudo tee /proc/sys/vm/drop_caches &>/dev/null
        sudo sync
        echo 3 | sudo tee /proc/sys/vm/drop_caches &>/dev/null
        logger 1 'Cache refreshed'
end
