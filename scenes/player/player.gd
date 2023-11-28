extends CharacterBody2D

signal laser
signal grenade

var can_laser: bool = true
var can_grenade: bool = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * 500
	move_and_slide()
	
	if Input.is_action_pressed("primary action") and can_laser:
		laser.emit()
		can_laser = false
		$TimerLaser.start()
		
	if Input.is_action_pressed("secondary action") and can_grenade:
		grenade.emit()
		can_grenade = false
		$TimerGrenade.start();

func _on_timer_laser_timeout() -> void:
	can_laser = true


func _on_timer_grenade_timeout() -> void:
	can_grenade = true
