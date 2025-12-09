extends Node2D

func _ready():
	play_music()


func play_music():
	$music.play()

func play_jump() -> void:
	$jump.play()


func play_end_level():
	$endlevel.play()


func play_capsule():
	$capsule.play()
