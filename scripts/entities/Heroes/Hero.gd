tool
extends Entity
class_name Hero

var is_current_hero: bool setget set_current_state


func _ready():
	pass


func set_current_state(new_value: bool):
	set_control_state(true)

	is_current_hero = new_value
