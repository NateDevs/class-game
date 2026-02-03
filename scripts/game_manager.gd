extends Node
class_name GameManager

var score : int = 0

func add_points(points : int ) -> void:
	score += points #score = score + 1
	print(score)
