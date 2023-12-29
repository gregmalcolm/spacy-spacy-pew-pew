extends GPUParticles2D

@export_subgroup("Debugging")
@export var show_visibility_rect: bool = false

func _draw():
	if show_visibility_rect and OS.is_debug_build():
		draw_rect(visibility_rect, Color(1, 0, 0, 0.2))
