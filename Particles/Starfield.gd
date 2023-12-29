extends GPUParticles2D

var camera: Camera2D

func _ready():
	camera = get_viewport().get_camera_2d()


func _process(_delta):
	camera = get_viewport().get_camera_2d()

	var camera_position = camera.get_screen_center_position()
	#print("Camera" + str(camera.get_screen_center_position()), )
	#print("position" + str(position), )
	if camera_position.x < 0:
		position.x = -2048
		
	if camera_position.x < -2048:
		position.x = -2048 * 2

	if camera_position.x < -2048*2:
		position.x = -2048 * 3

	if camera_position.x > 0:
		position.x = 0
	#position.x = camera.get_screen_center_position().x
	#position.y = camera.get_screen_center_position().y
