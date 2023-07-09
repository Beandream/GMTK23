extends CharacterBody2D

const SPEED = 5
const DRAG = 0.02

var steering = 0

var timerCount = 0
var timerCountSet = 1

var attackCoolDown = 0
const ATTACK_COOLDOWN_DURATION = 1

const ATTACK_DAMAGE_AMOUNT = 5

func _physics_process(delta):
	velocity.x += -DRAG * velocity.x
	velocity.y += -DRAG * velocity.y
	
	
	timerCount += delta
	if timerCount > timerCountSet:
		timerCountSet = randf_range(0.3, 1)
		timerCount = 0
		steering = randi_range(-1, 1)
	
	attack_yeti()
	
	if attackCoolDown < ATTACK_COOLDOWN_DURATION:
		attackCoolDown += delta

	
	velocity.x += steering * SPEED


	$Sprite2D.rotation = lerp($Sprite2D.rotation, (velocity.angle()) - (PI / 2), 0.5)

	if steering == 0:
		velocity.y += SPEED
	else:
		velocity.y += (SPEED / 2)
		
	
	
	if position.y > 600:
		reset()
		
	move_and_slide()

func attack_yeti():
	for body in $Vision.get_overlapping_bodies():
		if body.is_in_group("yeti"):
			if body.position.x > position.x:
				steering = 1
			else:
				steering = -1

func reset():
		position = Vector2(randf_range(-700, 700), -500)
	


func _on_attack_radius_body_entered(body):
	if body.is_in_group("yeti"):
		if attackCoolDown >= ATTACK_COOLDOWN_DURATION:
			attackCoolDown = 0
			Globals.change_health(-ATTACK_DAMAGE_AMOUNT)
			body.get_node("Camera2D").screen_shake(randf_range(50, 100), 0.2)
			body.hurt()
