extends Level
class_name CaveLevel

var base = Rooms.CAVE_COLD.instance()

func _ready():
	add_child(base)
	connect_rooms(base, Rooms.CAVE_COLD.instance())
