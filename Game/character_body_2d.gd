class_name Enemy extends CharacterBody2D

func _ready():
	randomize()

var speed = 100
var direction = Vector2.ZERO
var change_direction_time = 1.0  # segundos
var timer = 0.0

func _physics_process(delta):
	timer -= delta
	if timer <= 0:
		direction = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized()
		timer = change_direction_time

	velocity = direction * speed
	move_and_slide()
