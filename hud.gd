extends Control

@onready var score = $score:
	set(value):
		score.text = "Score: " + str(value)
