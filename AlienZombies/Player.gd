extends KinematicBody2D

const SPEED = 100 

var velocity = Vector2()


func _physics_process(delta):
	#Движения вправо и налево
	if Input.is_action_pressed("ui_right"): 
		velocity.x = SPEED
		$Sprite.flip_h = false
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -SPEED 
		$Sprite.flip_h = true
	#обнулили скорость когда клавиша не нажата 
	else: 
		velocity.x = 0
		
	
	move_and_slide(velocity)