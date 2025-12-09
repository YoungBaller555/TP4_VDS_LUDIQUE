extends Control


func _on_resume_pressed():
	# Find the scriptpausing node (it's on the area template)
	var pausing_script = get_tree().get_first_node_in_group("player_start_position")
	if pausing_script and pausing_script.has_method("pausemenu"):
		pausing_script.pausemenu()


func _on_quit_pressed():
	get_tree().quit()
