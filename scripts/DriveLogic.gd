extends Node2D

signal fail
signal freeze

onready var MYCAR = $Car
onready var TIMELEFT = $CanvasLayer/Label
onready var ENEMY_CAR_SCENE = preload("res://scenes/drive/EnemyCar.tscn")

var has_failed = false
var is_over = false
var time_left = 30


func _ready():
	MYCAR.connect("crash", self, "on_crash")

	$Car.visible = false


func start():
	$GameTimer.start()
	$SpawnTimer.start()
	_on_SpawnTimer_timeout()



func on_crash():
	emit_signal("fail")
	has_failed = true


func _on_GameTimer_timeout():
	time_left -= 1

	if time_left > 0:
		TIMELEFT.text = "Time: " + str(time_left)

		if time_left < 11:
			$SpawnTimer.wait_time = 1.75
		elif time_left < 21:
			$SpawnTimer.wait_time = 2
	else:
		is_over = true


func _on_SpawnTimer_timeout():
	if not is_over and not has_failed:
		randomize()

		var random_exclude_idx = randi() % 3
		var spawnpoints = [$EnemySpawnPoints/Spawn1, $EnemySpawnPoints/Spawn2, $EnemySpawnPoints/Spawn3]
		var random_not_spawn = spawnpoints[random_exclude_idx]

		for child in $EnemySpawnPoints.get_children():
			if child != random_not_spawn:
				var new_enemy_car = ENEMY_CAR_SCENE.instance()
				new_enemy_car.position = child.get_global_transform().get_origin()

#				if time_left < 10:
#					new_enemy_car.speed = 5
#				elif time_left < 20:
#					new_enemy_car.speed = 4

				add_child(new_enemy_car)



func _on_Button_pressed():
	$Instructions.visible = false
	$Car.visible = true
	start()
