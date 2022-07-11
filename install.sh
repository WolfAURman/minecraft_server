#!/bin/bash

mkdir $HOME/minecraft-1.19
mkdir $HOME/minecraft-1.19/plugins
apt update && apt upgrade
apt install openjdk-17-jdk -y
cp *.jar $HOME/minecraft-1.19 && cp start.sh $HOME/minecraft-1.19 && cp -r plugins $HOME/minecraft-1.19
rm -rf $HOME/minecraft_server
cd $HOME/minecraft-1.19
sh start.sh
sed -i 's/eula=false/eula=true/' eula.txt
sh start.sh
