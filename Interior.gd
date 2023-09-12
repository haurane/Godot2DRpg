extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


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
