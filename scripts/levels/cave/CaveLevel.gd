extends Level
class_name CaveLevel

func _ready():
	var base = Rooms.CAVE_SPAWN.instance()
	add_child(base)
	connect_rooms(base, Rooms.CAVE_COLD.instance())
