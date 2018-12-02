extends Node2D

signal page_selected

var PAGES = [
	preload("res://assets/buildbid/financePaper.png"),
	preload("res://assets/buildbid/hrPaper.png"),
	preload("res://assets/buildbid/salesPaper.png"),
]

var PAGE_TYPES = [
	"finance",
	"hr",
	"sales",
]

var current_page = 0

func _ready():
	$TextureButton.texture_normal = PAGES[current_page]


func _physics_process(delta):
	if Input.is_action_just_released("ui_left"):
		turn_pages_left()
	elif Input.is_action_just_released("ui_right"):
		turn_pages_right()


func turn_pages_right():
	if current_page > 0:
		current_page -= 1
		$TextureButton.texture_normal = PAGES[current_page]
	else:
		pass # play noise


func turn_pages_left():
	if current_page < (len(PAGES) - 1):
		current_page += 1
		$TextureButton.texture_normal = PAGES[current_page]



func _on_TextureButton_pressed():
	var current_page_type = PAGE_TYPES[current_page]
	emit_signal("page_selected", current_page_type)
