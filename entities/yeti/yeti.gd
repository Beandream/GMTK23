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
	$Sprite2D.scale = lerp($Sprite2D.scale, Vector2(1, 1), 0.3)

	move_and_slide()

func hurt():
	$HurtParticles.restart()
	$HurtParticles.emitting = true
	

func do_attack():
	$Sprite2D.scale = Vector2(1.4, 1.4)
	velocity *= 5
	for body in $AttackRadius.get_overlapping_bodies():
		if body.is_in_group("Skiers"):
			body.reset()
			$GPUParticles2D.restart()
			$GPUParticles2D.emitting = true
			$Camera2D.screen_shake(randf_range(50, 60), 0.2)
			Globals.change_score(1)
