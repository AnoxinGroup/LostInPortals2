tool
extends KinematicBody2D
class_name Entity

signal on_move
"""

Triggers until the entity moves.

"""

signal move_ended
"""

This signal triggers when the entity stoped.

"""

signal move_started
"""

This signal triggers when the entity started
moving.

"""

signal room_exited
"""

This signal triggers when the entity left the room.

"""

signal room_entered
"""

This signal triggers when an entity enters the
certain room.

"""

export (float) var speed = 1.2
"""

This tells how fast the entity moves.

.. note::
	This variable exported, so you can change
	it's value through the editor.

"""

var moving setget set_moving_state
"""

Checks whether the player is moving now.

"""

var camera_follow = false setget set_camera_follow
"""

This tells whether the camera of the entity is
main and it follows this entity.

"""

var under_control = false setget set_control_state
"""

This tells that the entity is under the player
control.

"""

onready var camera = get_node("Camera2D")
onready var sprite = get_node("AnimatedSprite")


func set_moving_state(new_value):
	"""

	Setter of the `moving` state.
	Ignoring when the moving state is
	the same, but when it changed, triggers
	events `move_ended` on `false` or
	`move_started` on `true`.

	"""

	if new_value:
		emit_signal("on_move")

	if new_value == moving:
		return
	
	if new_value == false:
		emit_signal("move_ended")
	else:
		emit_signal("move_started")
	
	moving = new_value


func set_camera_follow(new_value: bool):
	"""

	Set the camera as a main one.

	"""
	camera.current = new_value


func set_control_state(new_value: bool):
	"""

	Update the control state of the entity.

	"""
	under_control = new_value


func move(direction: Vector2):
	"""

	Moves the entity by the given direction and
	updates the moving state.

	"""
	flip_sprite(direction)
	
	move_and_collide(direction * speed)
	
	set_moving_state(true)


func flip_sprite(direction: Vector2):
	"""

	Flips the sprite of the entity by the given
	direction.

	"""
	match direction:

		Vector2.LEFT:
			sprite.flip_h = true

		Vector2.RIGHT:
			sprite.flip_h = false


func play_anim(anim):
	if sprite.is_playing():
		sprite.stop()
	sprite.play(anim)


func do_logic():
	"""

	Some user-defined logic.

	"""
	pass


func _do_control(delta):
	if Input.is_action_pressed("up"):
		move(Vector2.UP)
	if Input.is_action_pressed("right"):
		move(Vector2.RIGHT)
	if Input.is_action_pressed("left"):
		move(Vector2.LEFT)
	if Input.is_action_pressed("down"):
		move(Vector2.DOWN)


func _physics_process(delta):
	var _last_position = position
	
	if under_control:
		_do_control(delta)
	
	do_logic()
	
	if _last_position == position:
		set_moving_state(false)
