extends "res://scripts/ChangesBg.gd"

onready var DIALOGUE = $CanvasLayer/DialogueBox
onready var NEXT_SCENE = preload("res://scenes/WorkAmount.tscn")

func _ready():
	my_global_script.current_day = "wed"

	if not my_global_script.wednesday_driving_done:
		intro()
	elif not my_global_script.wednesday_minigame_done:
		post_driving()
	else:
		post_minigame()


func intro():
	my_global_script.animated_scene([
		{"target": DIALOGUE, "method": "show_dialogue", "args": [saw_wife()]},
		{"target": self, "method": "change_bg_to", "args": ["me-bed"]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["Wednesday morning I woke up to my wife making noise from the bathroom."]},
		{"target": self, "method": "change_bg_to", "args": ["me-wife"]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["I asked her what was going on."]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["\"It's happening. Again\""]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["\"Another one?\" I asked"]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["\"Yes. We're having another baby\""]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["We both looked at each other for a minute, not sure whether to jump for joy or cry for help. "]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["Can we afford to give a second child the life it truly deserves?"]},
		{"target": self, "method": "change_bg_to", "args": ["alarm"]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["*beep-beep*, *beep-beep*, *beep-beep*"]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["Oh, my alarm clock. "]},
		{"target": self, "method": "change_bg_to", "args": ["me-wife"]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["\"I need to start getting ready for work.\" I said. \"We'll talk about this tonight\"."]},
		{"target": self, "method": "change_bg_to", "args": ["me-car"]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["On the way into work, it hit me like a ton of bricks. "]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["My wife can't work while pregnant. The fumes produced by those machines can wreak havoc on the baby."]},
	])


func post_driving():
	my_global_script.animated_scene([
		# minigame - drive emotionally
		{"target": self, "method": "change_bg_to", "args": ["me-car"]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["\"WAIT!\" I screamed. There was a temp space open at work. \"I'm sure the boss is pleased enough at my dedication this week to give her the job until the baby comes.\"."]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["\"If I didn't screw up the bid for our huge client, I'm sure he'll be thrilled to help me out.\""]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["..."]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["I hoped."]},
		{"target": self, "method": "change_bg_to", "args": ["me-boss-1"]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["I immediately went straight to the boss' office to make sure he'd had a chance to look over my bid."]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["He had a huge smile on his face. I think."]},
		{"target": self, "method": "change_bg_to", "args": ["me-boss-2"]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["\"You, sir, are a rockstar! This is brilliant! There's no way they'll turn this down.\""]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["\"This is it, we've gottem. We've gottem for sure!\""]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["Well, that was... the best reaction I could have hoped for!"]},
		{"target": self, "method": "change_bg_to", "args": ["me-boss-1"]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["I cleared my throat nervously. \"Glad you like it boss. Hey uh, listen...\""]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["\"My wife just realised she's pregnant again. She can't work at the factory anymore, because of the fumes. You put that...\""]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["\"The temp job? Consider it hers! Will be nice to work with her again.\""]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["\"Ah boss, you're a life-saver!\" I smiled, and let out a huge sigh of relief."]},
		{"target": self, "method": "change_bg_to", "args": ["me-boss-2"]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["\"She can help you with yer overtime, if ya want. I know you ain't in a good place for raisin' a second child, the money could really help.\""]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["I was so thrilled I could've pounced on my boss and given him a huge hug."]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["I didn't though. I just nodded and left the room to phone my wife"]},
		{"target": self, "method": "change_bg_to", "args": ["office-full"]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["I wasn't sure how I felt about asking her to do overtime, so I left it up to her."]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["I knew she didn't really like the work there, found it boring."]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["Still, I knew she didn't really have room to complain. Work is work, money is money."]},
		{"target": self, "method": "change_bg_to", "args": ["office-wife"]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["She dropped the little one over with her parents and came in at lunch."]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["It was nice seeing her, felt like the most I'd seen her all week. Probably was."]},
	])


func post_minigame():
	my_global_script.animated_scene([
		# minigame - sort papers
		{"target": self, "method": "change_bg_to", "args": ["office-wife-boss"]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["That evening, the boss came over to check on us. Security needed to know when the two of us would be leaving."]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["I knew the drill by now."]},
		{"target": self, "method": "go_to_amount_scene", "args": []},
	])


func saw_wife():
	if my_global_script.recent_overtime > 3:
		change_bg_to("wife-baby-asleep")
		return "Wife was asleep when I got home, stomach grumbling like an angry bear. I fell asleep pretty quickly, tired from the long day."
	else:
		change_bg_to("wife-baby")
		return "I got home just as the wife was putting our the baby to bed. She said her stomach felt weird. We both went to bed shortly after."


func go_to_amount_scene():
	get_tree().change_scene_to(NEXT_SCENE)