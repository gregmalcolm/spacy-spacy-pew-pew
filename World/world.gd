extends Node2D


func _ready():
	pass


func _process(_delta):
	pass

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		get_tree().change_scene_to_file("res://TitleScreen/title_screen.tscn")
