extends GPUParticles2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _draw() -> void:
	draw_rect(visibility_rect, Color(1, 0, 0, 0.2))
