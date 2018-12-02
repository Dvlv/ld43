extends "res://scripts/ChangesBg.gd"

onready var DIALOGUE = $CanvasLayer/DialogueBox
onready var NEXT_SCENE = preload("res://scenes/Thanks.tscn")

func _ready():
	my_global_script.current_day = "sat"

	my_global_script.animated_scene([
	{"target": self, "method": "change_bg_to", "args": ["bid"]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["He threw the bid in front of me and told me to give it a read over."]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["\"But I wrote it?\" I asked puzzled."]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["\"Shut yer eyes for twenty seconds, then open 'em an' read it properly!\" "]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["I did as instructed."]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["My face must've dropped like a lead balloon."]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["There were spelling errors everywhere. Some of the sentences made no sense, and there was a big coffee ring on the second page. "]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["This was the least professional document I'd ever seen."]},
		{"target": self, "method": "change_bg_to", "args": ["me-boss-1"]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["\"But...\" I began."]},
		{"target": self, "method": "change_bg_to", "args": ["me-boss-2"]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["\"No. Just, don't. You've been working too hard, kid. Don'tcha know how important sleep is for quality of work?\""]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["\"But I...\" I said in desparation"]},
		{"target": self, "method": "change_bg_to", "args": ["me-boss-1"]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["\"No, kid. I know. I know.\""]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["\"Truth is, I've not been myself ever since we lost those other two. I've been drinkin' hard at night.\""]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["\"I didn't even read this before I began. I just saw how much you been workin' and put total confidence in ya.\""]},
		{"target": self, "method": "change_bg_to", "args": ["me-boss-2"]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["\"I looked like such a fool in that room, kid. They thought we're morons. Again!\""]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["\"Most I could do was buy 'em a few drinks to apologise and try some sweet talkin'.\""]},
		{"target": self, "method": "change_bg_to", "args": ["me-boss-1"]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["\"They weren't gonna turn down the drinks, but I knew the whole time they'd given up on us.\""]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["\"I just drank the heartache away\""]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["\"Is...\" I tried."]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["\"Yeah, kid. That's it. End o' the month corporate'll be down here to close us. They've seen us as nothing but an expense for who-knows-how-long\"."]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["\"Just... just go home kid. I can't... I just can't stand to... just...\""]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["I knew what he wanted to say. I gave him a nod and walked out."]},
		{"target": self, "method": "change_bg_to", "args": ["office-me"]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["I'd done this to him. I'd done this to us all."]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["My desire to grab money like there's no tomorrow has put 25 people out of work. "]},
		# present day
		{"target": self, "method": "change_bg_to", "args": ["bg1"]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["But you know what?"]},
		{"target": self, "method": "change_bg_to", "args": ["timecard"]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["Corporate did close that branch. But they took one look at my timecard and decided I was too valuable an employee to lose."]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["They spoke to my boss, who couldn't bring himself to say a bad word about me, knowing my situation. He took the fall on that bid."]},
		{"target": self, "method": "change_bg_to", "args": ["bg1"]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["So now, I'm a boss. The boss of a different branch. Of course, we had to move. But given the pay increase, and the new child, that was a given."]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["I left my few friends behind. I mean, I'm sure they understood that family came first. "]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["As they say, sacrifices must be made."]},
		{"target": self, "method": "change_bg_to", "args": ["me-as-boss"]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["I worked hard to save my family from homelessness. And now I work even harder as management, and make so much more money!"]},
		{"target": self, "method": "change_bg_to", "args": ["house"]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["But does my ex-wife thank me for her new house? No."]},
		{"target": self, "method": "change_bg_to", "args": ["bg1"]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["Thought I'd just make some new friends at work. Maybe meet another nice lady."]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["Thing is"]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["Rumours. They spread like wildfire. My people know what happened back there."]},
		{"target": self, "method": "change_bg_to", "args": ["me-as-boss"]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["I started the job thinking I could be as great a boss as my old one. Maybe I could take someone under my wing, call them \"kid\"."]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["Raise them to my level of success one day, like he did for me."]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["But nah. They all hate me. They think I'm gonna run their branch into the ground, too."]},
		{"target": self, "method": "change_bg_to", "args": ["bg1"]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["Maybe I will, ungrateful brats..."]},
		{"target": self, "method": "change_bg_to", "args": ["date"]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["So, yeah. I make a lotta money, live in a huge house, and have two wonderful children I get to see every weekend."]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["Divorced life is just leaving me a bit lonely. So I'm looking for a friend. Maybe more."]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["I guess that's enough about me."]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["Tell me about yourself."]},
		{"target": self, "method": "go_to_amount_scene", "args": []},
	])


func go_to_amount_scene():
	get_tree().change_scene_to(NEXT_SCENE)