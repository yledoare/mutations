extends KinematicBody2D

export var Vitesse = 100
var Gravite = 500
var ForceDeSaut = -200
const Axes = Vector2(0, -1)
var coordonees = Vector2()
var score = 0
var mutation = 0
var son = false

func _physics_process(delta):
	Course()
	gravite(delta)
	saut()
	_mutation()

func Course():
	if Input.is_action_pressed("ui_right"):
		coordonees.x = Vitesse
		$AnimationsJoueur.play("marche" + str(mutation))
		$AnimationsJoueur.flip_h = false
	elif Input.is_action_pressed("ui_left"):
		coordonees.x = -Vitesse
		$AnimationsJoueur.play("marche" + str(mutation))
		$AnimationsJoueur.flip_h = true
	else:
		$AnimationsJoueur.play("idle" + str(mutation))
		coordonees.x = 0
	move_and_slide(coordonees, Axes)

func gravite(delta):
	if is_on_floor():
		coordonees.y = 0
	else:
		coordonees.y += Gravite * delta

func saut():
	if is_on_floor() and Input.is_action_pressed("ui_up"):
		coordonees.y = ForceDeSaut

func _on_Area2D_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	body.queue_free()
	$AudioStreamPlayer.play()
	mutation = (mutation + 1) % 7
	scale *= 1.1
	if mutation == 6:
		die()

func die():
	#mutation = 0
	#scale = Vector2(1, 1)
	#position = $spawnpos.global_position
	get_tree().change_scene("res://Scenes/over.tscn")

func _on_VisibilityNotifier2D_screen_exited():
	die()

func _mutation():
	if mutation == 1:
		ForceDeSaut = -240
	elif mutation == 2:
		ForceDeSaut = -200
		Vitesse = 150
	elif mutation == 4:
		Vitesse = 100
		Gravite = 400
	
