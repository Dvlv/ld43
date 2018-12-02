extends Node2D

export(bool) var is_disabled = false

func _physics_process(delta):
	if not is_disabled:
		position.y = get_viewport().get_mouse_position().y

func _on_Area2D_area_entered(area):
	if area.name == "RubbishArea":
		$Sound.play()
		area.get_parent().consume()

