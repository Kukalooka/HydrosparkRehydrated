extends CharacterBody2D
var player

var hp
var dmg
var dir
@export var speed: int

# Called when the node enters the scene tree for the first time.
func _ready():
	hp = 100
	dmg = 10
	player = $"../Player"
	self.set_meta("type", "enemy")
	var size = get_viewport().size
	match randi_range(0, 3):
		0:
			position = Vector2(player.position.x - size.x/2,player.position.y + randi_range(-size.y/2,size.y/2))
		1:
			position = Vector2(player.position.x + size.x/2,player.position.y + randi_range(-size.y/2,size.y/2))
		2:
			position = Vector2(player.position.x + randi_range(-size.x/2,size.x/2),player.position.y - size.y/2)
		3:
			position = Vector2(player.position.x + randi_range(-size.x/2,size.x/2),player.position.y + size.y/2)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#takeDmg(1)
	if(player != null):
		
		
		dir = Vector2(player.position.x - position.x, player.position.y - position.y).normalized()
		#if(is_nan(dir.x)): dir.x = 0
		#if(is_nan(dir.y)): dir.y = 0
		
		velocity = dir * speed
		#position += dir
		move_and_slide()
		
		$Sprite2D.look_at(player.position)
	pass
	
func _physics_process(delta):
	for i in get_slide_collision_count():
		#print(get_slide_collision(i).get_collider().get_instance_id())
		match get_slide_collision(i).get_collider().get_meta("type"):
			"projectile":
				$Sprite2D/impact.play()
				get_slide_collision(i).get_collider().queue_free()
				queue_free()
			"player":
				$"../Player".takeDmg(1, dir)
				queue_free()

func takeDmg(dmg):
	hp -= dmg
	if(hp <= 0):
		free()
	pass
