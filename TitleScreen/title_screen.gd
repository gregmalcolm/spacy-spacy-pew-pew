extends Control

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		get_tree().quit()


func _on_play_button_pressed():
	get_tree().change_scene_to_file("res://World/world.tscn") 


func _on_quit_button_pressed():
	get_tree().quit()
