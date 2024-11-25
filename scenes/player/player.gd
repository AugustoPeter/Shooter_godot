extends CharacterBody2D

var can_laser : bool = true
var can_granade : bool = true

signal laser(position, direction)
signal granade(position, direction)

@export var max_speed : int = 1000
var speed : int = max_speed

func _process(_delta: float) -> void:
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	move_and_slide()
	
	look_at(get_global_mouse_position())
	var player_direction = (get_global_mouse_position() - position).normalized()
	
	if Input.is_action_pressed("primary action") and can_laser :
		$GPUParticles2D.emitting = true
		var laser_markers = $LaseStartPosition.get_children()
		var selected_lase = laser_markers[randi() %  laser_markers.size()]
		can_laser = false
		$ShootTimer.start()
		laser.emit(selected_lase.global_position, player_direction)
		
		
	if Input.is_action_pressed("secondary action") and can_granade :
		can_granade = false
		$GranadeTimer.start()
		var laser_markers = $LaseStartPosition.get_children()
		var lase_mark = laser_markers[0].global_position
		granade.emit(lase_mark, player_direction)

func _on_timer_timeout() -> void:
	can_laser = true

func _on_granade_timer_timeout() -> void:
	can_granade = true
