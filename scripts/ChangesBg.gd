extends Node2D

signal finished_displaying

func change_bg_to(bg_img):
	var bg = load("res://assets/bgs/" + str(bg_img) + ".png")
	$Background.texture = bg
	emit_signal("finished_displaying")