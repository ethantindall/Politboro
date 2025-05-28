extends StaticBody2D

@onready var light = $PointLight2D
@onready var flicker_timer = Timer.new()

func _ready() -> void:
	# Set up flicker timer
	flicker_timer.wait_time = randf_range(25.0, 35.0)
	flicker_timer.one_shot = true
	flicker_timer.timeout.connect(_on_flicker_timeout)
	add_child(flicker_timer)
	
	Clock.time_changed.connect(_on_time_changed)
	_on_time_changed(Clock.hours, Clock.minutes)  # Set initial color on load

func _on_time_changed(hour: int, _minute: int) -> void:
	var is_night := hour < 7 or hour >= 20
	if light.visible != is_night:
		print("updating streetlight")
		light.visible = is_night
		light.enabled = is_night
		$ShadowSprite/Panel.visible = not is_night
	
	if is_night and not flicker_timer.is_stopped():
		return  # Let the current flicker timer finish
	elif is_night:
		# Start a new flicker timer
		flicker_timer.wait_time = randf_range(25.0, 35.0)
		flicker_timer.start()
	else:
		flicker_timer.stop()  # Stop flickering during the day

func _on_flicker_timeout() -> void:
	if light.visible:
		_start_flicker()
	# Schedule next flicker
	flicker_timer.wait_time = randf_range(25.0, 35.0)
	flicker_timer.start()

func _start_flicker():
	if not is_inside_tree() or not is_instance_valid(light):
		return
	print("flicker flicker")
	var flicker_count = randi() % 3 + 2  # Flicker 2–4 times
	await _run_flicker_sequence(flicker_count)

func _run_flicker_sequence(count: int) -> void:
	for i in count:
		if not is_instance_valid(light):
			break
		await get_tree().create_timer(randf_range(0.05, 0.2)).timeout
		light.visible = false
		await get_tree().create_timer(randf_range(0.05, 0.2)).timeout
		light.visible = true
