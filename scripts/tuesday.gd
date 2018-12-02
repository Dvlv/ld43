extends Node2D

onready var DIALOGUE = $CanvasLayer/DialogueBox
onready var NEXT_SCENE = preload("res://scenes/WorkAmount.tscn")

func _ready():
	my_global_script.current_day = "tues"

	if not my_global_script.tuesday_minigame_done:
		intro()
	else:
		post_minigame()

func intro():
	my_global_script.animated_scene([
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["I decided to carry on for " + str(my_global_script.overtime) + " hours."]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["Made us an extra $" + str(my_global_script.money) + "."]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": [whether_saw_wife()]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["Tuesday came about next, of course."]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["Mostly a normal day at work."]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": [how_tired()]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["Boss came over to me at lunch looking all serious."]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["Said \"Hey, you know those guys we were talking to last week? That life-changing contract? Well, it's back on!\""]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["\"That's great!\" I said"]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["\"Back on, as in, we get another chance to bid. We haven't won it yet.\""]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["\"Ah, that makes sense...\" I replied"]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["\"Yeah, well, you still after overtime? Get us that contract and I'll buy ya a house myself!\""]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["\"If we lose 'em... uh, well, it ain't lookin' all sunshine, kid. Feel me?\""]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["I nodded"]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["\"Pitch is tomorrow. Knock em out, champ!\""]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["Sounded like the boss really needed me. And I figured everyone at home was fine with me staying late again."]},
	])


func post_minigame():
	my_global_script.animated_scene([
		# mini game - find the right page
		{"target": DIALOGUE, "method": "show_dialogue", "args": [if_made_mistake()]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["That evening, I said goodbye to my last coworker, before catching up with the boss to fill in my overtime."]},
		{"target": self, "method": "go_to_amount_scene", "args": []},
	])


func if_made_mistake():
	if my_global_script.made_erros_in_bid:
		return "Looking back, I don't think I put as much effort into the research as I could've."
	else:
		return "I definitely nailed the research and took some great notes."


func whether_saw_wife():
	if my_global_script.overtime > 3:
		return "I didn't see much of my wife. She was asleep when I got home. Baby was asleep too."
	else:
		return "Wife was still up when I got home. We didn't talk much, but I was still glad to see her after a long day."


func how_tired():
	if my_global_script.overtime > 3:
		return "I was pretty exhausted from last night, but I pushed through the day."
	else:
		return "I wasn't too shaken from my longer day yesterday."

func go_to_amount_scene():
	get_tree().change_scene_to(NEXT_SCENE)