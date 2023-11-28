extends Node2D

var test_array: Array[String] = ['Test', 'Hello', 'World']

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print('level node is ready')
	$Logo.rotation_degrees = 90
	
	for i in test_array:
		print(i)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Logo.rotation_degrees += 100 * delta
	
	if $Logo.position.x > 1000:
		$Logo.pos.x = 0
		
#	print(Input.is_action_pressed("left"))
