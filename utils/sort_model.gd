@tool # This allows the script to run in the editor
extends Node3D

@export var arrange_nodes: bool = false:
	set(value):
		print_debug("arrange nodes set = ", value)
		if value: # 只有在点击勾选时触发
			_do_arrangement()
			# 排列完后自动取消勾选，方便下次点击
			arrange_nodes = false

@export var offset_x := 1.0
@export var offset_z := -1.0
@export var model_per_rows := 5

# Called when the node enters the scene tree for the first time.
func _do_arrangement() -> void:
	print_debug("do arrangement called")
	var start_x = 0
	var start_z = 0
	var x_index = 0
	for child in get_children():
		if child is Node3D:
			print_debug("child name = ", child.name)
			child.global_position.x = start_x + offset_x
			child.global_position.z = start_z
			start_x += offset_x
			x_index += 1
			if x_index % model_per_rows == 0:
				start_z += offset_z
				start_x = 0
				
	print_debug("%d rows, each row with %d models" % [x_index + 1, model_per_rows])
		
