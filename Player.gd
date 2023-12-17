extends Node3D

var locations = Vector3()

var packed_scene = [
	load("res://rigid_body_3d.tscn"),
]

# Called when the node enters the scene tree for the first time.
func _ready():
	print(packed_scene)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	randomize()
	var x = randi() % packed_scene.size()
	locations.x = randf_range(-15,15)
	locations.z = randf_range(-15, 15)
	locations.y = randf_range(5,-5)
	var scene = packed_scene[x]
	var scene_instance = scene.instance()
	scene_instance.set_translation(locations)
	self.add_child(scene_instance)
