extends Area2D

signal activated

@export var gate_node: Node2D
@export var activation_sound: AudioStream

var is_activated: bool = false

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

func _ready() -> void:
    if sprite:
        sprite.play("default")

func _on_body_entered(body: Node2D) -> void:
    if is_activated:
        return
    if body is CharacterBody2D:
        is_activated = true
        if sprite:
            sprite.play("active")
        activated.emit()
        if gate_node:
            var gate = gate_node as Gate
            if gate:
                gate.open()
