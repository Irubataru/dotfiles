export VI_SERVER=main

# Set the name of vim session the terminal is tied up to
eset(){
    export VI_SERVER=$1
}

# Fire up a new server according to the argument supplied
vs(){
    eset $1
    vim --servername $VI_SERVER
}

# Open up the files in the environment Vim server.
es(){
    vim --servername $VI_SERVER --remote-silent $*
}

# Reuse Vim ZSH completions for vim completions
compdef _vim es
