function switcher
    switch $argv
        case 0
            kvantummanager --set CenterOS
            lookandfeeltool -a CenterOS
        case 1
            kvantummanager --set CenterOSdark
            lookandfeeltool -a CenterOSdark
        case '*'
            logger 4 "Unexpected Input at switcher.ctkswitch"
    end
    logger 0 "Switched"
end
