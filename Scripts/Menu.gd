extends Control

func _ready():
	$Panel.hide()
	$AudioStreamPlayer.play()
	
func _on_Button_pressed():
	get_tree().change_scene("res://Scenes/MondeDeTest.tscn")

func _on_Button3_pressed():
	$Panel.show()

func _on_Button2_pressed():
	get_tree().quit()


func _on_Button4_pressed():
	$Panel.hide()
