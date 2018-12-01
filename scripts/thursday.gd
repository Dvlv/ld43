extends Node2D

onready var DIALOGUE = $CanvasLayer/DialogueBox
onready var NEXT_SCENE = preload("res://scenes/WorkAmount.tscn")


func _ready():
	my_global_script.current_day = "thurs"

	if not my_global_script.thursday_minigame_done:
		scene_intro()
	else:
		scene_after_minigame()

	print(my_global_script.thursday_minigame_done)

# minigame - memory

func scene_intro():
	my_global_script.animated_scene([
		{"target": DIALOGUE, "method": "show_dialogue", "args": [saw_wife()]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": [wife_overtime()]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["I promised myself that when this debt is paid I'd spend a whole week with the two of them."]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["Just needed to get out of that mess. "]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["When I got to work on Thursday I noticed a few people were missing."]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": [why_people_missing()]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": [why_people_missing_two()]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["I caught up with the boss that afternoon. He looked nervous."]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["\"Gotta give your bid today son, but uh, listen\""]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["\"Because of, y'know, last time... they just want me there.\""]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["\"I know it's your work and all but, you know what these corporate people are like\""]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["\"Don't sweat it\" I replied \"You're totally the only person I'd trust to deliver this bid exactly how it needs to go.\""]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["\"Go get 'em boss!\" I gave him a reassuring pat on the back, then returned to my work."]},
		{"target": self, "method": "go_to_minigame_scene", "args": []},
	])

func scene_after_minigame():
	my_global_script.animated_scene([
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["That evening, the boss left with the clients for what I assume was a boozy night on the town, so I checked in with security myself."]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["They weren't supposed to deal with non-management directly, but since we'd been doing it all week he let this occasion slide."]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["He sure kept a close eye on me that night, though."]},
		{"target": self, "method": "go_to_amount_scene", "args": []},
	])

func wife_overtime():
	if my_global_script.wife_recent_ot > 0:
		return "That night she slept in the baby's room. I think she felt guilty about the overtime."
	else:
		return "I don't blame her for not doing any overtime. It's not a fun job at all. Plus, I can tell she's stressed."


func saw_wife():
	if my_global_script.recent_overtime > 3:
		return "I didn't get to speak to my wife when I got home. I had seen her all day at work, anyway."
	else:
		return "Me and the wife chatted a little about our day and spent some time with the little one before bed. "


func why_people_missing():
	if my_global_script.overtime > 11:
		return "Apparently I had completed all of the contractors' workloads in my overtime, and we didn't need them anymore."
	else:
		return "Apparently the company is doing worse than I'd realised, and people had to go."


func why_people_missing_two():
	if my_global_script.overtime > 11:
		return "I'd like to think the boss paid them in full, anyway. Though with the financial concerns, I'm not so sure..."
	else:
		return "The boss had mentioned financial troubles, but it had never become a reality until then..."


func go_to_amount_scene():
	get_tree().change_scene_to(NEXT_SCENE)


func go_to_minigame_scene():
	var MINIGAME_SCENE = load("res://scenes/memory/memory.tscn")
	get_tree().change_scene_to(MINIGAME_SCENE)