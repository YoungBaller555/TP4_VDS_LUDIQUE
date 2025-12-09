extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if body is Playercontroller:
		Audiocontroller.play_capsule()
		GameManager.add_energy_cell()
		queue_free()
