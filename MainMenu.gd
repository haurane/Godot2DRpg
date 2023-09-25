extends Node2D

@onready var _start_cursor = $StartMenu/MarginContainer/VBoxContainer/StartOption/StartCursor
@onready var _quit_cursor = $StartMenu/MarginContainer/VBoxContainer/QuitOption/QuitCursor
@onready var _settings_cursor = $StartMenu/MarginContainer/VBoxContainer/SettingsOption/SettingsCursor

var _main_game = preload("res://Main.tscn").instantiate()

enum State {
	START,
	SETTINGS,
	QUIT,
}

var _cur_state : State

# Called when the node enters the scene tree for the first time.
func _ready():
	UiMenu.visible = false
	Player.visible = false
	_cur_state = State.START


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	match _cur_state:
		State.START:
			if Input.is_action_just_pressed("ui_down"):
				_change_state(State.SETTINGS)
			if Input.is_action_just_pressed("ui_up"):
				_change_state(State.QUIT)
			if Input.is_action_just_pressed("ui_accept"):
				print("Start the game")
				UiMenu.visible = true
				Player.visible = true
				SceneSwitcher.switch_scene("res://Main.tscn")
				
		State.QUIT:
			if Input.is_action_just_pressed("ui_down"):
				_change_state(State.START)
			if Input.is_action_just_pressed("ui_up"):
				_change_state(State.SETTINGS)
			if Input.is_action_just_pressed("ui_accept"):
				get_tree().root.propagate_notification(NOTIFICATION_WM_CLOSE_REQUEST)
				get_tree().quit()
		State.SETTINGS:
			if Input.is_action_just_pressed("ui_down"):
				_change_state(State.QUIT)
			if Input.is_action_just_pressed("ui_up"):
				_change_state(State.START)
			if Input.is_action_just_pressed("ui_accept"):
				print("Open Settings")

func _change_state(next_state):
	_cur_state = next_state
	match next_state:
		State.START:
			print("next state : Start")
			_start_cursor.text = '>'
			_quit_cursor.text = ''
			_settings_cursor.text = ''
		State.QUIT:
			print("next state : Quit")
			_start_cursor.text = ''
			_quit_cursor.text = '>'
			_settings_cursor.text = ''
		State.SETTINGS:
			print("next state : Settings")
			_start_cursor.text = ''
			_quit_cursor.text = ''
			_settings_cursor.text = '>'

