extends Control

@onready var option_full_screen_: OptionButton = %OptionFullScreen
@onready var option_msaa_: OptionButton = %OptionMSAA
@onready var option_resolution_: OptionButton = %OptionResolution

func _ready() -> void:
	option_full_screen_.select(OptionsStorageGlobal.full_screen)
	option_msaa_.select(OptionsStorageGlobal.msaa)
	option_resolution_.select(OptionsStorageGlobal.resolution)

func _on_button_back_to_options_pressed() -> void:
	get_tree().change_scene_to_file("res://ui/menu/options_menu.tscn")

func _on_option_resolution_item_selected(index: int) -> void:
	OptionsStorageGlobal.resolution = OptionsStorageGlobal.Resolution.keys()[index]

func _on_option_full_screen_item_selected(index: int) -> void:
	OptionsStorageGlobal.full_screen = index

func _on_option_msaa_item_selected(index: int) -> void:
	OptionsStorageGlobal.msaa = OptionsStorageGlobal.MSAA.keys()[index]
