#!/bin/bash
echo "hi i am going to create a godot project"
project=$1
if [ -z "$1" ]
then
    project="foo"
fi

echo $project
pwd
mkdir $project
mkdir $project/art
mkdir $project/doc
mkdir $project/game
mkdir $project/game/objects
mkdir $project/game/levels
mkdir $project/game/maps
mkdir $project/game/asset
mkdir $project/game/game_state
mkdir $project/game/objects/player
mkdir $project/game/objects/characters
mkdir $project/game/objects/uis
mkdir $project/game/objects/effects
mkdir $project/game/objects/collectables
mkdir $project/game/asset/textures
mkdir $project/game/asset/tiles
mkdir $project/game/asset/libs
mkdir $project/game/asset/globals
mkdir $project/game/asset/sound
mkdir $project/game/asset/textures/backgrounds
mkdir $project/game/asset/textures/tiles
mkdir $project/game/asset/textures/atlas
touch $project/game/project.godot
touch $project/game/game.tscn
echo "#Gotot Project $project" > $project/README.md
echo " $project godot project has been successfully created"
tree $project 
