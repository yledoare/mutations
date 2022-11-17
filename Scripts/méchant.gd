extends KinematicBody2D

var speed = 50
var velocity = Vector2()
var Bullet = load("res://Scenes/bidon.tscn")

func get_input():
	velocity = Vector2()
	velocity.x += 1
	velocity = velocity.normalized() * speed

func _physics_process(delta):
	get_input()
	var collision = move_and_collide(velocity * delta)
	if collision:
		$Sprite.flip_h = !$Sprite.flip_h 
		speed *= -1
