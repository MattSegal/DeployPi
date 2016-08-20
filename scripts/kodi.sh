#! /bin/bash

# count the number of kodi instances
case "$(pidof kodi.bin | wc -w)" in
0)  # start kodi
	/usr/lib/kodi/kodi.bin
    ;;
*)  # kill everything
	kill $(pidof kodi.bin)
    ;;
esac