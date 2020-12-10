tool
extends Node2D
class_name Level

var hero: Hero

onready var objects: YSort = get_node("objects")


func spawn(object: Node2D, pos: Vector2):
	if objects:
		# Update object's position
		object.set_position(
			pos)
		objects.add_child(object)


func destroy(object: Node2D):
	if objects:
		objects.remove_child(object)


func spawn_hero(new: Hero, pos: Vector2):
	spawn(new, pos)

	if new.is_current_hero:
		# when the current player spawned
		# update its view state.
		new.set_camera_follow(
			true)
		hero = new
