extends TextureRect

# Enum for piano keys
enum Key_Identifier { C = 0, D = 1, E = 2, F = 3, G = 4, A = 5, B = 6, C5 = 7 }

export(Key_Identifier) var key
var key_value

# Sprites for normal and pressed states (INSERT YOUR SPRITES HERE)
export(Texture) var normal_sprite  # Assign your default key sprite
export(Texture) var pressed_sprite  # Assign your pressed key sprite

var player
var is_pressed = false

func _ready():
    key_value = Key_Identifier.keys()[key]
    texture = normal_sprite  # Set the default texture

func _process(delta):
    if player and player.playing:
        player.pitch_scale = float(AudioManager.pitch)
        if AudioManager.volume == 0:
            player.volume_db = -80
        else:
            player.volume_db = (((AudioManager.volume - 0) * (5 - (-20))) / (100 - 0)) + (-20)

func _play_music():
    if is_pressed:
        return  # Prevent duplicate plays
    
    is_pressed = true
    texture = pressed_sprite  # Change to pressed key sprite
    print("Texture changed to pressed:", texture == pressed_sprite)

    
    player = AudioStreamPlayer.new()
    add_child(player)
    
    player.stream = AudioManager.piano_dictionary[key_value]  # Assign correct sound
    player.volume_db = AudioManager.volume
    player.pitch_scale = AudioManager.pitch
    player.play()
    
    if AudioManager.is_recording:
        AudioManager.ref_scroll_item_container._spawn("Piano", key_value, AudioManager.elapsed_mili, 0.1)

func _stop_music():
    if not is_pressed:
        return  # Prevent redundant stopping
    
    is_pressed = false
    texture = normal_sprite  # Revert to normal sprite
    
    if player:
        player.stop()
        player.queue_free()
        player = null