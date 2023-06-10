extends TextureRect


func _process(delta):
	size.x = Data.hp * 100 / 1.5
	
	get_parent().get_node("Label").text = str(Data.score)
	pass
