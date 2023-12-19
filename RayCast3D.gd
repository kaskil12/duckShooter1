extends RayCast3D



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

var Score = 0
@onready var label = $"../../../Control/Label"

#audio
@onready var ShootSound = $"../../AudioStreamPlayer3D"
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	label.text = "Score: " + str(Score)
	if Input.is_action_just_pressed("shoot"):
		ShootSound.play()
		if is_colliding():
			var collider = get_collider()
			if collider:
				Score += 1
				collider.queue_free()
			else:
				print("didnt hit")
		else:
			print("didnt hit")
