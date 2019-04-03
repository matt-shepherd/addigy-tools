#!/bin/bash

#Fact requires 'Script Access to MSU' MDM Profile
FOLDER="fact-cache"
FILE="$FOLDER/pending_ms_updates"

mkdir -p $FOLDER;

username=$(/usr/bin/python -c 'from SystemConfiguration import SCDynamicStoreCopyConsoleUser; import sys; username = (SCDynamicStoreCopyConsoleUser(None, None, None) or [None])[0]; username = [username,""][username in [u"loginwindow", None, u""]]; sys.stdout.write(username + "\n");')

if [ "$username" == "" ]; then
   read -d $'\x04' CACHED < "$FILE"
   echo "Pending Microsoft Updates: $CACHED (cached)"
   exit 0
fi

PENDING_UPDATES=$(sudo -u "$username" /Library/Application\ Support/Microsoft/MAU2.0/Microsoft\ AutoUpdate.app/Contents/MacOS/msupdate --list | grep -c '  ')

echo "Pending Microsoft Updates: $PENDING_UPDATES"

echo $PENDING_UPDATES > $FILE