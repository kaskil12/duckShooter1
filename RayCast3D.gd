extends RayCast3D



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

var Score = 0
@onready var Textedits = $"../../../Control/TextEdit"
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	Textedits.text = str(Score)
	if Input.is_action_just_pressed("shoot"):
		if is_colliding():
			var collider = get_collider()
			if collider:
				Score += 1
				collider.queue_free()
			else:
				print("didnt hit")
		else:
			print("didnt hit")
