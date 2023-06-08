extends Node2D

var player

var hp
var dmg

# Called when the node enters the scene tree for the first time.
func _ready():
	hp = 100
	dmg = 10
	player = $"../Player"
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
		var dir_x = player.position.x - position.x
		var dir_y = player.position.y - position.y
		
		var angle = atan2(dir_y, dir_x)
		
		var dir = Vector2(cos(angle), sin(angle))
		#if(is_nan(dir.x)): dir.x = 0
		#if(is_nan(dir.y)): dir.y = 0
		print(dir)
		position += dir
		
	
	pass

func takeDmg(dmg):
	hp -= dmg
	if(hp <= 0):
		free()
	pass
