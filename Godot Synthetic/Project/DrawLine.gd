extends Node2D

export(int, -60, 60, 1) var rotation_range

func _process(delta):
	self.rotation_degrees = -rotation_range
	
	
