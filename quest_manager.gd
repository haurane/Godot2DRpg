extends Node

var active_quests = []
var finished_quests = []

signal quest_added(quest)

func _ready():
#	var first_quest = Quest.new("First Delivery", "Your very first delivery", 100, $QuestGiver, null)
#	print(first_quest)
#	add_quest(first_quest)
#	var second_quest = Quest.new("Second Delivery", "Your very first delivery", 100, $QuestGiver, null)
#	print(second_quest)
#	add_quest(second_quest)
#	var third_quest = Quest.new("Third Delivery", "Your very first delivery", 100, $QuestGiver, null)
#	print(third_quest)
#	add_quest(third_quest)
	pass
	

func add_quest(quest : Quest):
	print("added quest in manager")
	active_quests.push_back(quest)
	quest_added.emit(quest)
	
func find_by_name(name : String):
	for index in active_quests.size():
		if active_quests[index].quest_name == name:
			return active_quests[index]

func end_quest(quest : Quest):
	var tmp = active_quests.find(quest)
	finished_quests.push_front(quest)
	return tmp
