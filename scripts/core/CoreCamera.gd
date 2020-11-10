tool
extends Camera2D
class_name CoreCamera

var zoom_step = 1.1;

func _input(event: InputEvent):
	if event is InputEventMouse and event.is_pressed():
		match event.button_index:
			BUTTON_WHEEL_UP:
				zoom *= 1 / zoom_step
			BUTTON_WHEEL_DOWN:
				zoom *= zoom_step
