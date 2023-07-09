extends Node

#signal trigger_screen_shake (intensity, duration)

var score = 0
var health = 100

func change_health(amount):
	health += amount

func change_score(amount):
	score += amount


#func shake_screen(intensity = 50, duration = 0.2):
#	emit_signal("trigger_screen_shake", intensity, duration)
	
