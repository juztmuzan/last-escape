extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		if Controller.has_checkpoint:
			body.global_position = Controller.checkpoint_position
			body.velocity = Vector2.ZERO
		else:
			Controller.reset_ember()
			get_tree().reload_current_scene()
