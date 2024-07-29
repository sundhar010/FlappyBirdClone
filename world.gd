extends Node2D

var pipes_pair = preload("res://pipes.tscn")

var world_pipes_pairs = []
var rng = RandomNumberGenerator.new()
@export var pipe_speed:int = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	for i in world_pipes_pairs:
		if i.position.x > - 40:
			i.position.x -= delta * pipe_speed

func add_pipes_pair():
	var i1 = pipes_pair.instantiate()
	add_child(i1)
	i1.position.x = 720
	i1.position.y = rng.randf_range(90.0, 320.0)
	move_child(i1, 1)
	world_pipes_pairs.append(i1)


func _on_timer_timeout():
	print("timeout")
	add_pipes_pair() # Replace with function body.
