extends Node

@onready var creepy_comedy_: AudioStreamPlayer = %creepy_comedy

func play_music_creepy_comedy():
	creepy_comedy_.play()
	
func stop_music_creepy_comedy():
	creepy_comedy_.stop()
