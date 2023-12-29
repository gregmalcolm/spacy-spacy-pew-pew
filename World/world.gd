extends Node2D

@export_subgroup("Debugging")
@export var show_position: bool = false

func _ready():
	if not (show_position and OS.is_debug_build()):
		$CanvasLayer/ScreenPos.visible = false


func _process(_delta):
	if $CanvasLayer/ScreenPos.visible:
		$CanvasLayer/ScreenPos.text = str($Player.position.round())


func _input(event):
	if event.is_action_pressed("ui_cancel"):
		get_tree().change_scene_to_file("res://TitleScreen/title_screen.tscn")
