function hysteria_query
    set hysteriaserver $argv[2]
    if [ "$hysteriaserver" = "" ]
        set hysteriaserver 127.0.0.1:10086
    end
    logger 0 '-----Hysteria Query-----'
    set raw (curl -sL $hysteriaserver/metrics | sed '/\#/d' | grep traffic)
    set usercount (math (echo $raw | tr ' ' '\n' | count)/2)
    for users in (seq 1 $usercount)
        set string (echo $raw | tr ' ' '\n' | sed -n (math $users x 2-1)p)
        set name (echo $string | awk -F"[\"\"]" '{print $2}' | base64 -d )
        if echo $string | grep -qs uplink
            set route uplink 
        end
        if echo $string | grep -qs uplink
            set route uplink 
        end
        if echo $string | grep -qs downlink
            set route downlink 
        end
        set amount (echo $raw | tr ' ' '\n' | sed -n (math $users x 2)p)
        set printamount (size (math "$amount"x 8))
        set sort[$users] ""$name">"$route" "$printamount""
    end
    for reader in (seq 1 $usercount)
        echo $sort[$reader]
    end | sort
end