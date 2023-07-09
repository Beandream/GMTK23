extends Camera2D

var time = 0
var time_duration = 0

var intensity = 0

func screen_shake(_intesity = 1, duration = 1):
	intensity = _intesity
	time_duration = duration
	time = 0

func _process(delta):
	if time_duration == 0: return
	
	time += delta
	if time > time_duration:
		time_duration = 0
	else:
		position = Vector2(randf_range(-intensity, intensity), randf_range(-intensity, intensity))
		
	position = lerp(position, Vector2(0, 0), 0.1)
