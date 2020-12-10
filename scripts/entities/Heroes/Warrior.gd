extends Hero
class_name Warrior

func _ready():
	set_current_state(true)
	connect("move_ended", self, "on_move_ended")
	connect("move_started", self, "on_move_started")

func on_move_ended():
	play_anim("idle")


func on_move_started():
	play_anim("walking")


func _on_Warrior_on_move():
	$AnimationPlayer.play("Walkin")
