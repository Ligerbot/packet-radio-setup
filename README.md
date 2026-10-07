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
PTT /dev/serial/by-id/usb-Silicon_Labs_CP2102N_USB_to_UART_Bridge_Controller_[long number here] RTS
KISSPORT 8001
AGWPORT 8000
```

Replace [callsign only] with your callsign and /dev/serial/by-id/usb-Silicon_Labs_CP2102N_USB_to_UART_Bridge_Controller_[long number here] with the real device name.
