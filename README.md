#godot

#this is a collection of finite state machine characters

all the templates are in the template_factory and all the characters are inside the character_factory

to make a new character first copy a template from template_factory/objects/templates to character_factory/objets/template/
dir.
then open godot editor and rename the folder inside godot itself and give a character name and move it to the character folder.


Now on you can start building your character from the fsm templates




#characters

#char -- template with the basic states it can be a starting point for basic charcter

1-idle
2-run
3-jump
4-fall
5-die



#archer - a compplete character with all animataions its demo not a starting point

This foler contains a shell script godot.sh

to use it type the following commands

chmod +x godot.sh
./godot.sh  <projectname>

this will create an organised godot project with directories and a README file


This is a godot project for creating a kinematic character finite state machine player template

the player does not contain animation

the dir objects/player contains all player related files

the dir objects/fsm contains a very basic state machine for understanding the concept of a state machine
