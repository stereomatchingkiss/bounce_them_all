extends Node3D
class_name RogueHooded

@export var animation_speed := 5.0

@onready var animation_tree_: AnimationTree = %AnimationTree
@onready var playback_ : AnimationNodeStateMachinePlayback = animation_tree_["parameters/playback"]

const jump_path_ : String = "parameters/Jump_Space/blend_position"
const move_path_ : String = "parameters/Move_Idle/blend_position"

func is_shooting_state() -> bool:
	#return playback_.get_current_node() == "1H_Ranged_Shoot"
	print_debug("is shooting state == ", animation_tree_["parameters/Walk_And_Shoot/OneShot/request"])
	return (playback_.get_current_node() == "Walk_And_Shoot" and \
	animation_tree_["parameters/Walk_And_Shoot/OneShot/request"] == 1) \
	or playback_.get_current_node() == "1H_Ranged_Shoot"

func travel_to(anime_name : String) -> void:
	playback_.travel(anime_name)

func travel_to_jump_idle() -> void:
	#playback_.travel("Jump_Idle")
	pass

func travel_to_jump_start() -> void:
	animation_tree_[jump_path_] = -1.0
	playback_.travel("Jump_Space")
	
func travel_to_jump(delta : float) -> void:
	animation_tree_[jump_path_] = move_toward(
		animation_tree_[jump_path_], 1.0, delta * 1.8
	)
	
func travel_to_idle(delta : float = 0.0) -> void:
	playback_.travel("Idle")
	
func travel_to_move(delta : float = 0.0) -> void:
	playback_.travel("Walk_And_Shoot")
	
func travel_to_1d_space(anime_name : String, to: float, delta : float) -> void:
	animation_tree_[anime_name] = move_toward(
		animation_tree_[anime_name], to, delta * animation_speed
	)
	
func travel_to_shoot() -> void:
	playback_.travel("1H_Ranged_Shoot")
	
func travel_to_move_and_shoot() -> void:
	playback_.travel("Walk_And_Shoot")
	animation_tree_["parameters/Walk_And_Shoot/OneShot/request"] = AnimationNodeOneShot.ONE_SHOT_REQUEST_FIRE
