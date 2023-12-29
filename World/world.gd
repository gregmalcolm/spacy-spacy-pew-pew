extends Node2D

func _process(_delta):
	$CanvasLayer/ScreenPos.text = str($Player.position.round())


func _input(event):
	if event.is_action_pressed("ui_cancel"):
		get_tree().change_scene_to_file("res://TitleScreen/title_screen.tscn")
