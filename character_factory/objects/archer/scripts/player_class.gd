extends KinematicBody2D
class_name Player

# this is a kinematic player class for declaring all the player parameters

var GRAVITY = 1200.0 
const WALKSPEED = 600
const JUMPSPEED = -700
const AIRSPEED = 400
const WALLJUMPSPEED = Vector2(400,-400)
const ACCN = 800

var velocity = Vector2()
var n = Vector2(0,-1)

var health = 100
var speed = 0

var on_ground = false
var on_wall = false
var on_left_wall = false
var on_right_wall = false
var in_water = false

var face_left = false
var face_right = true

#all class methods
