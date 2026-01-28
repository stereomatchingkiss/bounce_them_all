extends Node

@export var _area_attack_player: Area3D
@export var _area_hit_by_bullet: Area3D
@export var _bullet_ball: Area3D
@export var _character_armature: Node3D
@export var _enemy : CharacterBody3D
@export var _limbo_hsm: LimboHSM
@export var _sound_manager_enemy_base: SoundManagerEnemyBase

func bullet_ball_conversion_(change_flag : bool = true) -> void:
	_area_attack_player.set_collision_mask_value(1, !change_flag)
	_area_hit_by_bullet.set_collision_mask_value(7, !change_flag)
	#Without disable the enemy layer, the ball will push the player even every masks set to false
	_enemy.set_collision_layer_value(4, !change_flag)
	_enemy.set_collision_mask_value(6, !change_flag)

	_bullet_ball.set_collision_mask_value(1, change_flag)

	_bullet_ball.visible = change_flag
	_character_armature.visible = !change_flag
	
func change_to_bullet_ball() -> void:
	if not _bullet_ball.visible:
		_enemy.velocity = Vector3()
		bullet_ball_conversion_(true)

func on_boby_entered_bullet_ball(body : Node3D):
	if body is Player and Vector2(body.velocity.x, body.velocity.y) != Vector2():
		print_debug("player enter bullet ball, ", body.get_type_name())
		_sound_manager_enemy_base.play_player_hit_ball()
		#if this do not set to true, the ball would not bounce back after hitting wall
		_enemy.set_collision_mask_value(4, true)
		_bullet_ball.set_collision_mask_value(1, false)
		_bullet_ball.set_collision_mask_value(4, true)
		_enemy.velocity = body.velocity
		_enemy.velocity.z = 0
		_enemy.velocity = _enemy.velocity.normalized() * _enemy.get_bouncing_speed()
	elif body is EnemyBase:
		print_debug("ball hit enemy == ", body.get_type_name(), ", name = ", body.name)
		body.set_collision_layer_value(4, false)
		body.limbo_hsm_.dispatch(&"dead")
		
func recover_to_enemy() -> void:
	if _bullet_ball.visible:
		_enemy.velocity.x = _enemy.move_velocity.x
		bullet_ball_conversion_(false)
		_limbo_hsm.dispatch(&"ball_to_falling")
