extends Node2D

@export var tile_size := Vector2(200, 200)

var particles_matrix

func _ready():
	_setupParticles()


func _process(_delta):
	_realign_particles_grid()
	

func _on_rebuild_timer_timeout(node):
	print("_on_rebuild_timer_timeout")
	node.speed_scale = 1

func _emptyParticlesMatrix():
	return [[null, null], [null, null]]


func _buildParticlesNode(index = 0):
	var mid_tile_size = tile_size * 0.5
	var process_material = ParticleProcessMaterial.new()
	process_material.particle_flag_disable_z = true
	process_material.emission_shape = ParticleProcessMaterial.EmissionShape.EMISSION_SHAPE_BOX 
	process_material.emission_shape_offset = Vector3(mid_tile_size.x, mid_tile_size.y, 0)
	process_material.emission_box_extents = Vector3(mid_tile_size.x, mid_tile_size.y, 0)
	process_material.gravity = Vector3.ZERO
	process_material.scale_min = 0.01
	process_material.scale_max = 0.03
	process_material.hue_variation_max = 0.05
	
	var particles = StarfieldParticles.new()
	particles.amount = 100 
	particles.lifetime = 500
	particles.preprocess = 500
	particles.texture = preload("res://addons/kenney_particle-pack/PNG (Transparent)/star_05.png")
	particles.process_material = process_material
	particles.visibility_rect = Rect2(
		Vector2.ZERO,
		tile_size * 1.2,
	)
	particles.position = Vector2.ZERO
	particles.visibility_rect_color = Color.from_hsv(0.2 + (index * 0.2), 0.7, .6, 0.05)

	return particles


func _setupParticles():
	particles_matrix = _emptyParticlesMatrix()
	
	var index = 0
	for y in range(0,2):
		for x in range(0,2):
			particles_matrix[y][x] = _buildParticlesNode(index)
			index += 1

	particles_matrix[0][1].position.x += tile_size.x
	particles_matrix[0][1].grid_offset.x = tile_size.x
	
	particles_matrix[1][0].position.y += tile_size.y
	particles_matrix[1][0].grid_offset.y = tile_size.y
	
	particles_matrix[1][1].position.x += tile_size.x
	particles_matrix[1][1].position.y += tile_size.y
	particles_matrix[1][1].grid_offset.x = tile_size.x
	particles_matrix[1][1].grid_offset.y = tile_size.y

	for y in range(0,2):
		for x in range(0,2):
			add_child(particles_matrix[y][x])
	
	
func _realign_particles_grid():
	_realign_paricles_node(particles_matrix[0][0])
	#_realign_paricles_node(particles_matrix[1][0])


func _realign_paricles_node(node):
	var camera = get_viewport().get_camera_2d()
	var camera_position = camera.get_screen_center_position()

	var old_position = node.position
	node.position.x = _realign_paricles_node_on_axis(
		camera_position.x, 
		tile_size.x,
		node.grid_offset.x,
	)
	node.position.y = _realign_paricles_node_on_axis(
		camera_position.y, 
		tile_size.y,
		node.grid_offset.y,
	)
	if old_position != node.position:
		node.speed_scale = 64
		print("starting")
		var timer = $RebuildTimer
		timer.stop()
		timer.wait_time = 1
		timer.timeout.disconnect(_on_rebuild_timer_timeout)
		timer.timeout.connect(_on_rebuild_timer_timeout.bind(node))
		timer.start()
		#node.speed_scale = 1


func _realign_paricles_node_on_axis(camera_position, tile_len, grid_offset):
	var snap_offset = tile_len
	return floor(camera_position/snap_offset) * snap_offset
