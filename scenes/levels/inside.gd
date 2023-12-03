extends LevelParent

@export var outside_level_scene: PackedScene

func _on_exit_gate_area_body_entered(_body: Node2D) -> void:
	var tween = create_tween()
	tween.tween_property($Player, "speed", 0, 0.5)
	call_deferred("deferred_scene_change")


func deferred_scene_change():
	get_tree().change_scene_to_packed(outside_level_scene)
