extends Node2D

export(int) var speed = 3

func _physics_process(delta):
	position.x = position.x + speed


func crash():
	# change sprite
	pass


func _ready():
	get_parent().connect("fail", self, "on_fail")


func on_fail():
	speed = 0