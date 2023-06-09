extends CharacterBody2D

@export var speed = 400
var damage_boost = false
const bulletPath = preload("res://ball.tscn")

func _ready():
	self.set_meta("type", "player")
	pass

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed

func _physics_process(delta):
	if Input.is_action_just_pressed('shot'):
		$Top/shoot.play()
		$Top.play("shoot")
	get_input()
	move_and_slide()
	

func shot():
	var bullet = bulletPath.instantiate()
	get_parent().add_child(bullet)
	bullet.position = $Node2D/crosshair.global_position
	bullet.rotation = $Node2D.global_rotation	
	

func _on_top_animation_finished():
	if $Top.animation == "shoot":
		shot()
		$Top.play("default")
	pass # Replace with function body.

func takeDmg(dmg):
	if !damage_boost:
		$Timer.wait_time = 1 # wait_time in seconds
		$Timer.start()
		damage_boost = true
		Data.hp -= dmg
		if Data.hp <= 0:
			get_tree().change_scene_to_file("res://menuscene.tscn")
	pass

func _on_timer_timeout():
	$Timer.stop()
	damage_boost = false
	pass # Replace with function body.
