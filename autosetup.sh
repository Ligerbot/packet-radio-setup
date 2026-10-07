echo "This needs to be run with sudo"
echo "Enter your callsign without -1 at the end"
read callsign
ls /dev/serial/by-id/
echo "Enter Digirig device name from list above [should include Silicon Labs CP2102N]"
read devicepath
devicepath='/dev/serial/by-id/'$devicepath
if [ -f $devicepath ]; then
	echo "Device does not exist"
	exit
fi
config='ADEVICE default\nCHANNEL 0\nMYCALL '$callsign'\nMODEM 1200\nTXDELAY 30\nPTT '$devicepath' RTS\nKISSPORT 8001\nAGWPORT 8000\n'
echo "Install needed software? (y/n)"
read doit

if [ "$doit" = "y" ]; then

	sudo apt install direwolf qttermtcp ax25-tools
else
	echo "Not installing needed software. Unless you already have it instaleld some other way, this will not work."
fi

if [ -f "/etc/direwolf.conf" ]; then
	echo "/etc/direwolf.conf exists already. Overwrite (y/n)"
	read doit
	if [ "$doit" = "y" ]; then
		echo "Overwriting /etc/direwolf.conf with"
		echo -ne $config
		rm /etc/direwolf.conf
#		cp direwolf.conf /etc/direwolf.conf
		echo -ne $config > /etc/direwolf.conf
	else
		echo "Not overwriting direwolf.conf"
		exit 0
	fi
else
	echo "Writing /etc/direwolf.conf with"
	echo -ne $config
#	cp direwolf.conf /etc/direwolf.conf
	echo -ne $config > /etc/direwolf.conf
fi

echo -ne "\n\n\n"
echo "To run direwolf now, run direwolf -p -t 0 -c /etc/direwolf.conf"
echo "Once you do this, you have a KISS TNC available on localhost:8001 and can control PTT if you have the correct audio input and output device set in your system's audio settings"
