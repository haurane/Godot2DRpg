extends CanvasLayer

@onready var _main_menu = $MainMenuContainer
@onready var _quest_list = $QuestContainer
@onready var _inventory = $InventoryContainer



enum UIState {
	HIDDEN,
	MENU,
	QUEST,
	INVENTORY
}



var _current_state = UIState.HIDDEN

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_main_menu_button_pressed():
	print("Main Menu")
	match _current_state:
		UIState.HIDDEN:
			_change_state(UIState.MENU)
		UIState.MENU:
			_change_state(UIState.HIDDEN) 
		_: pass


func _on_quit_button_pressed():
	get_tree().root.propagate_notification(NOTIFICATION_WM_CLOSE_REQUEST)
	get_tree().quit()
	


func _on_continue_button_pressed():
	_change_state(UIState.HIDDEN)
	
func _change_state(nextState):
	print(_current_state)
	print(nextState)
	_current_state = nextState
	match _current_state:
		UIState.HIDDEN:
			_main_menu.visible = false
			_quest_list.visible = false
			_inventory.visible = false
			Utilities.unpauseGame()
		UIState.MENU:
			Utilities.pauseGame()
			_main_menu.visible = true
		UIState.QUEST:
			Utilities.pauseGame()
			_quest_list.visible = true
		UIState.INVENTORY:
			Utilities.pauseGame()
			_inventory.visible = true
		_: pass
		
		


func _on_quest_button_pressed():
	print("Quest Menu")
	match _current_state:
		UIState.HIDDEN:
			_change_state(UIState.QUEST)
		UIState.QUEST:
			_change_state(UIState.HIDDEN)
		_: pass


func _on_inventory_button_pressed():
	match _current_state:
		UIState.HIDDEN:
			_change_state(UIState.INVENTORY)
		UIState.INVENTORY:
			_change_state(UIState.HIDDEN)
		_: pass
	pass # Replace with function body.


func _on_close_inventory_button_pressed():
	_change_state(UIState.HIDDEN)
	pass # Replace with function body.


func _on_quest_continue_button_pressed():
	_change_state(UIState.HIDDEN)
	pass # Replace with function body.
