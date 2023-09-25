extends MarginContainer

@onready var _quest_list = $MarginContainer/VBoxContainer/HBoxContainer/QuestList

var _quest_names = []

# Called when the node enters the scene tree for the first time.
func _ready():
	QuestManager.quest_added.connect(_add_quest)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _add_quest(quest):
	var qbutton = Button.new()
	qbutton.text = quest.quest_name
	qbutton.connect("pressed", _on_quest_button_pressed.bind(quest))
	_quest_list.add_child(qbutton)
	
func _on_quest_button_pressed(quest):
	print_debug(quest.quest_name)
	$MarginContainer/VBoxContainer/HBoxContainer/MarginContainer/QuestGiver/Name.text = quest.quest_giver
	$MarginContainer/VBoxContainer/HBoxContainer/MarginContainer/Target/Name.text = quest.quest_target
	$MarginContainer/VBoxContainer/HBoxContainer/MarginContainer/QuestDescription.text = quest.quest_description

