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
	
#func _draw():
#	print("draw")
#	for l in _quest_list.get_children():
#		_quest_list.remove_child(l)
#		l.queue_free()
#	if ! QuestManager.active_quests.is_empty():
#		for quest in QuestManager.active_quests :
#			var quest_title = Label.new()
#			quest_title.text = quest.quest_name
#			_quest_list.add_child(quest_title)
#	else:
#		var quest_title = Label.new()
#		quest_title.text = "No Active Quests"
#		_quest_list.add_child(quest_title)
		
func _add_quest(quest):
	print("add quest to list")
	print(quest)
	var qlabel = Label.new()
	qlabel.text = quest.quest_name
	_quest_list.add_child(qlabel)
