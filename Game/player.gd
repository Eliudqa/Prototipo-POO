extends CharacterBody2D

@onready var sprite_animation: AnimatedSprite2D = $AnimatedSprite2D



func _ready():
	sprite_animation.play("Spawn")
	energy_bar.value = energy


# Velocidad del personaje en píxeles por segundo
var speed = 200
#Declaracion de la energia. Esta rodado por conveniencia para que se vea bien la barra
var energy := 107.0  
var max_energy := 107.0 


@onready var energy_bar: TextureProgressBar =$"/root/Escena de Aparicion/HUD/Stamina"

func _input(event):
	if event.is_action_pressed("shoot") and energy > 0:
		shoot_ray()
		energy -= 1
		update_energy_bar()


func update_energy_bar():
	if energy_bar:
		energy_bar.value = energy

func shoot_ray():
	# Aquí instancia el rayo o lanza el ataque
	print("¡Rayo disparado!")




func _physics_process(delta):
	
	var direction = Vector2.ZERO
	
  
	
	if Input.is_action_pressed("ui_right"):
		direction.x += 1		
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1
	if Input.is_action_pressed("ui_down"):
		direction.y += 1
	if Input.is_action_pressed("ui_up"):
		direction.y -= 1
  
	# Animación y velocidad
	if direction != Vector2.ZERO:
		sprite_animation.play("Run")
	else:
		sprite_animation.play("Idle")  

	# Normalizar el vector para que no se mueva más rápido en diagonal
	if direction != Vector2.ZERO:
		direction = direction.normalized()

	# Aplicar movimiento
	velocity = direction * speed
	move_and_slide()
