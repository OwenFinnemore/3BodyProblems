extends Node2D

func _ready() -> void:
	$Centerpoint.scale = Vector2(1, -1)





func _on_time_drag_ended(value_changed: bool) -> void:
	Global.time = $time.value
