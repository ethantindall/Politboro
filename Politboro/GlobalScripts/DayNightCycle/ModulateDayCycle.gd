extends CanvasModulate

const MINUTES_PER_DAY = 1440
const MINUTES_PER_HOUR = 60
const INGAME_TO_REAL_MINUTE_DURATION = (2 * PI) / MINUTES_PER_DAY


signal time_tick #(day:int, hour:int, minute:int)

@export var next_scene_path = "" # (String, FILE)
@export var gradient_texture: GradientTexture2D
@export var INGAME_SPEED: int = 20.0
@export var INITIAL_HOUR: int = 10

#	set(h):
#		INITIAL_HOUR = h
#		time = INGAME_TO_REAL_MINUTE_DURATION * MINUTES_PER_HOUR * INITIAL_HOUR


var time:float= 0.0
var past_minute:int= -1


func _ready() -> void:
	#time = INGAME_TO_REAL_MINUTE_DURATION * MINUTES_PER_HOUR * INITIAL_HOUR
	time = GlobalScript.ingameTime

func _process(delta: float) -> void:
	if GlobalScript.sceneChangeTriggered == true:
		GlobalScript.ingameTime = time
		GlobalScript.sceneChangeTriggered = false
	if GlobalScript.game_running:
		time += delta * INGAME_TO_REAL_MINUTE_DURATION * INGAME_SPEED

		var value = (sin(time - PI / 2.0) + 1.0) / 2.0
		self.color = gradient_texture.gradient.sample(value)
		
		_recalculate_time()	

		
func _recalculate_time() -> void:
	var total_minutes = int(time / INGAME_TO_REAL_MINUTE_DURATION)
	
	var day = int(total_minutes / MINUTES_PER_DAY)

	var current_day_minutes = total_minutes % MINUTES_PER_DAY

	var hour = int(current_day_minutes / MINUTES_PER_HOUR)
	var minute = int(current_day_minutes % MINUTES_PER_HOUR)
	
	if past_minute != minute:
		past_minute = minute
		time_tick.emit(day, hour, minute)