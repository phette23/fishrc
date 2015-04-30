#!/usr/bin/env fish
echo 'Request your Twitter archive'
open 'https://twitter.com/settings/account'
read

echo 'Request your Last.fm archive'
open 'http://www.last.fm/settings/dataexporter'
read

echo 'Download your Google Apps (Drive, Gmail) data'
open 'https://www.google.com/settings/takeout'
read

echo 'Download your Diigo boomarks'
open 'https://www.diigo.com/tools/export'
read

echo 'Running SpiderOak backup…'
/Applications/SpiderOak.app/Contents/MacOS/SpiderOak --batchmode

echo 'Running Time Machine backup…'
tmutil startbackup
