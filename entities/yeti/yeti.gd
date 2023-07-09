extends CharacterBody2D


const SPEED = 300.0

func _physics_process(delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	if direction:
		velocity = direction * SPEED
	else:
		velocity = lerp(velocity, Vector2(0, 0), 0.2)

	if Input.is_action_just_pressed("attack"):
		do_attack()

	move_and_slide()

func do_attack():
	for body in $AttackRadius.get_overlapping_bodies():
		if body.is_in_group("Skiers"):
			body.reset()
