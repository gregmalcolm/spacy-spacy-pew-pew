extends Node2D

@export_subgroup("Motion")
@export var offset: Vector2 = Vector2(0,0)
@export var sizing: Vector2 = Vector2(0,0)

func _process(_delta):
	_relign_all_child_nodes()

func _relign_all_child_nodes():
	for child in get_children():
		if (child is Node2D): 
			_realign_child_node(child)
		if (child is GPUParticles2D):
			_move_child_particles(child):

func _realign_child_node(child):
	var camera = get_viewport().get_camera_2d()
	var camera_position = camera.get_screen_center_position()

	child.position.x = offset.x + (floor(camera_position.x/sizing.x) * sizing.x)
	child.position.y = offset.y + (floor(camera_position.y/sizing.y) * sizing.y)
	
func _move_child_particles(child):
	print child.children().count
	pass
