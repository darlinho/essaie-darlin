#!/bin/bash

sudo apt update
sudo apt install -y screen
sudo chmod u+s $(which screen)
sudo chmod 755 /var/run/screen
sudo rm -rf /var/run/screen/*

cat > $HOME/.screenrc <<EOF
# Turn off the welcome message
startup_message off

# Disable visual bell
vbell off

# Set scrollback buffer to 10000
defscrollback 10000

# Customize the status line
hardstatus alwayslastline
hardstatus string '%{= kG}[ %{G}%H %{g}][%= %{= kw}%?%-Lw%?%{r}(%{W}%n*%f%t%?(%u)%?%{r})%{w}%?%+Lw%?%?%= %{g}][%{B} %m-%d %{W}%c %{g}]'
EOF

screen -d -m -S $1
