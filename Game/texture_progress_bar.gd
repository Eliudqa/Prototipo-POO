extends TextureProgressBar

func _ready():
	var player = get_tree().get_first_node_in_group("Player")
	player.energy_changed.connect(_on_Player_energy_changed)
	value = player.energy  # ¡Esto es clave!


func _on_Player_energy_changed(new_energy: float):
	value = new_energy  # Actualiza directamente 'value' (no necesitas $Stamina si este script está en el ProgressBar)
