extends Node2D

onready var PAPER_SCENE = preload("res://scenes/papersort/Paper.tscn")
onready var BOX_SCENE = preload("res://scenes/papersort/Box.tscn")

onready var TIMELEFT = $CanvasLayer/Label

var hr_box = null
var sales_box = null
var finance_box = null

var frozen = null
var time_left = 30

var paper_types = ["hr", "sales", "finance"]


func start():
	frozen = false
	time_left = 30
	$CanvasLayer/Label.text = "Time: 30"
	$SpawnTimer.wait_time = 1.5
	$GameTimer.start()
	$SpawnTimer.start()
	$Boxes.visible = true
	_on_SpawnTimer_timeout()


func on_fail():
	frozen = true
	$GameTimer.stop()
	$SpawnTimer.stop()

	for child in $Papers.get_children():
		child.queue_free()

	$Boxes.visible = false
	$Instructions.visible = true


func _ready():
	$Boxes/TopBox.position = Vector2(750, 100)
	$Boxes/MiddleBox.position = Vector2(750, 300)
	$Boxes/BottomBox.position = Vector2(750, 500)

	hr_box = BOX_SCENE.instance()
	hr_box.type = "hr"
	hr_box.scale = Vector2(1, 1)
	$Boxes/TopBox.add_child(hr_box)

	sales_box = BOX_SCENE.instance()
	sales_box.type = "sales"
	sales_box.scale = Vector2(1.25, 1.25)
	$Boxes/MiddleBox.add_child(sales_box)

	finance_box = BOX_SCENE.instance()
	finance_box.type = "finance"
	finance_box.scale = Vector2(1, 1)
	$Boxes/BottomBox.add_child(finance_box)

	for box in [hr_box, sales_box, finance_box]:
		box.connect("caught_paper", self, "on_caught_paper")

	$Boxes.visible = false


func _physics_process(delta):
	if not frozen:
		if Input.is_action_just_released("ui_up"):
			rotate_boxes_up()
		elif Input.is_action_just_released("ui_down"):
			rotate_boxes_down()


func rotate_boxes_down():
	var top_box = $Boxes/TopBox.get_children()[0]
	var middle_box = $Boxes/MiddleBox.get_children()[0]
	var bottom_box = $Boxes/BottomBox.get_children()[0]

	$Boxes/TopBox.remove_child(top_box)
	$Boxes/MiddleBox.remove_child(middle_box)
	$Boxes/BottomBox.remove_child(bottom_box)

	$Boxes/MiddleBox.add_child(top_box)
	$Boxes/BottomBox.add_child(middle_box)
	$Boxes/TopBox.add_child(bottom_box)

	top_box.scale = Vector2(1.25,1.25)
	bottom_box.scale = Vector2(1, 1)
	middle_box.scale = Vector2(1, 1)


func rotate_boxes_up():
	var top_box = $Boxes/TopBox.get_children()[0]
	var middle_box = $Boxes/MiddleBox.get_children()[0]
	var bottom_box = $Boxes/BottomBox.get_children()[0]

	$Boxes/TopBox.remove_child(top_box)
	$Boxes/MiddleBox.remove_child(middle_box)
	$Boxes/BottomBox.remove_child(bottom_box)

	$Boxes/MiddleBox.add_child(bottom_box)
	$Boxes/BottomBox.add_child(top_box)
	$Boxes/TopBox.add_child(middle_box)

	bottom_box.scale = Vector2(1.25,1.25)
	top_box.scale = Vector2(1, 1)
	middle_box.scale = Vector2(1, 1)


func _on_SpawnTimer_timeout():
	var new_paper = PAPER_SCENE.instance()
	var new_paper_type = paper_types[randi() % 3]

	new_paper.type = new_paper_type
	new_paper.position = Vector2(-100, 300)

	$Papers.add_child(new_paper)

func _on_Button_pressed():
	$Instructions.visible = false
	start()


func _on_GameTimer_timeout():
	time_left -= 1

	if time_left > 0:
		TIMELEFT.text = "Time: " + str(time_left)

		if time_left < 16:
			$SpawnTimer.wait_time = 1
	else:
		my_global_script.wednesday_minigame_done = true
		var wednesday = load("res://scenes/wednesday.tscn")
		get_tree().change_scene_to(wednesday)


func on_caught_paper(box_type, paper_type):
	if box_type != paper_type:
		on_fail()