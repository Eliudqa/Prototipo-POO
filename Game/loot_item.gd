extends Area2D


var picked_up := false

func _ready():
	set_process_input(false)

func _on_body_entered(body):
	if body.name == "Player":
		set_process_input(true)

func _on_body_exited(body):
	if body.name == "Player":
		set_process_input(false)

func _input(event):
	if event.is_action_pressed("interact") and not picked_up:
		picked_up = true
		print("Se ha recogido 1 objeto")
		queue_free()
