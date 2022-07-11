#!/bin/bash

mkdir $HOME/minecraft-1.19
mkdir $HOME/minecraft-1.19/plugins
apt update && apt upgrade
apt install tmux openjdk-17-jdk -y
cp *.jar $HOME/minecraft-1.19 && cp *.sh $HOME/minecraft-1.19
cp -r plugins $HOME/minecraft-1.19
cd $HOME/minecraft-1.19
tmux new-session -d -s minecraft
tmux send -t minecraft.0 'sh start.sh' ENTER
tmux attach -t minecraft
sleep 30s
sed -i 's/eula=false/eula=true/' eula.txt
tmux send -t minecraft.0 'sh start.sh' ENTER
sleep 60s
tmux send -t minecraft.0 CTRL+C
rm -rf $HOME/minecraft_server
