extends KinematicBody2D

var Bullet = load("res://Scenes/bidon.tscn")

func _ready():
	pass

func _shoot():
	var b = Bullet.instance()
	b.position.x  = position.x
	b.position.y  = position.y - 20
	owner.add_child(b)
	$AnimatedSprite.stop()

func _on_Timer_timeout():
	$AnimatedSprite.play("attaque")

func _on_Area2D_area_entered(_area):
	print ("A l'attaque")
	$Timer.start(0.5)

func _on_AnimatedSprite_animation_finished():
	_shoot()
