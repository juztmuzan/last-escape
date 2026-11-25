extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		Controller.set_checkpoint(global_position)
		$Visual.play("default")
