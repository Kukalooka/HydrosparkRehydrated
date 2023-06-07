extends AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if get_parent().velocity.length() > 0:
		rotation = lerp(rotation,get_parent().velocity.angle(),0.1)
		
	pass
