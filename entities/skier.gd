extends CharacterBody2D

const SPEED = 5
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


	$Sprite2D.rotation = lerp($Sprite2D.rotation, (velocity.angle()) - (PI / 2), 0.5)

	if steering == 0:
		velocity.y += SPEED
	else:
		velocity.y += (SPEED / 2)
		
	
	if position.y > 600:
		reset()
		
	move_and_slide()

func reset():
		position = Vector2(randf_range(-700, 700), -500)
	
