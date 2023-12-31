extends GPUParticles2D

func _draw():
	if OS.is_debug_build():
		draw_rect(visibility_rect, Color(1, 0, 0, 0.2))
