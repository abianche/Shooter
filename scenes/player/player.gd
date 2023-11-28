extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	var direction = Input.get_vector("left", "right", "up", "down")
	position += direction * 500 * delta
	
	if Input.is_action_pressed("primary action"):
		print("shoot laser")
		
	if Input.is_action_pressed("secondary action"):
		print("shoot granade")
