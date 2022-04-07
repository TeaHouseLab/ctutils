function xray_query
    set xraycore $argv[1]
    if [ "$xraycore" = "" ]
        set xraycore xray
    end
    set xrayserver $argv[2]
    if [ "$xrayserver" = "" ]
        set xrayserver 127.0.0.1:10085
    end
    logger 0 '-----Xray Query-----'
    set raw ($xraycore api statsquery -s $xrayserver -pattern "user" | jq '.stat')
    set usercount (echo "$raw" | jq | grep name | count)
    set fixedcount (math $usercount-1)
    for users in (seq 0 $fixedcount)
        set lookupchart (math $users+1)
        set name (echo "$raw" | jq ".[$users].name" | sed 's/\"user>>>//g' | sed 's/>>traffic>>>//g' | sed 's/k\"/k/g')
        set amount (echo "$raw" | jq ".[$users].value")
        set printamount (size (math "$amount"x 8))
        set sort[$lookupchart] "$name $printamount"
    end
    for reader in (seq 1 $usercount)
        echo $sort[$reader]
    end | sort
end
