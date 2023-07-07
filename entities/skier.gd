extends CharacterBody2D

const SPEED = 10
const DRAG = 0.02

var steering = 0

var timerCount = 0
var timerCountSet = 1

func _physics_process(delta):
	velocity.x += -DRAG * velocity.x
	velocity.y += -DRAG * velocity.y
	
	
	timerCount += delta
	if timerCount > timerCountSet:
		timerCountSet = randf_range(0.3, 1)
		timerCount = 0
		steering = randi_range(-1, 1)
	
	velocity.x += steering * SPEED

	$Sprite2D.rotation = -steering * 45

	if steering == 0:
		velocity.y += SPEED
	else:
		velocity.y += (SPEED / 2)
		
	
	if position.y > 3000:
		position = Vector2(600, -2000)
	
	move_and_slide()
