extends Node2D

signal crash


func _physics_process(delta):
	position.y = get_viewport().get_mouse_position().y


func _on_Area2D_area_entered(area):
	if area.name == "OtherCarArea":
		area.get_parent().crash()

	emit_signal("crash")
