extends Control

@onready var count_label: Label = $HBoxContainer/Count

func get_ember(ember: int) -> void:
	count_label.text = str(ember)

func _ready() -> void:
	Controller.connect("my_ember", get_ember)
