extends Node2D

var particles_list = Array()

func _ready():
	_setupParticles()


func _setupParticles():
	var process_material = ParticleProcessMaterial.new()
	var particles
	process_material.particle_flag_disable_z = true
	process_material.emission_shape = ParticleProcessMaterial.EmissionShape.EMISSION_SHAPE_BOX 
	process_material.emission_box_extents = Vector3(500, 500, 0)
	process_material.gravity = Vector3.ZERO
	process_material.scale_min = 0.01
	process_material.scale_max = 0.03
	process_material.hue_variation_max = 0.05
	
	particles = GPUParticles2D.new()
	particles.amount = 100 
	particles.lifetime = 500
	particles.preprocess = 500
	particles.texture = preload("res://addons/kenney_particle-pack/PNG (Transparent)/star_05.png")
	particles.process_material = process_material
	particles.modulate = Color(1, 1, 1, 0.95)
	particles.visibility_rect = Rect2(Vector2(-250, -250), Vector2(500, 500))

	particles_list.push_back(particles)
	
	add_child(particles_list[0])
	
	
