#!/bin/sh

## toggles system SOCKS proxy on OS X

# for convenience, you can do the following:
# - create a workflow (type "Service") using Automator
# - add a "Run Shell Script" action with the script below
# - save under ~/Library/Services/
# - assign a shortcut key, under System Preferences -> Keyboard -> Keyboard Shortcuts -> Services (I use Ctrl+')
# - install growlnotify, so you get a nice notification when the proxy state is toggled

STAT=`networksetup -getsocksfirewallproxy AirPort | head -1 | cut -d: -f 2|sed 's/ //g'`

if [ "$STAT" == "No" ]; then
	networksetup -setsocksfirewallproxystate AirPort on
	if [ -x /usr/local/bin/growlnotify ]; then
		/usr/local/bin/growlnotify -m "Proxy On"
	fi
else
	networksetup -setsocksfirewallproxystate AirPort off
	if [ -x /usr/local/bin/growlnotify ]; then
		/usr/local/bin/growlnotify -m "Proxy Off"
	fi
fi
