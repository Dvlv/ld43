extends Control

onready var PLAYER_SLIDER = $VBoxContainer/Player/MarginContainer2/VBoxContainer/HSlider
onready var WIFE_SLIDER = $VBoxContainer/Wife/MarginContainer3/VBoxContainer2/HSlider
onready var MONEY = $VBoxContainer/CenterContainer/VBoxContainer/Money
onready var OVERTIME = $VBoxContainer/CenterContainer/VBoxContainer/Overtime

var overtime = 0
var money = 0

var w_overtime = 0

func _ready():
	PLAYER_SLIDER.connect("value_changed", self, "on_player_slider_value_changed")
	WIFE_SLIDER.connect("value_changed", self, "on_wife_slider_value_changed")


func on_player_slider_value_changed(value):
	overtime = value

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

func on_wife_slider_value_changed(value):
	w_overtime = value
	update_time_and_money()