tool
extends Node2D
class_name Level


func spawn(cell_x, cell_y, game_object):
	game_object.set_position_cells(
		cell_x, cell_y)
	add_child(game_object)


func spawnv(cell_vec, game_object):
	game_object.set_position_cells(
		cell_vec.x, cell_vec.y)
	add_child(game_object)


func connect_rooms(base_room, another_room):
	add_child(
		base_room.connect_room(another_room))
