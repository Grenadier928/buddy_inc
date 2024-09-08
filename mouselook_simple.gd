extends Camera3D
@export var sensitivity: float = 0.2
@export var invert_y: bool = false

# Limits for vertical rotation (in degrees)
@export var min_vertical_angle: float = -90.0
@export var max_vertical_angle: float = 90.0

var rotation_x: float = 0.0
var rotation_y: float = 0.0

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		_process_mouse_movement(event.relative)
func _process(delta):
	#self.transform.basis.y += Vector3(0, 100, 0);
	self.rotate_y(1)
func _process_mouse_movement(relative_motion: Vector2) -> void:
	# Apply sensitivity and calculate rotation deltas
	rotation_x -= relative_motion.y * sensitivity #* (if invert_y else -1)
	rotation_y -= relative_motion.x * sensitivity

	# Clamp the vertical (x-axis) rotation to prevent flipping
	rotation_x = clamp(rotation_x, deg_to_rad(min_vertical_angle), deg_to_rad(max_vertical_angle))

	# Apply rotation to the camera (y-axis rotation)
	#rotation_degrees.x = rad_to_deg(rotation_x)
	#rotate_x(1)
	self.transform.basis.y += Vector3(0, 100, 0);
	# Apply rotation to the parent node (x-axis rotation)
	#if get_parent():
	#	get_parent().rotate_y(deg_to_rad(rotation_y))

#func _input(event: InputEvent) -> void:
	#if event is InputEventKey and event.pressed and event.keycode == Key.ESCAPE:
	#	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
