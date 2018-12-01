extends Node2D

signal fail

var fail_count = 0
var level_time = 30
var has_failed = false

var RUBBISH_SCENES = ["rub1.tscn", "rub2.tscn"]

onready var TIMELEFT = $CanvasLayer/TimeLabel
onready var MISSLABEL = $CanvasLayer/MissLabel

func _ready():
	$Bag.visible = false


func start():
	$GameTimer.start()
	$SpawnTimer.start()
	$Bag.is_disabled = false
	has_failed = false
	MISSLABEL.text = "Missed: 0"
	TIMELEFT.text = "Time: 30"


func _on_FailArea_area_entered(area):
	fail_count += 1

	MISSLABEL.text = "Missed: " + str(fail_count)

	if fail_count > 2:
		emit_signal("fail")
		$SpawnTimer.stop()
		$GameTimer.stop()
		level_time = 30
		fail_count = 0

		has_failed = true
		$Bag.is_disabled = true
		$Bag.visible = false
		for child in $RubbishBits.get_children():
			child.queue_free()

		$Instructions.visible = true


func _on_GameTimer_timeout():
	level_time -= 1
	if level_time > 0:
		TIMELEFT.text = "Time: " + str(level_time)
	else:
		resume_friday()


func _on_SpawnTimer_timeout():
	if not has_failed:
		randomize()
		var rand_y = rand_range(50, 550)

		var new_rubbish_choice = RUBBISH_SCENES[(randi() % len(RUBBISH_SCENES))]
		var new_rubbish_scene_path = "res://scenes/rubbish/" + new_rubbish_choice

		var new_rubbish = load(new_rubbish_scene_path).instance()
		new_rubbish.position = Vector2(1025, rand_y)
		$RubbishBits.add_child(new_rubbish)


func resume_friday():
	my_global_script.friday_minigame_done = true
	var fri = load("res://scenes/friday.tscn")
	get_tree().change_scene_to(fri)

func _on_Button_pressed():
	$Instructions.visible = false
	$Bag.visible = true
	start()
