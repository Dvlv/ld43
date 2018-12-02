extends Node2D

signal fail
signal freeze

onready var TIMELEFT = $CanvasLayer/Label
onready var ENEMY_CAR_SCENE = preload("res://scenes/drive/EnemyCar.tscn")

var has_failed = false
var is_over = false
var time_left = 30


func _ready():
	$Car.connect("crash", self, "on_crash")
	$Car.visible = false
	$Road.visible = false


func start():
	has_failed = false
	time_left = 30
	TIMELEFT.text = "Time: 30"
	$Car.visible = true
	$Road.visible = true
	$SpawnTimer.wait_time = 2

	$GameTimer.start()
	$SpawnTimer.start()
	_on_SpawnTimer_timeout()


func on_crash():
	$Crash.play()
	emit_signal("fail")
	has_failed = true
	$GameTimer.stop()
	$SpawnTimer.stop()
	$Instructions.visible = true
	$Car.visible = false
	$Road.visible = false

	for child in $EnemyCars.get_children():
		child.queue_free()


func _on_GameTimer_timeout():
	time_left -= 1

	if time_left > 0:
		TIMELEFT.text = "Time: " + str(time_left)

		if time_left < 11:
			$SpawnTimer.wait_time = 1.5
		elif time_left < 21:
			$SpawnTimer.wait_time = 1.75
	else:
		is_over = true
		finish()


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

				$EnemyCars.add_child(new_enemy_car)


func _on_Button_pressed():
	$Instructions.visible = false
	$Car.visible = true
	start()


func finish():
	my_global_script.wednesday_driving_done = true
	var wed = load("res://scenes/wednesday.tscn")
	get_tree().change_scene_to(wed)

