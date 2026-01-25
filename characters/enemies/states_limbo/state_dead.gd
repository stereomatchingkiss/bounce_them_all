extends LimboState

@export var animation_player_ : AnimationPlayer
@export var sound_manager_enemy_ : SoundManagerEnemyBase

func _enter() -> void:
	print_debug(agent.name, " enter dead state")
	agent.velocity = Vector3()
	agent.set_collision_mask_value(4, false)
	sound_manager_enemy_.play_dead_enemy()
	animation_player_.play("Death")

func _update(delta: float) -> void:	
	pass
