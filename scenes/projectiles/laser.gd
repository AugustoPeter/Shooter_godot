extends Area2D

@export var speed : int = 1000
var direction : Vector2 = Vector2.UP

func _process(delta: float) :
	position += direction * speed * delta

func _ready() -> void:
	$SelfDestructionTimer.start()

func _on_body_entered(body) -> void:
	if "hit" in body:
		body.hit()
	queue_free()


func _on_self_destruction_timer_timeout() -> void:
	queue_free()
