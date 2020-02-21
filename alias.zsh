# Shortcuts for opening a file with an often used program
alias sublime='open -a Sublime\ Text'
alias finder='open -a Finder'

# This will highlight the argument, to be used as a filter, e.g. `tail -f log | highlight ERROR`
alias highlight='ack --passthru'

# Convenient to grep my history to see how I ran a command a long time ago
alias hgrep='history | grep'

# Misc
# Recycle (reload) a directory (required if you have a terminal in a directory that gets deleted and recreated by, e.g. a build)
alias recycle-dir='cd $(pwd)'

# Decode the jwt on your clipboard
alias jwt='pyjwt decode --no-verify $(pbpaste) | jsonpp'

