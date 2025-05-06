extends CharacterBody2D


@export var speed := 200.0
@onready var sprite_animation: AnimatedSprite2D = $AnimatedSprite2D


	

func _physics_process(delta):

	
	var direction = Vector2.ZERO  
  
	
	 # Movimiento y dirección
	if Input.is_action_pressed("ui_right"):
		direction.x += 1
		sprite_animation.play("Run_Right")
		
	elif Input.is_action_pressed("ui_left"):
		direction.x -= 1
		sprite_animation.play("Run_Left")
		
	elif Input.is_action_pressed("ui_down"):
		sprite_animation.play("Run_Down")
		direction.y += 1
	elif Input.is_action_pressed("ui_up"):
		sprite_animation.play("Run_Up")
		direction.y -= 1
	else:
		sprite_animation.play("Idle")
