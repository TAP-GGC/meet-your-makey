extends HBoxContainer


export(NodePath) onready var texture_ref = get_node(texture_ref)
export(NodePath) onready var label_ref = get_node(label_ref)
export(NodePath) onready var slider_ref = get_node(slider_ref)

export(Texture) onready var volume_0
export(Texture) onready var volume_1
export(Texture) onready var volume_2
export(Texture) onready var volume_3

var volume

# Called when the node enters the scene tree for the first time.
func _ready():
	#Set Default Value
	label_ref.text = str("Volume: ", slider_ref.value)
	volume = slider_ref.value
	texture_ref.texture = volume_1
	pass

func _on_HSlider_value_changed(value):
	#Update with new value if value change
	_set_volume_icon(value)
	label_ref.text = str("Volume: ", value)
	volume = value
	pass
	
func _set_volume_icon(value):
	if(value == 0):
		texture_ref.texture = volume_0
	elif(value <= 33):
		texture_ref.texture = volume_1
	elif(value <= 66):
		texture_ref.texture = volume_2
	elif(value <= 100):
		texture_ref.texture = volume_3
