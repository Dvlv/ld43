extends Node2D

var frames = []

var current_day = "mon"
var money = 0
var overtime = 0
var happiness = 20
var wife_happiness = 20

var overtime_value = 100

var recent_overtime = 0
var wife_recent_ot = 0

var tuesday_minigame_done = false
var wednesday_minigame_done = false
var wednesday_driving_done = false
var thursday_minigame_done = false
var friday_minigame_done = false

var made_erros_in_bid = false


func tie_together_frames():
    frames.remove(0)

    if len(frames) < 1:
        return

    var current = frames[0]
    if not current["target"].is_connected("finished_displaying", self, "tie_together_frames"):
      current["target"].connect("finished_displaying", self, "tie_together_frames")
    current["target"].callv(current["method"], current["args"])


func animated_scene(structure):
    # structure is
    # {target: [method, arg1, arg2, ...]}
    # Every animation must emit finished_displaying upon completion to be included in this chain

    frames = structure

    var current = frames[0]

    current["target"].connect("finished_displaying", self, "tie_together_frames")

    # begin executing the chain by calling the first item's method
    current["target"].callv(current["method"], current["args"])


func add_overtime(additional_ot):
	recent_overtime = additional_ot
	overtime += additional_ot
	money += (overtime_value * additional_ot)

	happiness -= int(additional_ot / 2)
	wife_happiness -= additional_ot