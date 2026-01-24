class_name AuxiliaryFunctionsPlayer

extends Node

const fireball = preload("res://bullets/bullet_standard.tscn")

const JUMP_VELOCITY = 4.5
const SPEED = 3.0

func move_character(player : Player):
	var direction : Vector3 = player.input_cache.get_norm_direction()
	if direction:
		player.velocity.x = direction.x * SPEED
		#player.velocity.z = direction.z * SPEED
	else:
		player.velocity.x = move_toward(player.velocity.x, 0, SPEED)
		#player.velocity.z = move_toward(player.velocity.z, 0, SPEED)
		
	player.input_cache.reset_input_direction()
	
func _spawn_bullet(agent : Player, rogue_hooded : RogueHooded, is_move_and_shoot : bool) -> void:
	if rogue_hooded.is_shooting_state():
		return
		
	if is_move_and_shoot:
		rogue_hooded.travel_to_move_and_shoot()
	else:
		rogue_hooded.travel_to_shoot()
	SoundManager.play_shoot_standard_bullet()
	var fnode = fireball.instantiate()
	agent.get_parent().add_child(fnode)	
	print_debug("shoot state player direction = ", agent.player_direction())
	if agent.player_direction() >= 0:
		print_debug("shoot >= 0")
		fnode.global_position = agent.global_position + Vector3(0.5, 0.25, 0)
		fnode.player_direction = Vector3(1, 0, 0)		
		fnode.rotation_degrees.y = -90
	else:
		print_debug("shoot < 0")
		fnode.global_position = agent.global_position + Vector3(-0.5, 0.25, 0)
		fnode.player_direction = Vector3(-1, 0, 0)
		fnode.rotation_degrees.y = 90

func _shoot_bullet_again(agent : Player, rogue_hooded : RogueHooded, is_move_and_shoot : bool) -> void:
	if agent.input_cache.get_shoot():
		_spawn_bullet(agent, rogue_hooded, is_move_and_shoot)
		agent.input_cache.reset_shoot()
