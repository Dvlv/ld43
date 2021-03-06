extends Node2D

var NOTEBOOK_SHEETS = [
	preload("res://assets/buildbid/pad-finance.png"),
	preload("res://assets/buildbid/pad-sales.png"),
	preload("res://assets/buildbid/pad-policy.png"),
	preload("res://assets/buildbid/pad-profit.png"),
	preload("res://assets/buildbid/pad-terms.png"),
]

var NEEDED_TYPES = ["finance", "sales", "policy", "profit", "terms"]

var current_needed_type = 0
var built_report = {}

func _ready():
	$CompanyBook.visible = false
	$Notebook.visible = false
	$CompanyBook.connect("page_selected", self, "on_page_selected")


func start():
	$CompanyBook.visible = true
	$Notebook.visible = true
	$Instructions.visible = false


func on_page_selected(page_type):
	built_report[NEEDED_TYPES[current_needed_type]] = page_type
	current_needed_type += 1
	if current_needed_type < len(NOTEBOOK_SHEETS):
		flip_notebook()
	else:
		finish()


func flip_notebook():
	# play sound
	$Notebook/Sprite.texture = NOTEBOOK_SHEETS[current_needed_type]
	$PadFlip.play()


func finish():
	for page in built_report:
		if not built_report[page] == page:
			my_global_script.made_erros_in_bid = true

	my_global_script.tuesday_minigame_done = true
	var tuesday = load("res://scenes/tuesday.tscn")
	get_tree().change_scene_to(tuesday)



func _on_Button_pressed():
	start()
