extends Camera2D

# Define zoom limits and the speed of zoom
var zoom_speed = 0.1
# HOW FAR OUT YOU CAN GET. THE LOWER THE NUMBER, THE MORE YOU CAN SEE
var min_zoom = 2
# HOW CLOSE YOU CAN GET. THE HIGHER THE NUMBER THE CLOSER YOU GET
var max_zoom = 8
var initial_zoom = 3

func _ready():
	# Set initial zoom if needed
	self.zoom = Vector2(initial_zoom, initial_zoom)

func _input(event):
	if event is InputEventMouseButton:
		# ZOOM IN
		if event.button_index == MOUSE_BUTTON_WHEEL_UP and event.pressed and initial_zoom <max_zoom:
			initial_zoom +=1
			self.zoom = Vector2(initial_zoom, initial_zoom)
		# ZOOM OUT
		if event.button_index == MOUSE_BUTTON_WHEEL_DOWN and event.pressed and initial_zoom > min_zoom:
			initial_zoom -=1
			self.zoom = Vector2(initial_zoom, initial_zoom)
