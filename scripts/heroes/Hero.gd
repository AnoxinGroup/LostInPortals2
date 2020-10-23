tool
extends Entity
class_name Hero

func _ready():
	make_camera_follow()

func _unhandled_input(event: InputEvent):
	move_on_event(event)

func move_on_event(event: InputEvent):
	if event.is_action_pressed("up"):
		move(Vector2.UP)
	elif event.is_action_pressed("down"):
		move(Vector2.DOWN)
	elif event.is_action_pressed("left"):
		move(Vector2.LEFT)
	elif event.is_action_pressed("right"):
		move(Vector2.RIGHT)
