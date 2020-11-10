tool
extends Area2D
class_name GameObject


func move(direction: Vector2, make_slow=true):
	"""Move your body
	
	Moves the certain game object by the
	given direction (Vector2 direction).
	
	:parametres:
		direction: Vector2
			The direction where to move the
			game object.
	
	Example:
		move(Vector2.UP)
		
	Similar:
		position += Vector2.UP * 16
	
	"""
	var _new_position = position + direction * Globals.CELL
	position = _new_position


func make_camera_follow():
	"""Somebody's watch to me
	
	Makes camera follow certains game
	object.
	
	"""
	$camera.current = true


func set_position_cells(x, y):
	position = Vector2(
		x * Globals.CELL, y * Globals.CELL)
