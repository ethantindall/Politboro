extends Node2D

@onready var canvas_modulate = $CanvasModulate
var tween: Tween = null

func _ready():
	Clock.time_changed.connect(_on_time_changed)
	_on_time_changed(Clock.hours, Clock.minutes)  # set initial color on load


"""
# CHANGE BASED ON MINUTE
func _on_time_changed(hour: int, minute: int):
	var color: Color

	if hour == 6:
		var t := float(minute) / 60.0
		color = Color(lerp(0.1, 1.0, t), lerp(0.1, 0.5, t), lerp(0.2, 0.7, t))
	elif hour == 7:
		color = Color(1, 1, 1)
	elif hour == 19:
		var t := float(minute) / 60.0
		color = Color(lerp(1.0, 0.1, t), lerp(0.5, 0.1, t), lerp(0.7, 0.2, t))
	elif hour == 20:
		color = Color(0.1, 0.1, 0.2)
	elif hour < 6 or hour > 20:
		color = Color(0.1, 0.1, 0.2)
	else:
		color = Color(1, 1, 1)

	if tween:
		tween.kill()
	tween = create_tween()
	tween.tween_property(canvas_modulate, "color", color, 3.0)
"""

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
