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
mkdir $project/test_bed
mkdir $project/test_bed/objects
mkdir $project/test_bed/asset
touch $project/test_bed/project.godot
mkdir $project/game
mkdir $project/game/objects
mkdir $project/game/levels
mkdir $project/game/levels/level0
mkdir $project/game/maps
mkdir $project/game/maps/map0
mkdir $project/game/asset
mkdir $project/game/menu_scenes
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
echo "#Gotot Project $project" > $project/README.md
echo "the art contains all art work during development of the project " >> $project/README.md
echo "the doc contains all the project documentation" >> $project/README.md
echo "the game contains the main game godot project" >> $project/README.md
echo "test_bed contains the godot project to develop all the objects and game parts before putting it into the game folder." >> $project/README.md
echo "all other folder structure is self explainotary" >> $project/README.md
echo " $project godot project has been successfully created"
tree $project 
