function tui
    logger 0 "Choose the backend you want to use"
    logger 0 '[1]Prime Render Offload'
    logger 0 '[2]Bumblebee'
    logger 0 '[3]Primus'
    read -n1 -P "[ctnvswitch] >>>" select
    switcher $select
end
