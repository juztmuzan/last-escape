extends Control

func _on_btn_mulai_pressed() -> void:
	get_tree().change_scene_to_file("res://scene/intro.tscn")

func _on_btn_keluar_pressed() -> void:
	get_tree().quit()
