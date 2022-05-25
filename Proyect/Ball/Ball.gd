extends RigidBody2D

export var rotation_speed:float = 0.15

var last_player_touched:Node2D = null


#Return the Distance Absolute between thsi node and vector2 b 
func get_distace(b:Vector2):
	return(_get_raw_distance(b).abs())


func _get_raw_distance(b:Vector2):
	var result:Vector2 = transform.origin - b;
	return result


#Return vector2 Normalized pointed to object
func get_direction(target):
	var result:Vector2 = _get_raw_distance(target).normalized()
	return result
	


func set_last_player_touched(node):
	last_player_touched = node


func _ready():
	pass


func _physics_process(delta):
	var speed = linear_velocity.x
	var sprite = $CollisionShape2D/Sprite
	var rotation = rotation_speed * speed * delta
	sprite.transform = sprite.transform.rotated(rotation)
	if(last_player_touched != null):
		transform.origin.y = last_player_touched.transform.origin.y



func add_force(force , node):
	if node != last_player_touched: 
		return
	linear_velocity += force