extends Rule
class_name Exit

onready var game = get_node("/root/Game")


func _ready():
	connect("body_entered", self, "_on_body_entered")


func _on_body_entered(body):
	if body is Hero:
		# destroy hero when it touch
		# exit trigger.
		game.level.destroy(
			body)
		game.world.next()
