extends Node3D

var look_dir: Vector2

@onready var camera = $Camera3D

var camera_sens = 5
var capMouse = true



# Called when the node enters the scene tree for the first time.
func _ready():
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)

# Called every frame. 'delta' is the elapsed time since the previous frame.

func _physics_process(delta):
	if Input.is_action_just_pressed("esc"):
		capMouse != capMouse
	if capMouse:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	else:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	_rotate_camera(delta)

func _input(event: InputEvent):
	if event is InputEventMouseMotion: look_dir = event.relative * 0.01
	
func _rotate_camera(delta: float, sens_mod: float = 1.0):
	var input = Input.get_vector("ui_left", "ui_right", "ui_down", "ui_up")
	look_dir += input
	camera.rotation.x = clamp(camera.rotation.x - look_dir.y * camera_sens * sens_mod * delta, -1.5, 1.5)
	camera.rotation.y -= look_dir.x * camera_sens * sens_mod * delta
	look_dir = Vector2.ZERO

