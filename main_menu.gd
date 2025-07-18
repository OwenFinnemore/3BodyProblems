extends Node2D


func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://simulation.tscn")
	Global.scale = max(abs(Global.body1posx), abs(Global.body2posx), abs(Global.body3posx), abs(Global.body1posy), abs(Global.body2posy), abs(Global.body3posy)) / (300 / Global.zoom)
	print(Global.scale)

func _on_scale_text_changed(new_text: String) -> void:
	# Remove all non numbers
	var filtered = ""
	for c in new_text:
		if c >= "0" and c <= "9" and $scale.text.length() < 2:
			filtered += c
	if $scale.text != filtered:
		$scale.text = filtered
	Global.zoom = int($scale.text)
