extends Node3D

var locations = Vector3()
var packed_scene = preload("res://rigid_body_3d.tscn")
var spawn_timer = 0.0  # Initialize a timer for spawning
var spawn_interval = 1.0  # Set the initial spawn interval to 3 seconds

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	spawn_timer += delta  # Increment the timer

	# Check if it's time to spawn
	if spawn_timer >= spawn_interval:
		spawn_object()  # Call the function to spawn an object
		spawn_timer = 0.0  # Reset the timer

# Function to spawn an object
func spawn_object():
	randomize()
	locations.x = randf_range(-5, 5)
	locations.z = randf_range(-0, 1)
	locations.y = randf_range(1, -1)

	var instance = packed_scene.instantiate()
	instance.set_position(locations)
	add_child(instance)
