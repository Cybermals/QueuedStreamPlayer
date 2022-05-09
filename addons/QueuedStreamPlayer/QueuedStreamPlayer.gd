extends Node

export (bool) var loop = false
export (float) var volume = 1.0 setget set_volume
var queue = []
var stream_player = StreamPlayer.new()


func _ready():
	#Create stream player, set initial volume, and enable event processing
	stream_player.set_name("StreamPlayer")
	add_child(stream_player)
	set_process(true)
	
	
func _process(delta):
	#Check if there is music playing
	if (stream_player.is_playing() or
	    queue.size() == 0):
		return
		
	#Retrieve next song from the queue and start it
	var song = queue.front()
	queue.pop_front()
	#print("Starting song " + str(song) + "...")
	stream_player.set_stream(song)
	stream_player.play()
	
	#Add song back to end of queue if looping is on
	if loop:
		queue.push_back(song)
		
		
func queue_song(song):
	#Add song to back of queue
	queue.push_back(song)
	
	
func clear_queue():
	#Clear the song queue and stop the current song
	queue.clear()
	stream_player.stop()
	
	
func set_loop(do_loop):
	#Set new looping state
	loop = do_loop
	
	
func set_volume(volume):
	#Set the volume of the underlying stream player
	stream_player.set_volume(volume)
