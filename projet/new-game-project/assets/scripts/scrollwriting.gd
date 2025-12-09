extends Label




func _on_character_body_2d_body_entered(body: Node2D) -> void:
	Audiocontroller.play_scroll()
	visible = true


func _on_character_body_2d_body_exited(body: Node2D) -> void:
	visible = false


func _on_area_1_child_entered_tree(node: Node) -> void:
	visible = false
