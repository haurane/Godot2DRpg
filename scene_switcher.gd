extends Node

var current_scene = null

var loaded_scenes = {}
# Called when the node enters the scene tree for the first time.
func _ready():
	var root = get_tree().root
	current_scene = root.get_child(root.get_child_count()-1)
	loaded_scenes["res://MainMenu.tscn"] = current_scene
#	print_debug(current_scene)


func switch_scene(res_path):
	call_deferred("_deffered_switch_scene", res_path)
	
func _deffered_switch_scene(res_path):
	print_debug(res_path)
	get_tree().root.remove_child(current_scene)
	if loaded_scenes.get(res_path) == null:
		print_debug("Not yet in dictionary")
		var s = load(res_path)
		current_scene = s.instantiate()
		loaded_scenes[res_path] = current_scene 
	else :
		print_debug("In dictionary")
		current_scene = loaded_scenes.get(res_path)
	
	get_tree().root.add_child(current_scene)
	get_tree().current_scene = current_scene
#	print_debug(get_tree().root)
#	print_debug(get_tree().root.get_child(get_tree().root.get_child_count() - 1))
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
