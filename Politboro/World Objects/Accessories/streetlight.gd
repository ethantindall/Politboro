extends StaticBody2D

@onready var light = $PointLight2D
var flicker_timer := 0.0
var flicker_interval := randf_range(25.0, 35.0) # Flicker every 25–35 seconds

#func _ready() -> void:
#	Clock.time_changed.connect(_on_time_changed)
#	_on_time_changed(Clock.hours, Clock.minutes)  # set initial color on load

func _process(delta):
	if not light.visible:
		return
	flicker_timer += delta
	if flicker_timer >= flicker_interval:
		flicker_timer = 0
		flicker_interval = randf_range(25.0, 35.0)
		_start_flicker()

func _start_flicker():
	if not is_inside_tree():
		return
	print("flicker flicker")
	var flicker_count = randi() % 3 + 2  # Flicker 2–4 times
	for i in flicker_count:
		if not is_instance_valid(light):  # Safety check
			break
		await get_tree().create_timer(randf_range(0.05, 0.2)).timeout
		light.visible = false
		await get_tree().create_timer(randf_range(0.05, 0.2)).timeout
		light.visible = true

		
func _on_time_changed(hour: int, _minute: int) -> void:
	var is_night := hour < 7 or hour >= 20
	if light.visible != is_night:
		print("updating streetlight")
		light.visible = is_night
		light.enabled = is_night
		$ShadowSprite/Panel.visible = not is_night
