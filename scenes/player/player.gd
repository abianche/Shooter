extends CharacterBody2D

signal laser(pos: Vector2, dir: Vector2)
signal grenade(pos: Vector2, dir: Vector2)
signal update_stats

var can_laser: bool = true
var can_grenade: bool = true

@export var max_speed: int = 500
var speed: int = max_speed


func _process(_delta: float) -> void:
	
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	move_and_slide()
	
	look_at(get_global_mouse_position())
	
	var dir = (get_global_mouse_position() - position).normalized()
	
	if Input.is_action_pressed("primary action") and can_laser and Globals.laser_amount > 0:
		Globals.laser_amount -= 1
		$GPUParticles2D.emitting = true
		can_laser = false
		var laser_markers = $LaserStartPositions.get_children()
		var selected_laser = laser_markers.pick_random() as Marker2D
		$TimerLaser.start()
		laser.emit(selected_laser.global_position, dir)
		
	if Input.is_action_pressed("secondary action") and can_grenade and Globals.grenade_amount > 0:
		Globals.grenade_amount -= 1
		can_grenade = false
		var pos = $LaserStartPositions.get_children()[0].global_position
		$TimerGrenade.start();
		grenade.emit(pos, dir)

func _on_timer_laser_timeout() -> void:
	can_laser = true


func _on_timer_grenade_timeout() -> void:
	can_grenade = true

func add_item(type: String) -> void:
	if type == 'laser':
		Globals.laser_amount += 5
	if type == 'grenade':
		Globals.grenade_amount += 1
	update_stats.emit()
