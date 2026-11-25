class_name Gate
extends StaticBody2D

signal opened
signal closed

@export var open_collision_enabled: bool = false

var is_open: bool = false

@onready var collision: CollisionShape2D = $CollisionShape2D
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

func _ready() -> void:
    set_closed(is_open)

func open() -> void:
    if is_open:
        return
    is_open = true
    set_closed(false)
    opened.emit()

func close() -> void:
    if not is_open:
        return
    is_open = false
    set_closed(true)
    closed.emit()

func set_closed(closed: bool) -> void:
    if collision:
        collision.disabled = not closed
    if sprite:
        if closed:
            sprite.play("closed")
        else:
            sprite.play("open")
