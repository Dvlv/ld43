extends Control

onready var PLAYER_SLIDER = $VBoxContainer/Player/MarginContainer2/VBoxContainer/HSlider
onready var WIFE_SLIDER = $VBoxContainer/Wife/MarginContainer3/VBoxContainer2/HSlider
onready var MONEY = $VBoxContainer/CenterContainer/VBoxContainer/Money
onready var OVERTIME = $VBoxContainer/CenterContainer/VBoxContainer/Overtime
onready var SUBMIT_BTN = $VBoxContainer/CenterContainer/VBoxContainer/Button

var overtime = 1
var money = 0

var w_overtime = 0

func _ready():
	PLAYER_SLIDER.connect("value_changed", self, "on_player_slider_value_changed")
	WIFE_SLIDER.connect("value_changed", self, "on_wife_slider_value_changed")
	SUBMIT_BTN.connect("pressed", self, "on_submit")

	if my_global_script.current_day in ["wed", "thurs"]:
		$VBoxContainer/Wife.visible = true
	else:
		$VBoxContainer/Wife.visible = false


func on_player_slider_value_changed(value):
	overtime = value

	update_time_and_money()


func on_wife_slider_value_changed(value):
	w_overtime = value
	update_time_and_money()


func update_time_and_money():
	var total_ot = w_overtime + overtime

	money = total_ot * my_global_script.overtime_value

	var ot_text = "Overtime: " + str(total_ot) + " hour"
	if total_ot > 1:
		ot_text += "s"

	var money_text = "Pay: $" + str(money)

	OVERTIME.text = ot_text
	MONEY.text = money_text


func on_submit():
	my_global_script.add_overtime((w_overtime + overtime))
	my_global_script.wife_recent_ot = w_overtime

	var next_scene = null
	if my_global_script.current_day == "mon":
		next_scene = load("res://scenes/tuesday.tscn")
	elif my_global_script.current_day == "tues":
		next_scene = load("res://scenes/wednesday.tscn")
	elif my_global_script.current_day == "wed":
		next_scene = load("res://scenes/thursday.tscn")
	elif my_global_script.current_day == "thurs":
		next_scene = load("res://scenes/friday.tscn")

	get_tree().change_scene_to(next_scene)