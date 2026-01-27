extends Button
class_name InputRemapButton

@export var action : String

@onready var keyboard_dicts_: Dictionary = %KeyboardDicts.input_dicts
@onready var texture_rect_key_: TextureRect = %TextureRectKey

const resource_path_ := "res://assets/ui/input_prompts/keyboard_and_mouse/Vector/"

func _get_texture_path() -> String:
	var actions = InputMap.action_get_events(action)
	print_debug("action = %s, actions size = %s" % [action, actions.size()])
	if actions.size() > 0:
		var event : InputEventKey = actions[0]
		if keyboard_dicts_.has(event.physical_keycode):
			return resource_path_ + keyboard_dicts_[event.physical_keycode]
		elif keyboard_dicts_.has(event.keycode):
			return resource_path_ + keyboard_dicts_[event.keycode]
		
	return ""

func _ready() -> void:
	toggle_mode = true
	texture_rect_key_.texture = load(_get_texture_path())

func _on_toggled(toggled_on: bool) -> void:
	if toggled_on:
		text = "Awaiting input"
		texture_rect_key_.visible = false
	else:
		text = ""
		texture_rect_key_.visible = true

func _input(event: InputEvent) -> void:
	if texture_rect_key_.visible or event is not InputEventKey:
		return
	
	if keyboard_dicts_.has(event.physical_keycode) and InputMap.action_get_events(action).size() == 1:
		InputMap.action_erase_event(action, InputMap.action_get_events(action)[0])
		InputMap.action_add_event(action, event)
		texture_rect_key_.texture = load(resource_path_ + keyboard_dicts_[event.physical_keycode])
		text = ""
		texture_rect_key_.visible = true
		button_pressed = !button_pressed
