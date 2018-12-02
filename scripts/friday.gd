extends "res://scripts/ChangesBg.gd"

onready var DIALOGUE = $CanvasLayer/DialogueBox

func _ready():
	my_global_script.current_day = "fri"

	if not my_global_script.friday_minigame_done:
		intro()
	else:
		post_minigame()

func intro():
	my_global_script.animated_scene([
	{"target": self, "method": "change_bg_to", "args": ["me-bed"]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["I awoke early on Friday to the sound of my wife being sick."]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": [wife_worked()]},
		{"target": self, "method": "change_bg_to", "args": ["wife-babys-room"]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["She slept in the baby's room. Nice to know the kid isn't being neglected in these difficult times."]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": [guilt()]},
		{"target": self, "method": "change_bg_to", "args": ["me-bed"]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["If the big deal had gone down and the boss paid out, I was gonna treat them both at the weekend."]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["I'm working hard for both of them. No, all three of them now."]},
		{"target": self, "method": "change_bg_to", "args": ["paycheque"]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["My paycheque comes in today. Atop the usual $350 I'll have all of the overtime."]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": [money_check()]},
		{"target": self, "method": "change_bg_to", "args": ["me-wife"]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["The wife needed a hospital checkup that afternoon."]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["There was no chance for overtime."]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["In fact, I had to leave an hour early."]},
		{"target": self, "method": "change_bg_to", "args": ["me-boss-1"]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["Obviously the boss was okay when I told him. How could he not be?"]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["He was such a fantastic boss."]},
		{"target": self, "method": "change_bg_to", "args": ["office-me"]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["The office had become a mess since I'd started working late. I took the opportunity to clean up before he came in."]},
		{"target": self, "method": "go_to_minigame_scene", "args": []},
	])

func post_minigame():
	my_global_script.animated_scene([
	{"target": self, "method": "change_bg_to", "args": ["boss-drunk"]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["At 11am the boss dragged himself in. He looked a wreck."]},
		{"target": self, "method": "change_bg_to", "args": ["office-me"]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["\"Good night out?\" I asked."]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["He summoned me into his office."]},
		{"target": self, "method": "change_bg_to", "args": ["boss-me-1"]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["Moment of truth."]},
		{"target": self, "method": "go_to_end_scene", "args": []},
	])


func wife_worked():
	if my_global_script.wife_recent_ot > 0:
		return "Poor thing just found out she's pregnant and is already working like crazy."
	else:
		return "It's probably a good thing she isn't staying late with me."

func guilt():
	if my_global_script.recent_overtime > 3:
		return "Am I a bad person for not feeling as guilty as her?"
	else:
		return "The night before I spent some time with both of them - making sure not to let work get in the way of family."


func money_check():
	if my_global_script.money > 1600:
		return "I'm feeling pretty good about it. I should have done enough to get by."
	else:
		return "I worry if I will make it. Could I have worked harder? Should I have done more overtime?"


func go_to_minigame_scene():
	var mg_scene = load("res://scenes/rubbish/rubbish.tscn")
	get_tree().change_scene_to(mg_scene)

func go_to_end_scene():
	var END_SCENE = null
	if my_global_script.money > 1600:
		END_SCENE = load("res://scenes/RichEnding.tscn")
	else:
		END_SCENE = load("res://scenes/PoorEnding.tscn")
	get_tree().change_scene_to(END_SCENE)