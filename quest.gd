extends Node

class_name Quest

var quest_name : String
var quest_description : String
var quest_xp : int
var quest_giver : Node
var quest_target : Node

func _init(name:String, description:String, xp:int, giver:Node, target:Node):
	quest_name = name
	quest_description = description
	quest_xp = xp
	quest_giver = giver
	quest_target = target
