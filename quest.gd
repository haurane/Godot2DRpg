extends Node

class_name Quest

var quest_name : String
var quest_description : String
var quest_xp : int
var quest_giver : String
var quest_target : String

func _init(name:String, description:String, xp:int, giver:String, target:String):
	quest_name = name
	quest_description = description
	quest_xp = xp
	quest_giver = giver
	quest_target = target
