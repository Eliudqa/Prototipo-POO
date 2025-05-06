extends Node2D
class_name LooteableScene
# Lista de nodos basura hijos, cada uno representa un tipo distinto de basura
@onready var loot_items := get_children()

func _ready():
    randomize()

    # Oculta todos los tipos de basura primero
    for loot_item in loot_items:
        loot_item.visible = false
        loot_item.set_deferred("monitoring", false)
        
        # Desactiva la colisión del CollisionPolygon2D si existe
        if loot_item.has_node("StaticBody2D/CollisionPolygon2D"):
         var collider = loot_item.get_node("StaticBody2D/CollisionPolygon2D")
         collider.set_deferred("disabled", true)


    var random_loot = loot_items[randi() % loot_items.size()]
    random_loot.visible = true
    random_loot.set_deferred("monitoring", true)

    if random_loot.has_node("StaticBody2D/CollisionPolygon2D"):
     var collider = random_loot.get_node("StaticBody2D/CollisionPolygon2D")
     collider.set_deferred("disabled", false)
