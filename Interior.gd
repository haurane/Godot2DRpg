extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var map_limits = $TileMap.get_used_rect()
	print(map_limits)
	var map_cellsize = $TileMap.tile_set.tile_size
	print(map_cellsize)
	$Player/Camera2D.limit_left = map_limits.position.x * map_cellsize.x
	$Player/Camera2D.limit_top = map_limits.position.y * map_cellsize.y
	$Player/Camera2D.limit_right = map_limits.end.x * map_cellsize.x
	$Player/Camera2D.limit_bottom = map_limits.end.y * map_cellsize.y
	
	print($Player/Camera2D.limit_left)
	print($Player/Camera2D.limit_top)
	print($Player/Camera2D.limit_right)
	print($Player/Camera2D.limit_bottom)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	if(body.is_in_group("PlayerCharacter")):
		$Textbox.queue_text("Hello Mr Postman Sir")
		$Textbox.queue_text("U need to deliver this letter")
		$Textbox.queue_text("It's very very important")
		$Textbox.queue_text("*thehee*")
		$Textbox.queue_text("Thanks a lot")
		
		var first_quest = Quest.new("First Delivery", "Your very first delivery", 100, $QuestGiver, null)
		#print(first_quest)
		QuestManager.add_quest(first_quest)
		
		#print(QuestManager.find_by_name("First Delivery").quest_name)
		
