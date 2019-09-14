extends KinematicBody

const gravity = Vector3.DOWN * 12

const MIN_PATH_UPDATE_TIME : float = 0.2
const PATH_UPDATE_MOVE_THRESHOLD : float = 0.5
const sqr_move_threshold : float = PATH_UPDATE_MOVE_THRESHOLD * PATH_UPDATE_MOVE_THRESHOLD

var target : KinematicBody
export (float) var move_speed = 6.0
export (float) var turn_dist = 5.0
export (float) var turn_speed = 3.0
export (float) var stopping_distance = 5.0
export (bool) var draw_path = false

var path : Object

var Astar : Object
var pathIndex : int = 0
var following_path : bool = false
var speedPercent : float = 1

var path_debug : ImmediateGeometry
var point_debug : ImmediateGeometry

var path_timer : Timer

var target_pos_old : Vector3

func _ready():
	path_timer = get_node("Path_Update_Timer")
	path_debug = ImmediateGeometry.new()
	point_debug = ImmediateGeometry.new()
	
	get_parent().get_parent().add_child(path_debug)
	get_parent().get_parent().add_child(point_debug)

func _exit_tree():
	get_parent().get_parent().remove_child(path_debug)
	get_parent().get_parent().remove_child(point_debug)
	
func setup(_astar : Object):
	Astar = _astar

func start_tracking(new_target : KinematicBody):
	target = new_target
	target_pos_old = target.global_transform.origin
	update_path()

func is_tracking() -> bool:
	return !path_timer.is_stopped()

func stop_tracking():
	following_path = false
	path_timer.stop()

func path_found(packed_values : Array):
	var _path : PoolVector3Array = packed_values[0]
	var success : bool = packed_values[1]
	if success:
		var new_path = Astar.SmoothPath.new(_path, global_transform.origin, [draw_path, path_debug, point_debug], turn_dist, stopping_distance)
		if new_path != null:
			set_path(new_path)

func update_path():
	# Initial Path Request
	request_astar_path()
	
	path_timer.start(MIN_PATH_UPDATE_TIME)

func request_astar_path():
	var unique_id = target.get_instance_id() + self.get_instance_id() 
	Astar.request_path(self.get_path(), global_transform.origin, target.global_transform.origin, funcref(self, "path_found"), unique_id)

func move_along_path() -> void:
	# Path has changed during function
	if pathIndex >= path.turnBoundaries.size():
		return

	var pos2D : Vector2 = Vector2(global_transform.origin.x, global_transform.origin.z)
	while path.turnBoundaries[pathIndex].has_crossed_line(pos2D):
		if pathIndex == path.finishLineIndex:
			following_path = false
			break
		else:
			pathIndex += 1
	if following_path:
		speedPercent = 1
		if pathIndex >= path.slowDownIndex and stopping_distance > 0:
			speedPercent = clamp(path.turnBoundaries[path.finishLineIndex].distance_from_point(pos2D) / stopping_distance, 0, 1)
			if speedPercent < 0.01:
				following_path = false
		var target_trans : Transform = transform.looking_at(path.lookPoints[pathIndex], Vector3.UP)
		rotation = lerp(rotation, target_trans.basis.get_euler(), 1)
		
		# warning-ignore:return_value_discarded
		move_and_slide(Vector3(0,0,-1 * move_speed * speedPercent).rotated(Vector3.UP, rotation.y), Vector3.UP)

func set_path(new_path : Object) -> void:
	path = new_path
	pathIndex = 0
	following_path = true
	if !path:
		return
	pass

# warning-ignore:unused_argument
func _physics_process(delta):
	if following_path:
		move_along_path()

func _on_Path_Update_Timer_timeout():
	if (target.global_transform.origin - target_pos_old).length_squared() > sqr_move_threshold:
		request_astar_path()
		target_pos_old = target.global_transform.origin
