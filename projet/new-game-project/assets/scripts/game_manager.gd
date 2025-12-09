extends Node


var starting_area = 1
var current_area = 1
var area_path = "res://assets/scenes/areas/"

var energy_cells = 0
var area_container : Node2D
var player : Playercontroller
var hud : HUD

func _ready():
	hud = get_tree().get_first_node_in_group("hud")
	area_container = get_tree().get_first_node_in_group("area_container")
	player = get_tree().get_first_node_in_group("player")
	load_area(starting_area)


func next_area():
	current_area += 1
	load_area(current_area)
	
func load_area(_area_number):
	#checking the new scene path
	var full_path = area_path + "area_" + str(current_area) +".tscn"
	var scene = load(full_path) as PackedScene
	if !scene:
		return
		#removing the previous scene
	for child in area_container.get_children():
		child.queue_free()
		await child.tree_exited
	#setting up the new scene
	var instance = scene.instantiate()
	area_container.add_child(instance)
	reset_energy_cells()
	# moving player to start position of the new scene
	var player_start_position = get_tree().get_first_node_in_group("player_start_position") as Node2D
	player.teleport_to_location(player_start_position.position)
	
func add_energy_cell():
	energy_cells += 1
	hud.update_energy_cell_label(energy_cells)
	if energy_cells >= 4:
		var portal = get_tree().get_first_node_in_group("area_exit") as areaexit
		portal.open()
		hud.portal_opened()

func reset_energy_cells():
	energy_cells = 0
	hud.update_energy_cell_label(energy_cells)
	hud.portal_closed()
