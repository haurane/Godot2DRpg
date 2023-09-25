extends Area2D

@export var next_scene : String = ""
@export var next_coords: Vector2i

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_body_entered(body):
	if body.is_in_group("PlayerCharacter"):
		Player.position = next_coords
		SceneSwitcher.switch_scene(next_scene)
	
