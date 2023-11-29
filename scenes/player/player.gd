extends CharacterBody2D

signal laser(pos: Vector2, dir: Vector2)
signal grenade(pos: Vector2, dir: Vector2)

var can_laser: bool = true
var can_grenade: bool = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * 500
	move_and_slide()
	
	look_at(get_global_mouse_position())
	
	var dir = (get_global_mouse_position() - position).normalized()
	
	if Input.is_action_pressed("primary action") and can_laser:
		can_laser = false
		var laser_markers = $LaserStartPositions.get_children()
		var selected_laser = laser_markers.pick_random() as Marker2D
		$TimerLaser.start()
		laser.emit(selected_laser.global_position, dir)
		
	if Input.is_action_pressed("secondary action") and can_grenade:
		can_grenade = false
		var pos = $LaserStartPositions.get_children()[0].global_position
		$TimerGrenade.start();
		grenade.emit(pos, dir)

func _on_timer_laser_timeout() -> void:
	can_laser = true


func _on_timer_grenade_timeout() -> void:
	can_grenade = true
