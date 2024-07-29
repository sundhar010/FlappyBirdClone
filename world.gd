extends Node2D

var pipes_pair = preload("res://pipes.tscn")

var world_pipes_pairs = []
var rng = RandomNumberGenerator.new()
var score = 0
@export var pipe_speed:int = 100
@onready var hud = $UI/HUD
@onready var bird = $Bird
@onready var gos = $UI/GameOverScreen
func _ready():
	hud.score = 0
	bird.died.connect(_on_player_died)
	gos.visible = false

func _on_player_died():
	get_tree().paused = true
	gos.set_score(score)
	await get_tree().create_timer(1).timeout
	gos.visible = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	for i in world_pipes_pairs:
		if i.position.x > - 40:
			i.position.x -= delta * pipe_speed

func add_pipes_pair():
	var i1 = pipes_pair.instantiate()
	i1.point.connect(increment_score)
	add_child(i1)
	i1.position.x = 720/2
	i1.position.y = rng.randf_range(90.0, 320.0)
	move_child(i1, 2)
	world_pipes_pairs.append(i1)

func increment_score():
	score += 1
	hud.score = score

func _on_timer_timeout():
	print("timeout")
	add_pipes_pair()
