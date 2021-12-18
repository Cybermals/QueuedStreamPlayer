extends Node


func _ready():
	#Queue all the songs in the audio folder
	for i in range(17):
		print("Queuing song " + str(i) + "...")
		var song = load("res://audio/jingles_STEEL" + (str(i) if i > 9 else "0" + str(i)) + ".ogg")
		get_node("QueuedStreamPlayer").queue_song(song)
