extends Node

var active_quests = {}
var finished_quests = {}
var _next_quest_id = 1

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
	

func add_quest(quest: Quest):
	print("added quest in manager")
	active_quests[_next_quest_id] = quest
	_next_quest_id += 1
	quest_added.emit(quest)
	
func find_by_name(name: String):
	for index in active_quests.size():
		if active_quests[index].quest_name == name:
			return active_quests[index]

func find_by_id(id: int):
	return active_quests[id]

func end_quest(id: int):
	var tmp = active_quests[id]
	finished_quests[id] = tmp
	active_quests.erase(id)
	return tmp
