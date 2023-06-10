extends StaticBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	pass
	
func _physics_process(delta):
	for i in get_slide_collision_count():
		#print(get_slide_collision(i).get_collider().get_instance_id())
		match get_slide_collision(i).get_collider().get_meta("type"):
			"player":
				$"../Player".heal(5, dir)
				queue_free()
