extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var map_limits = $TileMap.get_used_rect()
	print(map_limits)
	var map_cellsize = $TileMap.tile_set.tile_size
	$Unit/Camera2D.limit_left = map_limits.position.x * map_cellsize.x
	$Unit/Camera2D.limit_top = map_limits.position.y * map_cellsize.y
	$Unit/Camera2D.limit_right = map_limits.end.x * map_cellsize.x
	$Unit/Camera2D.limit_bottom = map_limits.end.y * map_cellsize.y
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
