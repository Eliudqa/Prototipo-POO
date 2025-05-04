class_name Enemy extends CharacterBody2D

func _ready():
	randomize()

var speed = 60
var direction = Vector2.ZERO
var change_direction_time = 5.0  # segundos
var timer = 0.0

var player_in_area: CharacterBody2D = null
var damage_timer := 0.0
var damage_interval := 2.0  # Daño cada 1 segundo

func _physics_process(delta):
	timer -= delta
	if timer <= 0:
		direction = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized()
		timer = change_direction_time
		
		# Daño periódico si el jugador está dentro
	if player_in_area:
		damage_timer -= delta
		if damage_timer <= 0:
			player_in_area.take_damage(0.636)
			damage_timer = damage_interval  # reinicia el contador


	velocity = direction * speed
	move_and_slide()
	

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		player_in_area = body
		damage_timer = 0.0  # Aplica daño inmediato al entrar
		print(player_in_area)


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body == player_in_area:
		player_in_area = null
