DR-Player.app
=============

Watch DR's TV channels live on your Mac

# How?

The app works by starting a kiosk-mode Chrome instance set to <http://dr.brnbw.com>. This is done with this shell command:

``` sh
exec /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome  --kiosk --app="http://dr.brnbw.com/player?version=0.9" --user-data-dir="/Users/$USER/Library/Application Support/Google/DRPlayer" "$@"
