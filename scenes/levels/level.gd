extends Node2D

class_name LeveParent

var laser_scene: PackedScene = preload("res://scenes/projectiles/laser.tscn")
var granade_scene: PackedScene = preload("res://scenes/projectiles/granade.tscn") 

func _on_gate_player_exist_gate(_body: Variant) -> void:
	print('pacote saiu do forno')

func _on_player_laser(lase_position, direction) -> void:
	var laser = laser_scene.instantiate() as Area2D
	laser.position = lase_position
	laser.rotation_degrees = rad_to_deg(direction.angle()) + 90
	laser.direction = direction
	$Projectile.add_child(laser)

func _on_player_granade(granade_position, direction) -> void:
	var granade = granade_scene.instantiate() as RigidBody2D
	granade.position = granade_position
	granade.linear_velocity = direction * granade.speed
	$Projectile.add_child(granade)


func _on_house_player_entered() -> void:
	var tween = get_tree().create_tween()
	tween.tween_property($Player/Camera2D, "zoom", Vector2(0.69,0.69), 1.2)


func _on_house_player_exit() -> void:
	var tween = get_tree().create_tween()
	tween.tween_property($Player/Camera2D, "zoom", Vector2(0.5,0.5), 1.2)
