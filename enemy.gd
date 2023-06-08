extends CharacterBody2D
var player

var hp
var dmg
@export var speed: int

var overall_speed

# Called when the node enters the scene tree for the first time.
func _ready():
	hp = 100
	dmg = 10
	player = $"../Player"
	var size = get_viewport().size
	match randi_range(0, 3):
		0:
			position = Vector2(-100, randi_range(0, size.y))
		1:
			position = Vector2(size.x+100, randi_range(0, size.y))
		2:
			position = Vector2(randi_range(0, size.x), -100)
		3:
			position = Vector2(randi_range(0, size.x), size.y+100)
	
	
	overall_speed = 1
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var destination = player.position
	
	var angle = atan2(destination.y - position.y, destination.x - position.x)
	var dir = Vector2(cos(angle), sin(angle))
	
	velocity = dir * speed * 25 * overall_speed
	#position += dir
	move_and_slide()
	
	
	pass

func takeDmg(dmg):
	hp -= dmg
	if(hp <= 0):
		queue_free()
	pass
