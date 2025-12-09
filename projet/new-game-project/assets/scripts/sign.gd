extends Node2D



func _on_character_body_2d_body_entered(body: Node2D) -> void:
	if body is Playercontroller:
		Audiocontroller.play_scroll()
