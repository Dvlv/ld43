extends Node2D

var speed = 5

func _ready():
	get_parent().connect("fail", self, "on_fail")

func _physics_process(delta):
	position.x = position.x - speed

func on_fail():
	speed = 0

func consume():
	queue_free()