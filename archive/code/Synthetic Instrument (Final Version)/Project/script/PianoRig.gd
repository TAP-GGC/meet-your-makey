extends Node2D

enum Key_Identifier { C = 0, D = 1, E = 2, F = 3, G = 4, A = 5, B = 6, C5 = 7 }

export(Key_Identifier) var key

onready var default_sprite = $DefaultSprite
onready var pressed_sprite = $PressedSprite

var key_value = Key_Identifier.keys()[key]
var player
var is_pressed = false

# Record Variable
var played_start_time
var played_start
var played_ended

func _ready():
    pressed_sprite.visible = false  # Start with the pressed sprite hidden

func _play_music():
    is_pressed = true
    default_sprite.visible = false
    pressed_sprite.visible = true

    player = AudioStreamPlayer.new()
    add_child(player)
    
    match key:
        0:
            player.stream = AudioManager.piano_dictionary["C"]
        1:
            player.stream = AudioManager.piano_dictionary["D"]
        2:
            player.stream = AudioManager.piano_dictionary["E"]
        3:
            player.stream = AudioManager.piano_dictionary["F"]
        4:
            player.stream = AudioManager.piano_dictionary["G"]
        5:
            player.stream = AudioManager.piano_dictionary["A"]
        6:
            player.stream = AudioManager.piano_dictionary["B"]
        7:
            player.stream = AudioManager.piano_dictionary["C5"]
    
    player.volume_db = ((24 - (-60)) * (AudioManager.volume / 100)) + (-40)
    player.pitch_scale = AudioManager.pitch
    player.play()
    played_start_time = AudioManager.elapsed_mili
    played_start = OS.get_ticks_msec()

func _stop_music():
    if AudioManager.is_recording:
        played_ended = OS.get_ticks_msec()
        AudioManager.ref_scroll_item_container._spawn("Piano", key_value, played_start_time, (played_ended - played_start) * .001)
    
    is_pressed = false
    default_sprite.visible = true
    pressed_sprite.visible = false

    player.stop()
    player = null
    for i in range(get_child_count()):
        get_child(i).queue_free()