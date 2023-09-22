extends CanvasLayer

@onready var _textbox_container = $TextboxContainer
@onready var _start_symbol = $TextboxContainer/MarginContainer/HBoxContainer/Start
@onready var _end_symbol  = $TextboxContainer/MarginContainer/HBoxContainer/End
@onready var _label = $TextboxContainer/MarginContainer/HBoxContainer/Label

var tween : Tween

const CHARACTER_READ_RATE = 0.1

enum State {
	READY,
	READ,
	
	FINISHED,
}

var current_state = State.READY
var text_queue = []

# Called when the node enters the scene tree for the first time.
func _ready():
	hide_textbox()
	
func _process(delta):
	match current_state:
		State.READY :
			if !text_queue.is_empty():
				set_text()
		State.READ:
			if Input.is_action_just_pressed("ui_accept"):
				_label.visible_ratio = 1.0
				_finish_read()
		State.FINISHED:
			if Input.is_action_just_pressed("ui_accept"):
				_change_state(State.READY)
				hide_textbox()
	
func hide_textbox():
	_start_symbol.text = ''
	_end_symbol.text = ''
	_label.text = ''
	_textbox_container.hide()
	
func show_textbox():
	_start_symbol.text = ''
	_end_symbol.text = ''
	_textbox_container.show()
	
func queue_text(next_text: String):
	text_queue.push_back(next_text)
	
func set_text():
	tween = create_tween()
	_change_state(State.READ)
	var new_text = text_queue.pop_front()
	_label.text = new_text
	show_textbox()
	tween.tween_property(_label, "visible_ratio", 1.0, CHARACTER_READ_RATE * len(new_text)).from(0.0).finished.connect(_finish_read)

func _finish_read():
#	print("finished read")
	tween.stop()
	_label.visible_ratio = 1.0
	_end_symbol.text = 'v'
	_change_state(State.FINISHED)

func _change_state(nextState : State):
	current_state = nextState
	match current_state:
		State.READY :
#			print("ready")
			pass
		State.READ:
#			print("read")
			pass
		State.FINISHED:
#			print("finished")
			pass
