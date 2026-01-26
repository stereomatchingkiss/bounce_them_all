extends Control

@onready var option_msaa_: OptionButton = %OptionMSAA
@onready var option_resolution_: OptionButton = %OptionResolution
@onready var option_window_mode_: OptionButton = %OptionWindowMode

func _ready() -> void:
	option_window_mode_.select(OptionsStorageGlobal.window_mode)
	option_msaa_.select(OptionsStorageGlobal.msaa)
	option_resolution_.select(OptionsStorageGlobal.resolution)

func _on_button_back_to_options_pressed() -> void:
	get_tree().change_scene_to_file("res://ui/menu/options_menu.tscn")

func _on_option_resolution_item_selected(index: int) -> void:
	OptionsStorageGlobal.resolution = index as OptionsStorage.Resolution
	match OptionsStorageGlobal.resolution:
		OptionsStorage.Resolution.R1152x648:
			DisplayServer.window_set_size(Vector2i(1152, 648))
		OptionsStorage.Resolution.R1280x720:
			DisplayServer.window_set_size(Vector2i(1280, 720))
		OptionsStorage.Resolution.R1920x1080:
			DisplayServer.window_set_size(Vector2i(1920, 1080))
		_:
			DisplayServer.window_set_size(Vector2i(1920, 1080))

func _on_option_msaa_item_selected(index: int) -> void:
	OptionsStorageGlobal.msaa = index as OptionsStorage.MSAA

func _on_option_window_mode_item_selected(index: int) -> void:
	OptionsStorageGlobal.window_mode = index as OptionsStorage.WindowMode
	match OptionsStorageGlobal.window_mode:
		OptionsStorage.WindowMode.FullScreen:
			print_debug("video optison select full screen mode")
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
			DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, false)
		OptionsStorage.WindowMode.Windows:
			print_debug("video optison select window mode")
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
			DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, false)
		OptionsStorage.WindowMode.BorderlessWindow:
			print_debug("video optison select window borderless")
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
			DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, true)
		OptionsStorage.WindowMode.BorderlessFullScreen:
			print_debug("video optison select full screen borderless")
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
			DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, true)
		_:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
			DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, false)
