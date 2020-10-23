extends Node


func choice(array: Array):
	return array[randi() % array.size() - 1]
