extends Node2D

var house_1 = preload("res://Interior.tscn").instantiate()
var main_screen = self


# Called when the node enters the scene tree for the first time.
func _ready():
	var map_limits = $TileMap.get_used_rect()
	print(map_limits)
	var map_cellsize = $TileMap.tile_set.tile_size
	$Player/Camera2D.limit_left = map_limits.position.x * map_cellsize.x
	$Player/Camera2D.limit_top = map_limits.position.y * map_cellsize.y
	$Player/Camera2D.limit_right = map_limits.end.x * map_cellsize.x
	$Player/Camera2D.limit_bottom = map_limits.end.y * map_cellsize.y


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	print(delta)
	pass


func _on_door_1_body_entered(body):
	get_tree().root.add_child(house_1)
	get_tree().root.remove_child(main_screen)
	
