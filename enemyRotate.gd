extends CharacterBody2D
var player

var hp
var dmg
@export var speed: int

var rotate
var distance
var d
var maxDistance
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
	
	
	rotate = 0
	distance = 0
	maxDistance = 1
	overall_speed = 2
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	distance += 0.001
	if distance >= maxDistance * 2:
		distance -= maxDistance * 2
	if distance > maxDistance:
		d = distance
	else:
		d = maxDistance - distance
	#takeDmg(1)
	rotate += 0.01 * overall_speed
	var destination = player.position + Vector2(cos(rotate), sin(rotate)) * 450 * d
	
	var angle = atan2(destination.y - position.y, destination.x - position.x)
	var dir = Vector2(cos(angle), sin(angle))
	
	velocity = dir * speed * 2 * overall_speed
	#position += dir
	move_and_slide()
	
	
	pass

func takeDmg(dmg):
	hp -= dmg
	if(hp <= 0):
		queue_free()
	pass
