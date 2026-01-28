extends Node
class_name SoundManagerEnemyBase

func play_ball_hit_wall():
	%ball_hit_wall_or_ground.play()
	
func play_dead_enemy():
	%dead_enemy.play()
	
func play_dead_player():
	%dead_player.play(0.6)

func play_hit_enemy_by_arrow():
	%hit_enemy_by_arrow.play(0.13)
	
func play_player_hit_ball():
	#%"514640FreesoundmozardesBallSingleBounceConcrete1".play()
	#%"761558StuniversoBallHit".play()
	#$"sound_effects/761558StuniversoBallHit".play()
	%player_hit_ball.play(0.14)
