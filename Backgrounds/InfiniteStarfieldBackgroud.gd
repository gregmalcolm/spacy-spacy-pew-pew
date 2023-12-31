extends Node2D

@export var tile_size := Vector2(200, 200)

var particles_matrix

func _ready():
	_setupParticles()


func _emptyParticlesMatrix():
	return [[null, null], [null, null]]

func _buildParticlesNode():
	var mid_tile_size = tile_size * 0.5
	var process_material = ParticleProcessMaterial.new()
	process_material.particle_flag_disable_z = true
	process_material.emission_shape = ParticleProcessMaterial.EmissionShape.EMISSION_SHAPE_BOX 
	process_material.emission_box_extents = Vector3(tile_size.x, tile_size.y, 0)
	process_material.gravity = Vector3.ZERO
	process_material.scale_min = 0.1
	process_material.scale_max = 0.3
	process_material.hue_variation_max = 0.05
	
	var particles = GPUParticles2D.new()
	particles.amount = 100 
	particles.lifetime = 500
	particles.preprocess = 500
	particles.texture = preload("res://addons/kenney_particle-pack/PNG (Transparent)/star_05.png")
	particles.process_material = process_material
	particles.modulate = Color(1, 1, 1, 0.95)
	particles.visibility_rect = Rect2(
		mid_tile_size,
		tile_size,
	)
	particles.position = Vector2.ZERO
	particles.set_script(load("res://Backgrounds/StarfieldParticles.gd"))

	return particles


func _setupParticles():
	particles_matrix = _emptyParticlesMatrix()
	
	for y in range(0,2):
		for x in range(0,2):
			particles_matrix[y][x] = _buildParticlesNode()

	particles_matrix[0][1].position.x += 600
	particles_matrix[1][0].position.y += 600
	particles_matrix[1][1].position.x += 600
	particles_matrix[1][1].position.y += 600
			
	for y in range(0,2):
		for x in range(0,2):
			add_child(particles_matrix[y][x])
	
	
