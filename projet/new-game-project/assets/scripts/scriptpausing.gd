extends Node2D

var pause_menu: Control = null
var paused = false


func _ready():
	# Find the pause menu in the scene tree (it's under player in gameplay scene)
	var player = get_tree().get_first_node_in_group("player")
	if player:
		pause_menu = player.get_node_or_null("pausemenu")


func _process(_delta):
	if Input.is_action_just_pressed("escape"):
		pausemenu()
		
func pausemenu():
	if pause_menu == null:
		return
		
	if paused:
		pause_menu.hide()
		Engine.time_scale = 1
	else:
		pause_menu.show()
		Engine.time_scale = 0
	
	paused = !paused
