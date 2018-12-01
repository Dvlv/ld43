extends Node2D

onready var DIALOGUE = $CanvasLayer/DialogueBox
onready var NEXT_SCENE = preload("res://scenes/WorkAmount.tscn")

func _ready():
	my_global_script.animated_scene([
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["Hey, how's it going?"]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["Boy, what a week I've had."]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["I woke up Monday morning as normal, left for work, and found some mail which had been left unnoticed on the ground."]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["Obviously it was great news! ... Not!"]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["My mortgage is overdue. They want a payment of $2000 by the end of the week or they're gonna send some people around to reclaim my house. "]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["I know I may look like a million dollars, but I just don't have that kinda money laying around, y'know?"]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["I head in, I speak to the boss. His face lights up like a christmas tree."]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ['"Sure, I got tons of extra work for you. Do as much overtime as you can, I could really use the help."']},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["\"Things around here aren't lookin' so hot either\" he told me. \"Those two HUGE clients we got in last year ain't happy with our quality of service.\""]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["\"Satisfy them and I'll pay ya mortgage myself, pal\"."]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["Sounds like problem sorted, eh. I just pull some all nighters and we're over the hump."]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["Thing is, with a newborn baby at home, and potentially one more on the way, I couldn't leave my wife home alone all week. She needed me there."]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["Still, I couldn't make her homeless either! She gave up a lot to be with me. If we lost our house, I'd just prove her parents right."]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["So, monday evening rolls around, and people start going home. "]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["Boss came over and asked me to decide how long I'm gonna stay, so he can let security know there's gonna be someone around."]},
		{"target": self, "method": "go_to_amount_scene", "args": []},
	])


func go_to_amount_scene():
	my_global_script.current_day = "mon"

	get_tree().change_scene_to(NEXT_SCENE)