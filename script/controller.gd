extends Node

var ember: int = 0

var checkpoint_position: Vector2 = Vector2.ZERO
var has_checkpoint: bool = false

var required_ember: int = 5
var current_level_id: int = 1

signal my_ember(ember : int)

func add_ember() -> void:
	ember += 1
	emit_signal("my_ember", ember)

func reset_ember() -> void:
	ember = 0
	emit_signal("my_ember", ember)

func set_checkpoint(pos: Vector2) -> void:
	checkpoint_position = pos
	has_checkpoint = true

func can_open_portal() -> bool:
	return ember >= required_ember

func start_level(level_id: int) -> void:
	has_checkpoint = false
	current_level_id = level_id
	required_ember = 5
	reset_ember()

func go_to_next_level() -> void:
	var next_id: int = current_level_id + 1
	start_level(next_id)
	match next_id:
		2: get_tree().change_scene_to_file("res://scene/level_2.tscn")
		3: get_tree().change_scene_to_file("res://scene/level_3.tscn")
