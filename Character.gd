extends CharacterBody2D

@export var SPEED : float = 200.0
@export var starting_direction : Vector2 = Vector2(0,1)

@onready var _animation_player = $AnimationPlayer

@onready var _animation_tree = $AnimationTree
@onready var _animation_state_machine = _animation_tree.get("parameters/playback")

@onready var camera = $Camera2D

enum direction_enum {UP, DOWN, LEFT, RIGHT}

var direction

# parameters/Idle/blend_position

func _ready():
	_update_animation(starting_direction)

func _physics_process(delta):
	_pick_state()
	

	move_and_slide()
	

func _update_animation(direction_input : Vector2):
	# ignore if no input
	if(direction_input != Vector2.ZERO):
		_animation_tree.set("parameters/Idle/blend_position", direction_input)
		_animation_tree.set("parameters/Run/blend_position", direction_input)
	
func _pick_state():
	if (velocity != Vector2.ZERO):
		_animation_state_machine.travel("Run")
	else :
		_animation_state_machine.travel("Idle")
