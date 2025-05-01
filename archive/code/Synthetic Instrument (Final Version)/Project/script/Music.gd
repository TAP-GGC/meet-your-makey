extends Node

var fur_elise_notes = [
    {"note": "E", "length": 0.25, "instrument": "Piano"}, {"note": "C5", "length": 0.25, "instrument": "Piano"}, 
    {"note": "E", "length": 0.25, "instrument": "Piano"}, {"note": "C5", "length": 0.25, "instrument": "Piano"}, 
    {"note": "E", "length": 0.25, "instrument": "Piano"}, {"note": "B", "length": 0.3, "instrument": "Cello"},  
    {"note": "D", "length": 0.3, "instrument": "Cello"}, {"note": "C", "length": 0.5, "instrument": "Cello"}, 
    {"note": "A", "length": 0.9, "instrument": "Cello"},  

    {"note": "C", "length": 0.3, "instrument": "Piano"}, {"note": "E", "length": 0.3, "instrument": "Piano"}, 
    {"note": "A", "length": 0.3, "instrument": "Piano"}, {"note": "B", "length": 0.3, "instrument": "Piano"}, 
    {"note": "E", "length": 0.3, "instrument": "Cello"}, {"note": "C5", "length": 0.9, "instrument": "Cello"},   

    {"note": "E", "length": 0.25, "instrument": "Piano"}, {"note": "C5", "length": 0.25, "instrument": "Piano"}, 
    {"note": "E", "length": 0.25, "instrument": "Piano"}, {"note": "C5", "length": 0.25, "instrument": "Piano"}, 
    {"note": "E", "length": 0.25, "instrument": "Piano"}, {"note": "B", "length": 0.3, "instrument": "Cello"},  
    {"note": "D", "length": 0.3, "instrument": "Cello"}, {"note": "C", "length": 0.6, "instrument": "Cello"}, 
    {"note": "A", "length": 0.9, "instrument": "Cello"}
]

func play():
    play_fur_elise()

func play_fur_elise():
    var start_time = 0
    
    for note_data in fur_elise_notes:
        var next_note_start = start_time + note_data["length"] - 0.05 
        
        AudioManager.play(note_data["instrument"], note_data["note"], start_time, note_data["length"] + 0.05)  
        
        start_time = next_note_start + 0.03






"""
var fur_elise_notes = [
    {"note": "E", "length": 0.25}, {"note": "C5", "length": 0.25}, {"note": "E", "length": 0.25},  
    {"note": "C5", "length": 0.25}, {"note": "E", "length": 0.25}, {"note": "B", "length": 0.3},  
    {"note": "D", "length": 0.3}, {"note": "C", "length": 0.5}, {"note": "A", "length": 0.9},  

    {"note": "C", "length": 0.3}, {"note": "E", "length": 0.3}, {"note": "A", "length": 0.3},  
    {"note": "B", "length": 0.3}, {"note": "E", "length": 0.3}, {"note": "C5", "length": 0.9},   

    {"note": "E", "length": 0.25}, {"note": "C5", "length": 0.25}, {"note": "E", "length": 0.25},  
    {"note": "C5", "length": 0.25}, {"note": "E", "length": 0.25}, {"note": "B", "length": 0.3},  
    {"note": "D", "length": 0.3}, {"note": "C", "length": 0.6}, {"note": "A", "length": 0.9}
]

func play():
    play_fur_elise()

func play_fur_elise():
    var start_time = 0
    
	#Note Scrubbing
    for i in range(fur_elise_notes.size()):
        var note_data = fur_elise_notes[i]
        var next_note_start = start_time + note_data["length"] - 0.05 
        
        # Controls Instrument Based on Tab - Useful for not hardcoding
        AudioManager.play(AudioManager.instrument, note_data["note"], start_time, note_data["length"] + 0.05)  
        
        start_time = next_note_start + 0.03
"""

"""
var happy_birthday_notes = [
    {"note": "C5", "length": 0.3}, {"note": "C5", "length": 0.2}, {"note": "D", "length": 0.4}, 
    {"note": "C5", "length": 0.4}, {"note": "F", "length": 0.4}, {"note": "E", "length": 0.6},  

    {"note": "C5", "length": 0.3}, {"note": "C5", "length": 0.2}, {"note": "D", "length": 0.4}, 
    {"note": "C5", "length": 0.4}, {"note": "G", "length": 0.4}, {"note": "F", "length": 0.7},  

    {"note": "C5", "length": 0.3}, {"note": "C5", "length": 0.2}, {"note": "C5", "length": 0.4}, 
    {"note": "A", "length": 0.4}, {"note": "F", "length": 0.4}, {"note": "E", "length": 0.4}, {"note": "D", "length": 0.9},  

    {"note": "B", "length": 0.3}, {"note": "B", "length": 0.2}, {"note": "A", "length": 0.4}, 
    {"note": "F", "length": 0.4}, {"note": "G", "length": 0.4}, {"note": "F", "length": 1.5}  
]

"""