extends Node2D

var number = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _enter_tree():
	var map_limits = $TileMap.get_used_rect()
	var map_cellsize = $TileMap.tile_set.tile_size
	Player.camera.limit_left = map_limits.position.x * map_cellsize.x
	Player.camera.limit_top = map_limits.position.y * map_cellsize.y
	Player.camera.limit_right = map_limits.end.x * map_cellsize.x
	Player.camera.limit_bottom = map_limits.end.y * map_cellsize.y
	
	$Label.text = str(number)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


#func _on_door_1_body_entered(body):
#	SceneSwitcher.switch_scene("res://Interior.tscn")
	


func _on_button_pressed():
	number += 1
	$Label.text = str(number)
	pass # Replace with function body.
