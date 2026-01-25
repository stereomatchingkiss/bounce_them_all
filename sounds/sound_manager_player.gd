extends Node
class_name SoundManagerPlayer

func play_hit_enemy_by_arrow():
	%hit_enemy_by_arrow.play(0.13)

func play_jump():
	%jump.play()
	
func play_land():
	%land.play()
	
func play_shoot_standard_bullet():
	%shoot_standard_bullet.play()
