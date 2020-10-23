tool
extends Camera2D
class_name CoreCamera


func _input(event: InputEvent):
	if event is InputEventMouse and event.is_pressed():
		if event.button_index == BUTTON_WHEEL_UP:
			zoom -= 0.1


func zoom_point(zoom_value):
	zoom = zoom_value
