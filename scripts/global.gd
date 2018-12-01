extends Node2D

var frames = []

var current_day = null
var money = 0
var overtime = 0
var happiness = 50
var wife_happiness = 50

var overtime_value = 100


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