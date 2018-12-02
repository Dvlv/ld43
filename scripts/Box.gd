extends Node2D

signal caught_paper

export(String) var type = ""

func _ready():
	if type == "finance":
		$Sprite.texture = load("res://assets/papersort/box-finance.png")
	elif type == "hr":
		$Sprite.texture = load("res://assets/papersort/box-hr.png")
	else:
		$Sprite.texture = load("res://assets/papersort/box-sales.png")


func _on_Area2D_area_entered(area):
	if area.name == "PaperArea":
		emit_signal("caught_paper", self.type, area.get_parent().type)
		area.get_parent().file()
