extends Control

signal finished_displaying

onready var TIMER = $Timer
onready var TEXT = $VBoxContainer/MarginContainer3/NinePatchRect/Text
onready var NEXT = $VBoxContainer/MarginContainer3/NinePatchRect/Next

var listening = false

func _ready():
    NEXT.visible = false

func _process(delta):
    if listening:
        if Input.is_action_just_released("ui_accept"):
            NEXT.visible = false
            TEXT.visible_characters = 0
            self.visible = false
            listening = false
            emit_signal("finished_displaying")

func set_text(text):
    TEXT.text = text

func display_text():
    TIMER.start()

func show_dialogue(text):
    self.visible = true
    listening = false
    NEXT.visible = false

    set_text(text)
    display_text()

func dialogue_finished_callback():
    TIMER.stop()
    NEXT.visible = true
    listening = true