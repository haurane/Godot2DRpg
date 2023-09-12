extends Area2D

@export var scene : String = "res://Interior.tscn"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	print("Body : " + body.name)
	print("This : " + self.name)
	get_tree().change_scene_to_file(scene)
	hide()
