extends Node


func choice(array: Array):
	randomize()
	if array.size() > 0:
		return array[(randi() % array.size()) - 1]
