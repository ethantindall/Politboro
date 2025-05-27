extends Node2D

@onready var canvas_modulate = $CanvasModulate
var tween: Tween = null

#func _ready():
#	Clock.time_changed.connect(_on_time_changed)
#	_on_time_changed(Clock.hours, Clock.minutes)  # set initial color on load


# CHANGE BASED ON HOUR
func _on_time_changed(hour: int, minute: int):
	var target_color: Color

	match hour:
		6:
			target_color = Color(.8, 0.5, 0.7)  # sunrise pink
		7:
			target_color = Color(1, 1, 1)  # full daylight
		19:
			target_color = Color(0.8, 0.5, 0.7)  # sunset pink
		20:
			target_color = Color(0.1, 0.1, 0.2)  # night
		_:
			if hour < 6 or hour > 20:
				target_color = Color(0.1, 0.1, 0.2)  # night
			else:
				target_color = Color(1, 1, 1)  # day

	# Smooth transition
	if tween:
		tween.kill()
	tween = create_tween()
	tween.tween_property(canvas_modulate, "color", target_color, 3.0)  # transition over 3 seconds
