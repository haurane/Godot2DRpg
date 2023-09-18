extends Node

var active_quests = []
var finished_quests = []

func add_quest(quest : Quest):
	active_quests.push_back(quest)
	
func find_by_name(name : String):
	for index in active_quests.size():
		if active_quests[index].quest_name == name:
			return active_quests[index]

func end_quest(quest : Quest):
	var tmp = active_quests.find(quest)
	finished_quests.push_front(quest)
	return tmp
