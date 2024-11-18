extends RigidBody2D

const speed = 750

func Explode():
	$PointLight2D.visible = false
	$AnimationPlayer.play("Explosion")
