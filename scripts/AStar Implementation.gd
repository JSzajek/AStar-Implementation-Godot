extends Node

export (PackedScene) var seeker

const ray_length : int = 1000

const rotation_amount_degrees : int = 10

var pivot : Spatial
var swivel : Spatial

var target : KinematicBody

var camera : Camera

var tracking : bool = false
var path_visualize : bool = false

func _ready():
	pivot = get_node("Pivot")
	swivel = get_node("Pivot/Swivel")
	camera = swivel.get_node("Camera")
	target = get_node("Target")

func _unhandled_input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == 1:
		var vec_from : Vector3 = camera.project_ray_origin(event.position)
		var vec_to : Vector3 = camera.project_ray_normal(event.position) * ray_length
		var space_state = get_node("AStar").get_world().direct_space_state
		var result = space_state.intersect_ray(vec_from, vec_to, [], 256)
		if result:
			move_target_to_position(result.position)
	if event.is_action_pressed("ui_down"):
		rotate_camera("down")
	if event.is_action_pressed("ui_up"):
		rotate_camera("up")
	if event.is_action_pressed("ui_left"):
		rotate_camera("left")
	if event.is_action_pressed("ui_right"):
		rotate_camera("right")
			
func move_target_to_position(position : Vector3):
	target.global_transform.origin = position + Vector3(0,0.25,0) # offset from floor

func track_target(state : bool):
	tracking = state
	if tracking:
		for child in get_node("Seekers").get_children():
			if !child.tracking:
				child.start_tracking(target)
	else:
		for child in get_node("Seekers").get_children():
			child.tracking = false
			child.following_path = false

func clear_seekers():
	for child in get_node("Seekers").get_children():
		child.queue_free()

func spawn_seeker():
	var spawn_points = get_node("Spawn_Points")
	var rand_index = randi() % spawn_points.get_child_count()
	var point : Position3D = spawn_points.get_child(rand_index)
	var new_seeker = seeker.instance()
	new_seeker.setup(get_node("AStar"))
	get_node("Seekers").add_child(new_seeker)
	new_seeker.global_transform.origin = point.global_transform.origin
	if tracking:
		new_seeker.start_tracking(target)

func set_path_visualization(_visualize : bool):
	path_visualize = _visualize
	for child in get_node("Seekers").get_children():
		child.draw_path = path_visualize

func rotate_camera(direction : String):
	match(direction):
		"up":
			swivel.rotate_x(deg2rad(-rotation_amount_degrees))
		"down":
			swivel.rotate_x(deg2rad(rotation_amount_degrees))
		"right":
			pivot.rotate_y(deg2rad(rotation_amount_degrees))
		"left":
			pivot.rotate_y(deg2rad(-rotation_amount_degrees))
	swivel.rotation_degrees.x = clamp(swivel.rotation_degrees.x, -45, 30) 
