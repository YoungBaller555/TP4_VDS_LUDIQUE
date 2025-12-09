extends Area2D
class_name areaexit

@onready var audio1 = $audioportal
@export var sprite : Sprite2D

var is_open = false

func _ready():
	close()

func open():
	is_open = true
	sprite.region_rect.position.x = 0
	
func close():
	is_open = false
	sprite.region_rect.position.x = 0

func _on_body_entered(body):
	if is_open && body is Playercontroller:
		audio1.play()
		GameManager.next_area()
		
