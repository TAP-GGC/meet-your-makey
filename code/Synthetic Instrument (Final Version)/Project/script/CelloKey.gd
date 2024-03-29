extends Sprite

enum Key_Identifier { C = 0, D = 1, E = 2, F = 3, G = 4, A = 5, B = 6, C5 = 7}

export(Key_Identifier) var key
export(float, 0, 1, .01) var magnitude_incrument = .01
export(float, 0, 1, .01) var magnitude_percent = 1
var key_value = Key_Identifier.keys()[key]

var player
var is_pressed = false
var magnitude_min = 40
var magnitude_max = 220

#Record Variable
var played_start_time
var played_start
var played_ended

func _ready():
	self.position = _get_angle_position()

func _process(delta):
	if player != null:
		if player.playing == true:
			player.pitch_scale = float(AudioManager.pitch)
			if(AudioManager.volume == 0):
				player.volume_db = -80
			else:
				player.volume_db = (((AudioManager.volume - 0) * (5 - (-20))) / (100 - 0)) + (-20)
	
	#Update object position if button is pressed
	if(is_pressed):
		self.position = _get_angle_position()
	
	#Set object rotation to match parent rotation
	self.rotation = get_parent().rotation
	
	#Move key if pressed, reset if release
	if(is_pressed and magnitude_percent > 0):
		magnitude_percent -= magnitude_incrument
	elif(!is_pressed):
		magnitude_percent = 1;
		self.position = _get_angle_position()
		

#Convert input into postion in circle
func _get_angle_position():
	var center = Vector2(0,0)
	var radian = key * PI/4
	var magnitue_value = ((magnitude_max - magnitude_min) * magnitude_percent) + magnitude_min
	return Vector2(center.x+cos(radian) * magnitue_value, center.y-sin(radian) * magnitue_value)

func _play_music():
	is_pressed = true
	player = AudioStreamPlayer.new()
	self.add_child(player)
	
	match key:
		0:
			player.stream = AudioManager.cello_dictionary["C"]
		1:
			player.stream = AudioManager.cello_dictionary["D"]
		2:
			player.stream = AudioManager.cello_dictionary["E"]
		3:
			player.stream = AudioManager.cello_dictionary["F"]
		4:
			player.stream = AudioManager.cello_dictionary["G"]
		5:
			player.stream = AudioManager.cello_dictionary["A"]
		6:
			player.stream = AudioManager.cello_dictionary["B"]
		7:
			player.stream = AudioManager.cello_dictionary["C5"]
			
	player.volume_db = ((24 - (-60)) * (AudioManager.volume/100)) + (-40) 
	player.pitch_scale = AudioManager.pitch
	player.play()
	played_start_time = AudioManager.elapsed_mili
	played_start = OS.get_ticks_msec()

func _stop_music():
	if AudioManager.is_recording == true:
		played_ended  = OS.get_ticks_msec()
		AudioManager.ref_scroll_item_container._spawn("Cello", key_value, played_start_time, (played_ended - played_start) * .001)
	is_pressed = false
	player.stop()
	player = null
	for i in range(0, get_child_count()):
    	get_child(i).queue_free()