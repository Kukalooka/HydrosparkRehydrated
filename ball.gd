extends CharacterBody2D

var direction = get_global_mouse_position().normalized()
var speed = 750

func _ready():
	self.set_meta("type", "projectile")

func _physics_process(delta):
	position += transform.x* speed * delta
	

func _on_Bullet_body_entered(body):
	if body.is_in_group("mobs"):
		body.queue_free()
	queue_free()
