extends Node3D

var locations = Vector3()

var packed_scene = preload("res://rigid_body_3d.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	print(packed_scene)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	randomize()
	locations.x = randf_range(-15,15)
	locations.z = randf_range(-15, 15)
	locations.y = randf_range(5,-5)
	var instance = packed_scene.instantiate()
	instance.set_position(locations)
	add_child(instance)
	

	
	
	
