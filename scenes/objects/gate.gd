extends StaticBody2D

signal player_etered_gate(body)
signal player_exist_gate(body)

func _on_area_2d_body_entered(body: Node2D) -> void:
	player_etered_gate.emit(body)


func _on_area_2d_body_exited(body: Node2D) -> void:
	player_exist_gate.emit(body)
