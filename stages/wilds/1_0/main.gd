extends Node3D

@onready var music_manager_: Node = $MusicManager

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	music_manager_.play_music_creepy_comedy()
