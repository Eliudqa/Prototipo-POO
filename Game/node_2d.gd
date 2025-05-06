extends Node2D

@export var loot_scene: PackedScene
@export var number_of_items: int = 150
@export var spawn_area: Rect2 = Rect2(Vector2(0, 0), Vector2(2000, 6000))

func _ready():
	randomize()
	for i in number_of_items:
		var loot = loot_scene.instantiate()
		var random_pos = Vector2(
			randf_range(spawn_area.position.x, spawn_area.end.x),
			randf_range(spawn_area.position.y, spawn_area.end.y)
		)
		loot.global_position = random_pos
		add_child(loot)
