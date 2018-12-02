extends "res://scripts/ChangesBg.gd"

onready var DIALOGUE = $CanvasLayer/DialogueBox
onready var NEXT_SCENE = preload("res://scenes/Thanks.tscn")

func _ready():
	my_global_script.current_day = "sat"

	my_global_script.animated_scene([
	{"target": self, "method": "change_bg_to", "args": ["me-boss-1"]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["\"They... they didn't buy it. Just wasn't enough.\""]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["\"Enough?\" I questioned."]},
		{"target": self, "method": "change_bg_to", "args": ["me-boss-2"]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["\"Not enough thought. Not enough care. Not enough room for negotiation.\""]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["\"We had more to offer 'em. An' they know we did. But they wouldn' take my word for it. They wanted it on paper.\""]},
		{"target": self, "method": "change_bg_to", "args": ["me-boss-1"]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["\"An' it wasn't on the paper.\""]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["\"There was just... not enough on the papers.\""]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["I knew it."]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["I was toast."]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["\"I've been tellin' ya about how we're doin'... y'know... financially.\""]},
		{"target": self, "method": "change_bg_to", "args": ["me-boss-2"]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["\"Corporate said next person to screw up is a gonner.\""]},
		{"target": self, "method": "change_bg_to", "args": ["me-boss-1"]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["\"I just... I know about yer kids an' all, but...\""]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["This was it."]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["I was fired."]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["\"Kid... I don't...\""]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["I choked back my emotions. I knew he didn't want to say it. And I didn't want to hear it."]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["I stood up, looking him in the eye, and walked out."]},
		{"target": self, "method": "change_bg_to", "args": ["office-me-empty-desk"]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["My desk was aready being packed up by security. Guy had been waiting to get me since I started working on his shift."]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["I gave them all business property and walked with them to the front door, turning over my ID card."]},
		{"target": self, "method": "change_bg_to", "args": ["bg1"]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["I wondered how much longer it would have taken to get that bid right."]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["I chose to spend time with my family instead of working."]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["I knew that sacrifices must be made, but did I sacrifice too much?"]},
		# Present day
		{"target": self, "method": "change_bg_to", "args": ["street"]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["I haven't been home yet. I know my wife has realised. There's no way she hasn't."]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["I just can't face her. Her and the child. The children. "]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["Bailiffs are coming tomorrow. I'll go back and protect her from them. Help her empty the house."]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["I will..."]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["I must."]},
		{"target": self, "method": "go_to_amount_scene", "args": []},
	])


func go_to_amount_scene():
	get_tree().change_scene_to(NEXT_SCENE)