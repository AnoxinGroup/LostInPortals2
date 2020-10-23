extends Room
class_name CaveColdRoom


const BRICKS = preload("res://scenes/blocks/cave/CaveBrick.tscn")


func _build():
	rand_npoints(
		[Vector2(0, 0), Vector2(2, 0)],
		[BRICKS]
	)
