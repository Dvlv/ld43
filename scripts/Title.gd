extends Node2D



func _on_Button_pressed():
	var i = load("res://scenes/Intro.tscn")
	get_tree().change_scene_to(i)
