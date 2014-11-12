#!/bin/bash
# Finds all attachments in ~/Library/Messages from iMessage and saves an archive of them

echo -e "\n -- Archive iMessage attachment images --\n"

echo -e "1) Starting to scan images, changing to the working directory"
cd /Users/haneda/Library/Messages/Attachments/
echo -e "2) Now in $(pwd)"


# Locate all files newer than a timestamp file, delete the timestamp.
# Make a timestamp file that is a timestamp so I can know the last time this ran, touch it to update the timestamp
echo -e "3) Finding all files newers than your timestamp file, copying them to a final storage location."

if [ ! -f "/Users/haneda/Library/Messages/scripts/timestamp" ]; then
	echo "     -Timestamp file DOES NOT EXIST"
	find /Users/haneda/Library/Messages/Attachments -not -name ".DS_Store" -not -name "timestamp" -name "*" -type f -exec cp {} /Users/haneda/Library/Messages/scripts/archive_files \;
else
	echo "     -TIMESTAMP file EXISTS"
	find /Users/haneda/Library/Messages/Attachments -not -name ".DS_Store" -not -name "timestamp" -name "*" -type f -newer /Users/haneda/Library/Messages/scripts/timestamp -exec cp {} /Users/haneda/Library/Messages/scripts/archive_files \;
fi

# Update the timestamp
echo -e "4) Update the timestamp for the next run\n"
touch /Users/haneda/Library/Messages/scripts/timestamp

