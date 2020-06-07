#godot

#this is a collection of finite state machine characters

#characters

#char -- template with the basic states it can be a starting point for basic charcter

1-idle
2-run
3-jump
4-fall
5-die

#girl - template with following states --starting point with little advance controls

1-idle
2-run
3-jump
4-fall
5-attack
6-slide
7-wall_jump
8-swim
9-die

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

