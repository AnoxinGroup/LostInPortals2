extends Node2D
class_name Game

signal scene_changed(previos, current)

var world: GameWorld = Scenes.GAME_WORLD.instance()
"""

Game World reference.

"""

var selected_hero: Hero setget select_hero
"""

Hero, that user selected in the menu scene
before.

.. note::
	`selected_hero` and `hero` are not the same.

"""

var depth: int setget ,get_depth

var level: Level setget set_level, get_level
"""

Current level reference.

"""

var hero: Hero setget set_hero, get_hero
"""

Current hero reference.

"""

var scene: Node2D \
	setget set_scene
"""

Current shown scene.

"""

onready var scenes: Node2D = get_node("scenes")
"""

Scene controller.

"""


func _ready():
	selected_hero = Entities.WARRIOR.instance()
	set_scene(world)


func get_depth() -> int:
	return self.world.depth


func set_level(new: Level):
	self.world.level = new


func get_level() -> Level:
	return self.world.level


func set_hero(new: Hero):
	self.level.hero = new


func get_hero() -> Hero:
	return self.level.hero


func select_hero(new):
	"""

	When the new hero selected update its control
	and view state.

	"""
	new.set_current_state(true)
	selected_hero = new


func set_scene(new: Node2D):
	if scene:
		scenes.remove_child(scene)
	scenes.add_child(new)

	emit_signal(
		"scene_changed",
		scene,
		new)

	scene = new
