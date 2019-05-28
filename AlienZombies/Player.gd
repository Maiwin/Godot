extends KinematicBody2D

const SPEED = 200 
const FLOOR = Vector2(0, -1)  #указывает где находиться земля	 
const GRAVITY = 970			  #ускорение для гравитаций 
const JUMP_POWER = 550 		  #как сильно будет прыгать персонаж 

var velocity = Vector2()


func _physics_process(delta):
	if position.y > 800:
		position.y = 0
	
	#Движения вправо и налево
	if Input.is_action_pressed("ui_right"): 
		velocity.x = SPEED
		$AnimatedSprite.flip_h = false
		if is_on_floor():
			$AnimatedSprite.play("walk")
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -SPEED 
		$AnimatedSprite.flip_h = true
		if is_on_floor():
			$AnimatedSprite.play("walk")
	#обнулили скорость когда клавиша не нажата 
	else: 
		velocity.x = 0
		if is_on_floor():
			$AnimatedSprite.play("idle")
		
	#прыжок 
	if Input.is_action_pressed("ui_up") && is_on_floor():
		velocity.y = -JUMP_POWER
		$AnimatedSprite.play("jump")
		
	velocity.y += (GRAVITY * delta)
	velocity = move_and_slide(velocity, FLOOR)