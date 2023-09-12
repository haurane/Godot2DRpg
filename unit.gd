extends CharacterBody2D

@export var SPEED = 200.0

@onready var _animation_player = $AnimationPlayer

enum direction_enum {UP, DOWN, LEFT, RIGHT}

var direction

func _physics_process(delta):

	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var x_direction = Input.get_axis("ui_left", "ui_right")
	var y_direction = Input.get_axis("ui_up", "ui_down")
	if x_direction:
		velocity.x = x_direction * SPEED
		
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	if y_direction:
		velocity.y = y_direction * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
	_update_animation(x_direction,y_direction)
	

	move_and_slide()
	

func _update_animation(x_direction, y_direction):
	if (x_direction > 0):
		direction = direction_enum.RIGHT
	if (x_direction < 0):
		direction = direction_enum.LEFT
	if y_direction > 0:
		direction = direction_enum.DOWN
	if y_direction < 0:
		direction = direction_enum.UP
	if (x_direction == 0 && y_direction == 0):
		$Sprite_Run.visible = false
		$Sprite_Idle.visible = true
		match direction:
			direction_enum.UP:
				_animation_player.play("idle_up")
			direction_enum.DOWN:
				_animation_player.play("idle_down")
			direction_enum.RIGHT:
				_animation_player.play("idle_right")
			direction_enum.LEFT:
				_animation_player.play("idle_left")
	else:
		$Sprite_Idle.visible = false
		$Sprite_Run.visible = true 
		match direction:
			direction_enum.UP:
				_animation_player.play("run_up")
			direction_enum.DOWN:
				_animation_player.play("run_down")
			direction_enum.RIGHT:
				_animation_player.play("run_right")
			direction_enum.LEFT:
				_animation_player.play("run_left")
	_animation_player.advance(0)
	

