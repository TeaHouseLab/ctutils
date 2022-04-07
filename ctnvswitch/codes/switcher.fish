function switcher
    switch $argv[1]
        case 1
            echo '#!/bin/sh
vblank_mode=0 __GL_SYNC_TO_VBLANK=0 __NV_PRIME_RENDER_OFFLOAD=1 __VK_LAYER_NV_optimus=NVIDIA_only __GLX_VENDOR_LIBRARY_NAME=nvidia "$@"' | sudo tee /usr/bin/ctnvrun &>/dev/null
        case 2
            echo '#!/bin/sh
vblank_mode=0 __GL_SYNC_TO_VBLANK=0 optirun -b primus -c vuy "$@"' | sudo tee /usr/bin/ctnvrun &>/dev/null
        case 3
            echo '#!/bin/sh
vblank_mode=0 __GL_SYNC_TO_VBLANK=0 primusrun "$@"' | sudo tee /usr/bin/ctnvrun &>/dev/null
        case '*'
            logger 4 'Unexpected Input at switch.switcher.ctnvswitch'
    end
    logger 1 'Switched.'
end
