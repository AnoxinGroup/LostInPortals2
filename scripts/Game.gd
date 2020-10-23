tool
extends Node2D
class_name Game

signal level_set(new_level)
signal depth_changed(new_value)
signal fail_last_level

onready var map_manager = $map_manager

var current_level

var depth: int = 0 setget set_depth
var passed_levels: Array = []


func _ready():
	randomize()
	next_level()


func set_depth(new_value):
	depth = new_value
	emit_signal("depth_changed", new_value)


func increase_depth():
	depth += 1


func decrease_depth():
	depth -= 1


func set_current_level(new_level):
	current_level = new_level
	map_manager.add_child(new_level)
	emit_signal("level_set", new_level)


func reset_level(new_level):
	if current_level != null:
		map_manager.remove_child(current_level)
	set_current_level(new_level)


func generate_level():
	match depth:
		1, 2, 3: return Levels.CAVE.instance()
		4: return 2


func next_level():
	#
	# Go deeper, level by level
	increase_depth()
	
	var certain_level
	
	if depth > passed_levels.size():
		certain_level = generate_level()
		passed_levels.append(certain_level)
	else:
		certain_level = passed_levels[depth - 1]
	
	reset_level(certain_level)


func last_level():
	#
	# Go up
	if depth > 1:
		decrease_depth()
		reset_level(passed_levels[depth - 1])
	else:
		emit_signal("fail_last_level")
