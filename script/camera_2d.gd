extends Camera2D

@onready var player: CharacterBody2D = get_parent().get_node("CharacterBody2D")

# Batas kamera sumbu Y — bisa diubah per level di Inspector
@export var min_y: float = -600.0
@export var max_y: float = 450.0

func _process(delta: float) -> void:
	var target_x: float = player.global_position.x
	var target_y: float = clamp(player.global_position.y, min_y, max_y)
	global_position = Vector2(target_x, target_y) 
