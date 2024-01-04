extends CanvasLayer

func _ready():
	_handle_button_release($UpTexture)
	_handle_button_release($DownTexture)
	_handle_button_release($LeftTexture)
	_handle_button_release($RightTexture)
	
	
func _process(_delta):
	if Input.is_action_just_pressed("thrust_forward"):
		_handle_button_press($UpTexture)
	if Input.is_action_just_pressed("thrust_reverse"):
		_handle_button_press($DownTexture)
	if Input.is_action_just_pressed("rotate_left"):
		_handle_button_press($LeftTexture)
	if Input.is_action_just_pressed("rotate_right"):
		_handle_button_press($RightTexture)

	if Input.is_action_just_released("thrust_forward"):
		_handle_button_release($UpTexture)
	if Input.is_action_just_released("thrust_reverse"):
		_handle_button_release($DownTexture)
	if Input.is_action_just_released("rotate_left"):
		_handle_button_release($LeftTexture)
	if Input.is_action_just_released("rotate_right"):
		_handle_button_release($RightTexture)


func _handle_button_press(sprite):
	sprite.self_modulate.a = 0.1


func _handle_button_release(sprite):
	sprite.self_modulate.a = 0.05
