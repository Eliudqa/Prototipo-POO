extends CharacterBody2D
class_name Player

@onready var sprite_animation: AnimatedSprite2D = $AnimatedSprite2D

var movement_timer := 0.0  # Acumula el tiempo que lleva moviéndose
var energy_drain_interval := 45.0  # Tiempo necesario en movimiento para perder energía
# Señal que se emitirá al cambiar la energía (agrégala al inicio del script)
signal energy_changed(new_energy : float)  # Nuevo parámetro: valor actualizado

var energy := 81.0:
    set(value):
        energy = clamp(value, 0, max_energy)
        emit_signal("energy_changed", energy)  # Notifica a los observadores

func _ready():
    sprite_animation.play("Spawn")

    
# Velocidad del personaje en píxeles por segundo
var speed = 200
var facing_direction := "right"  # Por defecto mirando a la derecha
#Declaracion de la energia
var max_energy := 81.0 


func _input(event):
    if event.is_action_pressed("shoot") and energy > 0:
        shoot_ray()
        #Valor reescalado que significa 1 unidad en escala del 0-100. Se usa asi para
        # mejor comprension de la energia, manejandolo de 1 en 1 en la escala del 1 al 100
        energy -= 0.636


func shoot_ray():
    # Aquí instancia el rayo o lanza el ataque
    print("¡Rayo disparado!")

func take_damage(amount):
    energy -= amount
    if energy < 0:
        energy = 0
    # Aquí puedes mostrar la animación de daño


func _physics_process(delta):
    
    var direction = Vector2.ZERO  
  
     # Movimiento y dirección
    if Input.is_action_pressed("ui_right"):
        direction.x += 1
        sprite_animation.play("Run_Right")
        facing_direction = "right"
    elif Input.is_action_pressed("ui_left"):
        direction.x -= 1
        sprite_animation.play("Run_Left")
        facing_direction = "left"
    elif Input.is_action_pressed("ui_down"):
        sprite_animation.play("Run_Down")
        facing_direction = "down"
        direction.y += 1
    elif Input.is_action_pressed("ui_up"):
        sprite_animation.play("Run_Up")
        facing_direction = "up"
        direction.y -= 1


       
    else:
     # Está quieto, reproducir Idle correspondiente
     if facing_direction == "left" or facing_direction == "right":
        sprite_animation.play("Idle_" + facing_direction)
     else:
        sprite_animation.play("Idle_right")

    # Normalizar el vector para que no se mueva más rápido en diagonal
    if direction != Vector2.ZERO:
        direction = direction.normalized()
        
    if direction != Vector2.ZERO:
        direction = direction.normalized()
        movement_timer += delta  # Acumula el tiempo solo cuando se mueve

        if movement_timer >= energy_drain_interval:
            if energy > 0:
                energy -= 0.636
            movement_timer = 0.0  # Reinicia el temporizador


    # Aplicar movimiento
    velocity = direction * speed
    move_and_slide()
