extends Node2D

@onready var canvas_modulate = $CanvasModulate
var tween: Tween = null

func _ready():
	Clock.time_changed.connect(_on_time_changed)
	_on_time_changed(Clock.hours, Clock.minutes)  # set initial color on load


var last_color: Color = Color(1, 1, 1)  # store last applied color

func _on_time_changed(hour: int, minute: int):
	var target_color: Color

	match hour:
		6:
			target_color = Color(.8, 0.5, 0.7)
		7:
			target_color = Color(1, 1, 1)
		19:
			target_color = Color(0.8, 0.5, 0.7)
		20:
			target_color = Color(0.1, 0.1, 0.2)
		_:
			if hour < 6 or hour > 20:
				target_color = Color(0.1, 0.1, 0.2)
			else:
				target_color = Color(1, 1, 1)

	# Only tween if color actually changed
	if target_color != last_color:
		if tween:
			tween.kill()
		tween = create_tween()
		tween.tween_property(canvas_modulate, "color", target_color, 3.0)
		last_color = target_color
