extends Node
class_name SoundManagerEnemyBase

func play_dead_enemy():
	%dead_enemy.play()
	
func play_dead_player():
	%dead_player.play(0.6)

func play_hit_enemy_by_arrow():
	%hit_enemy_by_arrow.play(0.13)
