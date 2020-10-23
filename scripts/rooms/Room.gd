tool
extends Level
class_name Room


var exit_point = Vector2(1, 3)
var entry_point = Vector2(1, 0)


func _ready():
	_build()


func _build():
	pass


# CALCULATE HORIZONTAL POSITION
#
# + - - - +
# .       .
# .       .
# + - o - + <- + connect them here.
# + - I - + <- + o - exit point.
# .       .    + I - entry point.
# .       .
# + - - - +
#
# That's what calculating position of the
# room according to positions of the exit point
# of the base room and entry point of this one.
# There was also vertical calculation before,
# but it was cut off, because rooms spawns
# only from top to the bottom, no left to
# right connection avaible.
func _calc_position_horizontal(exit, entry):
	var exit_x = exit.x
	var entry_x = entry.x
	
	var absolute_position = self.position + exit
	
	if entry_x > exit_x:
		absolute_position.x -= entry_x - exit_x
	elif exit_x > entry_x:
		absolute_position.x += exit_x - entry_x
	elif exit_x == entry_x:
		absolute_position.x = exit_x - entry_x
	
	return absolute_position


func connect_room(another_room):
	var _exit_point = self.exit_point
	var _entry_point = another_room.entry_point
	var _position_to_spawn

	_position_to_spawn =  _calc_position_horizontal(
		_exit_point, _entry_point)
	
	another_room.position = Globals.to_cell(_position_to_spawn)

	return another_room


func rand_points(points: Array, classes: Array):
	randomize()

	var _selected_class
	
	for point in points:
		_selected_class = Utils.choice(classes)
		if _selected_class != null:
			spawnv(point, _selected_class.instance())


func rand_npoints(points: Array, classes: Array):
	classes.append(null)
	rand_points(points, classes)
