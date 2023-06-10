extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	pass
	
func _physics_process(delta):
	for i in get_overlapping_bodies():
		#print(get_slide_collision(i).get_collider().get_instance_id())
		match i.get_meta("type"):
			"player":
				Data.score += 5
				i.heal(2.5)
				get_parent().queue_free()
