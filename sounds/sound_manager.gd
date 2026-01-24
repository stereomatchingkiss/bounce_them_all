extends Node

func init():
	%creepy_comedy.volume_db = -5

func play_dead_enemy():
	%dead_enemy.play()

func play_hit_enemy_by_arrow():
	%hit_enemy_by_arrow.play(0.13)

func play_music_creepy_comedy():
	%creepy_comedy.play()
	
func stop_music_creepy_comedy():
	%creepy_comedy.stop()
