extends RayCast3D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("shoot"):
		if is_colliding():
			var collider = get_collider()
			if collider:
				collider.queue_free()
			else:
				print("didnt hit")
		else:
			print("didnt hit")
