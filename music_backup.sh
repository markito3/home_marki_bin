#!/bin/bash
rsync -ruvt --delete /data/marki/music/ /fantom/backup/music/
rsync -ruvt --delete /data/marki/music_christmas/ /fantom/backup/music_christmas/
rsync -ruvt --delete /data/marki/music_deprecated/ /fantom/backup/music_deprecated/
