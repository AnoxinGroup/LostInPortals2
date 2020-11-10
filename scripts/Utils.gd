extends Node


func choice(array: Array):
	randomize()

	return array[randi() % array.size() - 1]
