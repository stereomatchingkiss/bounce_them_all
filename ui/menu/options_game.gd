extends Control

@onready var option_language_: OptionButton = %OptionLanguage

func _ready() -> void:
	option_language_.select(OptionsStorageGlobal.language)

func _on_button_back_to_options_pressed() -> void:
	get_tree().change_scene_to_file("res://ui/menu/options_menu.tscn")

func _on_option_language_item_selected(index: int) -> void:
	print_debug("language index = ", index)
	OptionsStorageGlobal.language = OptionsStorage.Language.keys()[index]
