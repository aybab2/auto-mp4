#!/bin/sh

videodir="/path/to/videos"  ##### edit to your specific path

# m4v > mp4
sudo -u $user find $videodir -name "*.m4v" -exec sh -c 'for file do ffmpeg -i "$file" -c copy "$(dirname "$file")/$(basename "$file" .m4v).mp4" ; echo "$file" >> $HOME/auto-mp4/conversions.log ; mv "$file" $HOME/auto-mp4/ ; done' sh {} \;

# mkv > mp4
sudo -u $user find $videodir -name "*.mkv" -exec sh -c 'for file do ffmpeg -i "$file" -c copy "$(dirname "$file")/$(basename "$file" .mkv).mp4" ; echo "$file" >> $HOME/auto-mp4/conversions.log ; mv "$file" $HOME/auto-mp4/ ; done' sh {} \;

# avi > mp4
sudo -u $user find $videodir -name "*.avi" -exec sh -c 'for file do HandBrakeCLI -i "$file" -o "$(dirname "$file")/$(basename "$file" .avi).mp4" --preset="HQ 1080p30 Surround" ; echo "$file" >> $HOME/autio-mp4/conversions.log ; mv "$file" $HOME/auto-mp4/ ; done' sh {} \;
