# Packet Radio Setup

This is a guide on how to set up packet radio on Debian Linux 13. This assumes that you have a digirig.

# Needed programs

* direwolf
* ax25-tools
* qttermtcp

To install these run `sudo apt install direwolf ax25-tools qttermtcp`

# AX25 configuration nonsense

Next, you need to start direwolf. Make a file in `/etc/direwolf.conf` with these contents: 
```
ADEVICE default
CHANNEL 0
MYCALL [callsign only]
MODEM 1200
TXDELAY 30
PTT /dev/serial/by-id/usb-Silicon_Labs_CP2102N_USB_to_UART_Bridge_[long number here] RTS
KISSPORT 8001
AGWPORT 8000
```

Replace [callsign only] with your callsign and /dev/serial/by-id/usb-Silicon_Labs_CP2102N_USB_to_UART_Bridge_Controller_[long number here] with the real device name. If this works then you now have a KISS TNC available on localhost:8001 and an AGW TNC available on localhost:8000.

Depending on what you want to do next, you will need either qttermtcp or ax25-tools.

# QTTermTCP

To configure QTTermTCP, you need to go into the setup menu then the KISS Setup menu. There you need to set the device to TCP, the host to localhost or 127.0.0.1, and the port to 8001. Also replace the field for your callsign with your callsign.

Once that is done, press the Connect button in the top right corner and then choose "KISS connect".

#ax25-tools

suffer
