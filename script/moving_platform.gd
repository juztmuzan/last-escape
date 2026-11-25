extends AnimatableBody2D

@export var travel: Vector2 = Vector2(80, 0)
@export var duration: float = 2.5

var start: Vector2
var timer: float = 0.0
var going: bool = true

func _ready() -> void:
	start = global_position

func _process(delta: float) -> void:
	timer += delta
	var t := timer / duration
	if t >  1.0:
		t = 1.0
	elif t < 0.0:
		t = 0.0
	if not going:
		t = 1.0 - t
	global_position = start + travel * t
	if timer >= duration:
		timer = 0.0
		going = not going
