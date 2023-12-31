class_name StarfieldParticles extends GPUParticles2D

@export_subgroup("debugging")
@export var visibility_rect_color: Color

func _draw():
	if visibility_rect_color and OS.is_debug_build():
		draw_rect(visibility_rect, visibility_rect_color)
