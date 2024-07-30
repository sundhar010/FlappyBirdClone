extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not $GameOverScreen.visible:
		await get_tree().create_timer(1).timeout
		$GameOverScreen.visible = true
