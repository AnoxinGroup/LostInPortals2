extends Node2D
class_name GameWorld


signal hero_changed(previos, current)
signal level_changed(previos, current)


var depth: int

var queue: Array
"""

Stores levels passed by the current
player.

"""

var level: Level \
	setget set_level


onready var levels: Node2D = get_node("levels")
"""

Reference to the level controller.

"""


func _ready():
	next()


func set_level(new: Level):
	"""

	Set a new level instead of previos and
	trigger `level_changed` event on success.

	"""
	if level:
		levels.call_deferred("remove_child", level)
	levels.call_deferred("add_child", new)

	emit_signal(
		"level_changed",
		level,
		new)

	level = new


func generate():
	return Levels.CAVE_GARDEN.instance()


func next():
	var selected: Level

	depth += 1

	if depth > queue.size():
		selected = generate()
	else:
		selected = queue[depth]

	set_level(selected)


func prev():
	var selected: Level

	depth -= 1

	if depth < 0:
		depth += 1
	else:
		selected = queue[depth]

	if selected:
		set_level(selected)
	else:
		return
