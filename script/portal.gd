extends Node2D

@onready var prompt: Label = $Prompt
@onready var base: AnimatedSprite2D = $Base
@onready var active: AnimatedSprite2D = $Active
@onready var fire: Sprite2D = $Fire

var player_near: bool = false

func _ready() -> void:
	prompt.visible = false
	base.play("default")
	update_portal_state()

func _process(delta: float) -> void:
	update_portal_state()
	if player_near and Input.is_action_just_pressed("interact"):
		try_open()

func update_portal_state() -> void:
	var progress := float(Controller.ember) / float(Controller.required_ember)
	if Controller.can_open_portal():
		fire.visible = false
		base.visible = false
		active.visible = true
		active.play("default")
	else:
		active.visible = false
		base.visible = true
		fire.visible = false
		fire.modulate.a = 1.0 - progress

func try_open() -> void:
	if Controller.can_open_portal():
		Controller.go_to_next_level()
	else:
		prompt.text = "Api belum padam: %d/%d" % [Controller.ember, Controller.required_ember]

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		player_near = true
		prompt.text = "Tekan E"
		prompt.visible = true

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body is CharacterBody2D:
		player_near = false
		prompt.visible = false
