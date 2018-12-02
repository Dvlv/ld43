extends "res://scripts/ChangesBg.gd"

onready var DIALOGUE = $CanvasLayer/DialogueBox


var all_correct = true

func _ready():
	$Question1.visible = false
	$Question2.visible = false
	$Question3.visible = false
	$Question4.visible = false

	$Yesno.visible = false

	my_global_script.animated_scene([
	{"target": self, "method": "change_bg_to", "args": ["office-wife"]},
	{"target": DIALOGUE, "method": "show_dialogue", "args": ["My wife approached me with a business task."]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["\"Hi Honey\""]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["\"I just spoke to Mike about his business trip.\""]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["\"He said he needs you to explain the situation to his boss.\""]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["\"Listen carefully\""]},
		{"target": self, "method": "memory_info", "args": []}
	])


func memory_info():
	my_global_script.animated_scene([
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["\"He left on Monday. He travelled by train to London.\""]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["\"He arrived at 10:15am.\""]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["\"He's now at the Arch Hotel for 4 nights.\""]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["\"The hotel is $15 per night. That's the only business expense.\""]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["\"The client he's meeting are called Minty Fresh.\""]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["\"We could make around $4500 dollars a month if we partner with them.\""]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["\"Did you get all of that?\""]},
		{"target": self, "method": "ask_yesno", "args": []},
	])


func ask_yesno():
	$Yesno.visible = true


func on_yes():
	$Yesno.visible = false

	my_global_script.animated_scene([
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["\"Great! I'll go get his boss, then I have to run. Tell him what I told you.\""]},
		{"target": self, "method": "change_bg_to", "args": ["me-mike-boss"]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["\"Hey there. Your wife said you could tell me all about Mike's trip.\""]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["\"Where's he gone?\""]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["\"Why is he there?\""]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["\"How much is this trip gonna cost us?\""]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["\"And how much will we make if he's not wasting our time?\""]},
		{"target": self, "method": "display_first_question", "args": []},
	])


func on_no():
	$Yesno.visible = false

	my_global_script.animated_scene([
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["\"Okay, listen closely\""]},
		{"target": self, "method": "memory_info", "args": []},
	])


func display_first_question():
	$Question1.visible = true


func display_next_question():
	if $Question1.visible:
		$Question1.visible = false
		$Question2.visible = true
	elif $Question2.visible:
		$Question2.visible = false
		$Question3.visible = true
	elif $Question3.visible:
		$Question3.visible = false
		$Question4.visible = true
	else:
		$Question4.visible = false
		results()


func results():
	my_global_script.animated_scene([
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["\"Hmm. Okay thanks. That's helpful information.\""]},
		{"target": self, "method": "change_bg_to", "args": ["office-wife"]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": ["\"Hey there honey. Did you tell Mike's boss everything I told you?\""]},
		{"target": DIALOGUE, "method": "show_dialogue", "args": [was_successful()]},
		{"target": self, "method": "resume_thursday", "args": []},
	])

func was_successful():
	if all_correct:
		return "Yep. Nailed it!"
	else:
		return "I think so. I tried my best to remember, but it was a lot."


func on_correct():
	display_next_question()

func on_incorrect():
	all_correct = false
	display_next_question()


func resume_thursday():
	my_global_script.thursday_minigame_done = true
	var THURSDAY = load("res://scenes/thursday.tscn")
	get_tree().change_scene_to(THURSDAY)