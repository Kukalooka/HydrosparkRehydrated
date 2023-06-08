extends Node2D

var enemy
@export var Enemy: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	enemy = load("res://enemy.tscn")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass




func _on_timer_timeout():
	var inst = Enemy.instantiate()
	owner.add_child(inst)
	
	pass # Replace with function body.
