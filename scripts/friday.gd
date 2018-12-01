extends Node2D

onready var DIALOGUE = $CanvasLayer/DialogueBox

func _ready():
	my_global_script.current_day = "fri"

	my_global_script.animated_scene([
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["I awoke early on Friday to the sound of my wife being sick."]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": [wife_worked()]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["She slept in the baby's room. Nice to know the kid isn't being neglected in these difficult times."]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": [guilt()]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["If the big deal had gone down and the boss paid out, I was gonna treat them both at the weekend."]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["I'm working hard for both of them. No, all three of them now."]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["My paycheque comes in today. Atop the usual $350 I'll have all of the overtime."]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": [money_check()]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["The wife needed a hospital checkup that afternoon."]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["There was no chance for overtime."]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["In fact, I had to leave an hour early."]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["Obviously the boss was okay when I told him. How could he not be?"]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["He was such a fantastic boss."]},
		# minigame - cleanup
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["At 11am the boss dragged himself in. He looked a wreck."]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["\"Good night out?\" I asked."]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["He summoned me into his office."]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["Moment of truth."]},
		{"target": self, "method": "go_to_end_scene", "args": []},
	])


func wife_worked():
	if my_global_script.wife_recent_ot > 0:
		return "Poor thing just found out she's pregnant and is already being worked like a dog."
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


func go_to_end_scene():
	var END_SCENE = null
	if my_global_script.money > 1600:
		END_SCENE = load("res://scenes/RichEnding.tscn")
	else:
		END_SCENE = load("res://scenes/PoorEnding.tscn")
	get_tree().change_scene_to(END_SCENE)