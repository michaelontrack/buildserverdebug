#!/bin/bash

# Sript is meant to be ran form buil server, rather than local machine
# Watch out 1, make sure you dont have any uncommited changes

INC_MSG="incrementing build number"
BRANCH=$(git branch | sed -n '/\* /s///p')

# Incrementing build number in plist
declare -a PLIST_PATHS=("BuilserverDebug/Info.plist")
for PLIST_PATH in ${PLIST_PATHS[@]}; do
    echo "$PLIST_PATH"
	VERSION=$(/usr/libexec/PlistBuddy -c "Print :CFBundleVersion" $PLIST_PATH)
	VERSION=$(($VERSION+1))
	/usr/libexec/PlistBuddy -c "Set :CFBundleVersion $VERSION" $PLIST_PATH
done

# Committing build number increment
git commit -a -m $INC_MSG
git push origin $BRANCH
