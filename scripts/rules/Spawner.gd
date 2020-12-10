extends Node2D
class_name Spawner

onready var game: Game = get_node("/root/Game")

export (Array, PackedScene) var objects


func _ready():
	var random_selected = Utils.choice(objects)

	if random_selected:
		spawn(random_selected.instance())


func spawn(what: Node2D):
	game.level.call_deferred("spawn", what, global_position)
