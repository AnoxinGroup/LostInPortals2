extends Rule
class_name Entry


onready var game: Game = get_node("/root/Game")


func _ready():
	game.level.call_deferred(
		"spawn_hero", game.selected_hero, global_position)
