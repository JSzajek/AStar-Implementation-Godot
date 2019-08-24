extends Control

var Astar : Object

var parameter_display : Control
var navigation_display : Control

func _ready():
	Astar = get_parent().get_node("AStar")
	parameter_display = get_node("Parameters/Display")
	navigation_display = get_node("Navigation/Display")

func _process(delta):
	if get_parent().get_node("Seekers").get_child_count() > 0:
		parameter_display.get_node("Bake_Button").disabled = true
		parameter_display.get_node("Track_Button").disabled = false

func _on_Parameter_Button_pressed():
	if parameter_display.visible:
		parameter_display.hide()
		parameter_display.get_parent().get_node("Parameter_Button").text = "<"
		var rect_pos = parameter_display.get_parent().rect_position
		var view_port = get_viewport().size
		parameter_display.get_parent().rect_position = Vector2(view_port.x - 25, rect_pos.y)
	else:
		parameter_display.show()
		parameter_display.get_parent().get_node("Parameter_Button").text = ">"
		var rect_pos = parameter_display.get_parent().rect_position
		var view_port = get_viewport().size
		parameter_display.get_parent().rect_position = Vector2(view_port.x - 250, rect_pos.y)


func _on_Navigation_Button_pressed():
	if navigation_display.visible:
		navigation_display.hide()
		navigation_display.get_parent().get_node("Navigation_Button").text = "^"
		var rect_pos = navigation_display.get_parent().rect_position
		var view_port = get_viewport().size
		
		navigation_display.get_parent().rect_position = Vector2(rect_pos.x, view_port.y - 25)
	else:
		navigation_display.show()
		navigation_display.get_parent().get_node("Navigation_Button").text = "v"
		var rect_pos = navigation_display.get_parent().rect_position
		var view_port = get_viewport().size
		navigation_display.get_parent().rect_position = Vector2(rect_pos.x, view_port.y - 100)

func _on_Bake_Button_pressed():
	var blurr_weights : bool = false
	var kernel_size : int = 1
	var visualize_grid : bool = false
	var node_size : float = 1.0
	if parameter_display.get_node("Weights_Control/CheckBox").is_pressed():
		blurr_weights = true
	if typeof(parameter_display.get_node("Kernel_Size/LineEdit").text) == TYPE_INT:
		kernel_size = int(parameter_display.get_node("Kernel_Size/LineEdit").text)
	if typeof(parameter_display.get_node("Node_Size/LineEdit").text) == TYPE_REAL:
		node_size = float(parameter_display.get_node("Node_Size/LineEdit").text)
	if parameter_display.get_node("Visualize_Grid/Visualize_Grid_CheckBox").is_pressed():
		visualize_grid = true
	
	Astar.nodeRadius = node_size
	Astar.blurrWeights = blurr_weights
	Astar.blurrKernelSize = kernel_size
	Astar.create_visual_grid = visualize_grid
	
	Astar.bake_map()
	parameter_display.get_node("Track_Button").disabled = false
	parameter_display.get_node("Spawn_Seeker").disabled = false
	parameter_display.get_node("Clear_Seekers").disabled = false
	parameter_display.get_node("Bake_Button").disabled = true
	get_node("Bake_Time").text = Astar.get_bake_time()

func _on_Down_Rotation_pressed():
	get_parent().rotate_camera("down")

func _on_Up_Rotation_pressed():
	get_parent().rotate_camera("up")

func _on_Right_Rotation_pressed():
	get_parent().rotate_camera("right")

func _on_Left_Rotation_pressed():
	get_parent().rotate_camera("left")


func _on_Spawn_Seeker_pressed():
	get_parent().spawn_seeker()


func _on_Clear_Seekers_pressed():
	get_parent().clear_seekers()
	
	parameter_display.get_node("Bake_Button").disabled = false
	parameter_display.get_node("Track_Button").disabled = true
	track_button_name()


func _on_Visualize_Path_CheckBox_pressed():
	get_parent().set_path_visualization(parameter_display.get_node("Visualize_Path/Visualize_Path_CheckBox").is_pressed())

func _on_Track_Button_pressed():
	track_button_name()
	get_parent().track_target(!get_parent().tracking)

func track_button_name():
	if !get_parent().tracking:
		parameter_display.get_node("Track_Button").text = "Stop Tracking"
	else:
		parameter_display.get_node("Track_Button").text = "Start Tracking"


func _on_Visualize_Grid_CheckBox_pressed():
	get_parent().get_node("AStar").visualize_grid()
