@tool
extends GPUParticles2D

@export_subgroup("debugging")
@export var visibility_rect_color: Color = Color(1, 0, 0, 0.2)

@export_subgroup("seed")
@export var offset: Vector2 = Vector2.ZERO
@export var sizing: Vector2 = Vector2(2048,2176)

func _ready():
	_setup()

func _draw():
	if visibility_rect_color and OS.is_debug_build():
		draw_rect(visibility_rect, visibility_rect_color)

func _setup():
	process_material.emission_shape_offset.x = sizing.x / 2
	process_material.emission_shape_offset.y = sizing.y / 2
	process_material.emission_shape = 3
	process_material.emission_box_extents.x = sizing.x / 2
	process_material.emission_box_extents.y = sizing.y / 2
	
	visibility_rect = Rect2(
		Vector2(0,0), 
		Vector2(sizing.x,sizing.y)
	)
	
