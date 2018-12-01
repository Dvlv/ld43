extends Node2D

func _process(delta):
	position.y = get_viewport().get_mouse_position().y

func _on_Area2D_area_entered(area):
	if area.name == "RubbishArea":
		area.get_parent().consume()

