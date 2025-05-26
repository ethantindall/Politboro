extends Node

var hours := 4   # Starting time (e.g., 6:00 AM)
var minutes := 0

const SECONDS_PER_INGAME_MINUTE := 1
var _accumulator := 0.0

signal time_changed(hour, minute)

func _process(delta):
	_accumulator += delta
	if _accumulator >= SECONDS_PER_INGAME_MINUTE:
		_accumulator -= SECONDS_PER_INGAME_MINUTE
		advance_minute()
		print(str(hours) + ":" + str(minutes))
		
func advance_minute():
	minutes += 5
	if minutes >= 60:
		minutes = 0
		hours += 1
		if hours >= 24:
			hours = 0
	emit_signal("time_changed", hours, minutes)
