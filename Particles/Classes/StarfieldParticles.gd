class_name StarfieldParticles extends GPUParticles2D

@export_subgroup("debugging")
@export var debug_mode := false
@export var visibility_rect_color : Color

@export_subgroup("starfield")
@export var grid_offset := Vector2.ZERO
@export var timer := Timer.new()
@export var index := 0
@export var x_index := 0
@export var y_index := 0


func _draw():
	if debug_mode and visibility_rect_color and OS.is_debug_build():
		draw_rect(visibility_rect, visibility_rect_color)
