extends Area2D

@onready var timer: Timer = $Timer

var dead_body: Node2D = null

func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		dead_body = body
		timer.start()

func _on_timer_timeout() -> void:
	if Controller.has_checkpoint and dead_body != null:
		dead_body.global_position = Controller.checkpoint_position
		dead_body.velocity = Vector2.ZERO
	else:
		Controller.reset_ember()
		get_tree().reload_current_scene()
