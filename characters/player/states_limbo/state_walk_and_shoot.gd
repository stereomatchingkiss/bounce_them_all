extends LimboState

@onready var aux_func_ := %AuxiliaryFunctions
@onready var rogue_hooded_ : RogueHooded = %Rogue_Hooded

# Called when the node enters the scene tree for the first time.
func _enter() -> void:
	print_debug("limbo : enter state_walk_and_shoot, ", Time.get_unix_time_from_system())
	agent.input_cache.reset_shoot()
			
	aux_func_._spawn_bullet(agent, rogue_hooded_, true)

func _update(delta: float) -> void:
	#print_debug("limbo : state_shoot, ", Time.get_unix_time_from_system())	
	if agent.is_on_floor():		
		if agent.input_cache.get_jump():
			print_debug("limbo : state_walk_and_shoot to shoot_to_jumping, ", Time.get_unix_time_from_system())
			get_root().dispatch(&"walk_and_shoot_to_jump")
		elif agent.input_cache.get_input_direction() != Vector2():
			print_debug("limbo : state_walk_and_shoot to shoot_to_move, ", Time.get_unix_time_from_system())
			get_root().dispatch(&"walk_and_shoot_to_moving")
		elif agent.input_cache.get_input_direction() == Vector2():
			aux_func_._shoot_bullet_again(agent, rogue_hooded_, true)
			if !rogue_hooded_.is_shooting_state():
				print_debug("limbo : state_walk_and_shoot to shoot_to_idle, ", Time.get_unix_time_from_system())
				get_root().dispatch(&"walk_and_shoot_to_idle")
			else:
				#without this line, the character will slide before enter idle state
				aux_func_.move_character(agent)
	else:
		#print_debug("limbo : state_shoot on air, ", Time.get_unix_time_from_system())	
		aux_func_.move_character(agent)
		if agent.input_cache.get_shoot():
			aux_func_._spawn_bullet(agent, rogue_hooded_, true)
			agent.input_cache.reset_shoot()
