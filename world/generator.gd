extends Node2D

var TREE_SCENE = preload("res://world/tree.tscn")

var SKIER_SCENE = preload("res://entities/skier.tscn")

const TREE_COUNT = 400

const SKIER_COUNT = 20

func generate_trees():
	for i in TREE_COUNT:
		var new_tree: StaticBody2D = TREE_SCENE.instantiate()
		new_tree.position = Vector2(randf_range(-1000, 1000), randf_range(-600, 600))
		new_tree.rotation += randf_range(-0.1, 0.1)
		new_tree.get_node("Leaves").scale.x += randf_range(-0.1, 0.4)
		new_tree.get_node("Leaves").scale.y += randf_range(-0.3, 0.4) 
		
		add_child(new_tree)

func generate_skiers():
	for i in SKIER_COUNT:
		var new_skier = SKIER_SCENE.instantiate()
		new_skier.position = Vector2(randf_range(-700, 700), randf_range(-500, -700))
		add_child(new_skier)

# Called when the node enters the scene tree	 for the first time.
func _ready():
	generate_trees()
	generate_skiers()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
