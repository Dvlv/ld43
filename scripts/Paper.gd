extends Node2D


export(String) var type = ""

export(int) var speed = 5

func _ready():
	if type == "finance":
		$Sprite.texture = load("res://assets/papersort/financePaper.png")
	elif type == "hr":
		$Sprite.texture = load("res://assets/papersort/hrPaper.png")
	else:
		$Sprite.texture = load("res://assets/papersort/salesPaper.png")


func _physics_process(delta):
	position.x = position.x + speed


func file():
	# play noise
	get_parent().get_parent().play_noise()
	queue_free()