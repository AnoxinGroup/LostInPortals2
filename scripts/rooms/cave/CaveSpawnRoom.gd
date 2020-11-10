extends Room
class_name CaveSpawnRoom


func _build():
	spawn(1, 1, Heroes.WARRIOR.instance())

	rect_random(
		Vector2(0, 0),
		Vector2(3, 3),
		[
			Floors.CAVE_BRICKS
		]
	)
	rand_npoints(
		[
			Vector2(0, 0),
			Vector2(2, 0)
		],
		[
			Blocks.CAVE_BRICKS
		]
	)
