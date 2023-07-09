extends Control

func _process(delta):
	$HBoxContainer/ScoreText.text = str(Globals.score)
	$HBoxContainer/HealthText.text = str(Globals.health)
	
