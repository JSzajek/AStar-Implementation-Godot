extends Spatial

export (int) var unwalkableMask = 7
export (Vector2) var gridWorldSize
export (float) var nodeRadius = 1
# warning-ignore:unused_class_variable
export (bool) var blurrWeights = false
# warning-ignore:unused_class_variable
export (int) var blurrKernelSize = 1

export (bool) var create_visual_grid = false

# Higher Value is equivalent to more Rugged Terrain
var walkable_regions : Array  = [
	#Floor
	TerrainType.new(10, 0),
	#Grass
	TerrainType.new(11, 10)]
	#Marsh
	#TerrainType.new(12, 10)]

var path_finding_manager : PathRequestManager
var grid_map : Grid

#func _ready():
#	bake_map()

var bake_time : String = ""

func bake_map():
	var time_start = OS.get_ticks_msec()
	grid_map = Grid.new(self, unwalkableMask, gridWorldSize, nodeRadius, walkable_regions)
	
	path_finding_manager = PathRequestManager.new(self)
	
	clear_visual_grid()

	if create_visual_grid:
		create_visual_grid()
	bake_time = "Bake Time: " + str(OS.get_ticks_msec() - time_start) + " msec"

func get_bake_time() -> String:
	return bake_time

func visualize_grid():
	if grid_map == null:
		return
	if get_node("Node_Grid").get_child_count() > 0:
		clear_visual_grid()
	else:
		create_visual_grid()

func clear_visual_grid():
	for child in get_node("Node_Grid").get_children():
		child.queue_free()

func create_visual_grid():
	if get_node("Node_Grid").get_child_count() > 0:
		get_node("Node_Grid").show()
	else:
		var grid = grid_map.grid
		for x in grid.size():
			for y in grid[x].size():
				var color : Color = Color.white
				if grid[x][y] == null:
					continue
				if grid[x][y].movement_penalty != 0:
					color = lerp(Color.white, Color.black, inverse_lerp(grid_map.penaltyMin, grid_map.penaltyMax, grid[x][y].movement_penalty)) 
				
				color = color if grid[x][y].walkable else Color.red
				create_visual_indicator(grid[x][y].worldPosition + Vector3(0,1,0), color)

func create_visual_indicator(position : Vector3, color : Color):
	var mesh_instance = MeshInstance.new()
	var material = SpatialMaterial.new()
	var mesh = SphereMesh.new()
	mesh.radius = nodeRadius/2
	mesh.height = mesh.radius*2
	mesh_instance.set_mesh(mesh)
	material.albedo_color = color
	get_node("Node_Grid").add_child(mesh_instance)
	mesh_instance.set_surface_material(0, material)
	mesh_instance.global_transform.origin = position

func request_path(startPos : Vector3, targetPos : Vector3, callback : FuncRef):
	path_finding_manager.request_path(PathRequest.new(startPos, targetPos, callback))

func find_path(startPos : Vector3, targetPos : Vector3):
	var waypoints : PoolVector3Array = []
	var path_success : bool = false
	var startNode : PathNode = grid_map.NodeFromWorldPoint(startPos)
	var targetNode : PathNode = grid_map.NodeFromWorldPoint(targetPos)
	
	# Invalid start/end check
	if startNode.walkable and targetNode.walkable:
		# A* Path Finding Algorithm
		var openSet : Heap = Heap.new(grid_map.get_max_size())
		var closedSet : Array = []
		openSet.append(startNode)
		
		while openSet.size() > 0:
			var currentNode : PathNode = openSet.remove_first()
			closedSet.append(currentNode)
			
			if currentNode == targetNode:
				path_success = true
				break
			
			for neighbor in grid_map.get_neighbors(currentNode):
				if !neighbor.walkable or closedSet.has(neighbor):
					continue
				var newMoveCostToNeighbor : int = (currentNode.gCost + get_distance(currentNode, neighbor)) + neighbor.movement_penalty
				if !openSet.has(neighbor) or newMoveCostToNeighbor < neighbor.gCost:
					neighbor.gCost = newMoveCostToNeighbor
					neighbor.hCost = get_distance(neighbor, targetNode)
					neighbor.parent = currentNode
					
					if !openSet.has(neighbor):
						openSet.append(neighbor)
					else:
						openSet.update_item(neighbor)
	if path_success:
		waypoints = retrace_path(startNode, targetNode)
	
	return [waypoints, path_success]
	

func retrace_path(startNode : PathNode, endNode : PathNode) -> PoolVector3Array:
	var path_nodes : Array = []
	var currentNode : PathNode = endNode
	
	while currentNode != startNode:
		path_nodes.append(currentNode)
		currentNode = currentNode.parent
	
	var waypoints = simplify_path(path_nodes)
	waypoints.invert()
	return waypoints

func simplify_path(path_nodes : Array) -> PoolVector3Array:
	var waypoints : PoolVector3Array = []
	var direction_old : Vector2 = Vector2.ZERO
	for i in range(path_nodes.size()):
		var direction_new : Vector2 = Vector2(path_nodes[i-1].gridX - path_nodes[i].gridX, path_nodes[i-1].gridY - path_nodes[i].gridY)
		if direction_new != direction_old:
			waypoints.append(path_nodes[i].worldPosition + Vector3.UP)
			direction_old = direction_new
	return waypoints
	
func get_distance(nodeA : PathNode, nodeB : PathNode) -> int:
	var distX : int = int(abs(nodeA.gridX - nodeB.gridX))
	var distY : int = int(abs(nodeA.gridY - nodeB.gridY))
	if distX > distY:
		return 14*distY + 10*(distX-distY)
	else:
		return 14*distX + 10*(distY-distX)


class PathRequestManager:
	var path_request_queue : Array = []
	var pathfinding : Object
	
	var path_request_thread : Thread
	var path_request_mutex : Mutex
	
	func _init(_pathfinding : Object):
		self.pathfinding = _pathfinding
	
	func request_path(path_request : PathRequest):
		if path_request_thread == null:
			path_request_thread = Thread.new()
			path_request_mutex = Mutex.new()
		path_request_mutex.lock()
		path_request_queue.append(path_request)
		path_request_mutex.unlock()
		if path_request_queue.size() == 1:
			# Only item in the list so start the task.
			call_deferred('path_data_defered')
        
	func path_data_defered():
		var error = path_request_thread.start(self, 'path_data_execute', path_request_queue[0])
		if error != 0:
			print(error)
	    
	func path_data_execute(args):
		call_deferred('path_data_clean_up')
		return args
	    
	func path_data_clean_up():
		var args = path_request_thread.wait_to_finish()
		var new_path_args = pathfinding.find_path(args.pathStart, args.pathEnd)
		
		args.callback.call_func(new_path_args)
		path_request_queue.pop_front()
		
		if path_request_queue.size() > 0:
			# Start the next task.
			call_deferred('path_data_defered')
		elif path_request_queue.size() == 0:
			path_request_thread = null
			path_request_mutex = null


class PathRequest:
	var pathStart : Vector3
	var pathEnd : Vector3
	var callback : FuncRef

	func _init(_start : Vector3, _end : Vector3, _callback : FuncRef):
		self.pathStart = _start
		self.pathEnd = _end
		self.callback = _callback


class Grid:
	var parent : Object
	var center_point : Vector3
	var unwalkableBit : int
	var gridWorldSize : Vector2
	var nodeRadius : float
	var grid : Array
	
	var nodeDiameter : float
	var gridSizeX : int
	var gridSizeY : int
	
	# Increased obstacle avoidance
	var obstacleProximityPenalty : int = 10
	
	var penaltyMax : int
	var penaltyMin : int
	
	var walkable_regions : Array
	
	var walkableMask : PoolIntArray = []
	var walkableRegionDictionary : Dictionary = {}
	
	func _init(parent : Object, unwalkableBit : int, gridWorldSize : Vector2, nodeRadius : float, _walkable_regions : Array):
		self.parent = parent
		self.unwalkableBit = unwalkableBit
		self.gridWorldSize = gridWorldSize
		self.nodeRadius = nodeRadius
		self.walkable_regions = _walkable_regions
		nodeDiameter = nodeRadius * 2
		gridSizeX = int(ceil(gridWorldSize.x/nodeDiameter))
		gridSizeY = int(ceil(gridWorldSize.y/nodeDiameter))
		penaltyMin = walkable_regions[0].terrainPenalty
		penaltyMax = walkable_regions[-1].terrainPenalty
		for terrain in walkable_regions:
			walkableMask.append(terrain.terrainMask-1) # Minus 1 b/c layer is base 1 and bits are base 0
			walkableRegionDictionary[terrain.terrainMask] = terrain.terrainPenalty
		create_grid()
	
	func get_max_size():
		return gridSizeX * gridSizeY
	
	func create_grid():
		grid = create_empty_matrix(gridSizeX, gridSizeY, null)
		var worldBottomLeft : Vector3 = center_point - (Vector3.RIGHT * round(gridWorldSize.x/2.0)) - (Vector3.FORWARD * round(gridWorldSize.y/2.0))
		var direct_space : PhysicsDirectSpaceState = parent.get_world().direct_space_state
		var check_sphere : PhysicsShapeQueryParameters = PhysicsShapeQueryParameters.new()
		var shape : SphereShape = SphereShape.new()
		shape.radius = nodeRadius
		check_sphere.set_shape(shape)
		check_sphere.collision_mask = get_collision_bit([unwalkableBit])
		
		var terrain_layer_bit = get_collision_bit(walkableMask)
		for x in range(gridSizeX):
			for y in range(gridSizeY):
				var worldPoint : Vector3 = worldBottomLeft + (Vector3.RIGHT * (x * nodeDiameter + nodeRadius)) + (Vector3.FORWARD * (y * nodeDiameter + nodeRadius))
				check_sphere.transform.origin = worldPoint
				var result = direct_space.intersect_shape(check_sphere)
				var walkable : bool = result.size() == 0
				var movement_penalty : int = 0

				var results = direct_space.intersect_ray(worldPoint + (Vector3.UP * 50), worldPoint + (Vector3.DOWN * 100), [], terrain_layer_bit)
				if results:
					var layer = log_base(results.collider.collision_layer - 256, 2) # Subtract walkable layer
					# convert back from base 0 to base 1
					if walkableRegionDictionary.has(layer+1):
						movement_penalty = walkableRegionDictionary[layer+1]
#					print(movement_penalty)
#				else:
#					grid[x][y] = null
#					continue
				if !walkable:
					movement_penalty += obstacleProximityPenalty
				
				grid[x][y] = PathNode.new(walkable, worldPoint, x, y, movement_penalty)
		
		if parent.blurrWeights:
			blur_penalty_map(parent.blurrKernelSize)
	
	func log_base(value : float, base : int) -> int:
		return int(log(value)/log(base))
	
	func get_neighbors(node : PathNode) -> Array:
		var neighbors : Array = []
		for x in range(-1, 2, 1):
			for y in range(-1, 2, 1):
				if x == 0 and y == 0:
					continue
				
				var checkX : int = node.gridX + x
				var checkY : int = node.gridY + y
				if checkX >= 0 and checkX < gridSizeX and checkY >= 0 and checkY < gridSizeY:
					if grid[checkX][checkY] != null:
						neighbors.append(grid[checkX][checkY])
		return neighbors
	
	func NodeFromWorldPoint(worldPosition : Vector3) -> Reference:
		var percentX : float = (worldPosition.x + (gridWorldSize.x/2.0)) / float(gridWorldSize.x)
		var percentY : float = (-worldPosition.z + (gridWorldSize.y/2.0)) / float(gridWorldSize.y)
		percentX = clamp(percentX, 0, 1)
		percentY = clamp(percentY, 0, 1) 
		var x : int = int(round((gridSizeX-1) * percentX))
		var y : int = int(round((gridSizeY-1) * percentY))
		return grid[x][y]
	
	func get_collision_bit(array_of_values : PoolIntArray) -> int:
		var bit : int = 0
		for value in array_of_values:
			bit += int(pow(2, value))
		return bit
	
	func blur_penalty_map(blur_size : int) -> void:
		var kernel_size : int = blur_size * 2 + 1
		var kernel_extents : int = int((kernel_size-1)/2.0)
		
		var penalties_horizontal_pass : Array = create_empty_matrix(gridSizeX, gridSizeY, 0)
		var penalties_vertical_pass : Array = create_empty_matrix(gridSizeX, gridSizeY, 0)
		
		for y in range(gridSizeY):
			for x in range(-kernel_extents, kernel_extents + 1 + 1):
				var sampleX : int = int(clamp(x, 0, kernel_extents))
#				var grid_val = grid[sampleX][y]
#				penalties_horizontal_pass[0][y] += edgePenalty if grid_val == null else grid_val.movement_penalty
				penalties_horizontal_pass[0][y] += grid[sampleX][y].movement_penalty
			
			
			for x in range(1, gridSizeX):
				var removeIndex : int = int(clamp(x - kernel_extents - 1, 0, gridSizeX))
				var addIndex : int = int(clamp(x + kernel_extents, 0, gridSizeX - 1))
#				var grid_val_1 = grid[removeIndex][y]
#				var grid_val_2 = grid[addIndex][y]
#				penalties_horizontal_pass[x][y] = penalties_horizontal_pass[x-1][y]  - (edgePenalty if grid_val_1 == null else grid_val_1.movement_penalty) + (edgePenalty if grid_val_2 == null else grid_val_2.movement_penalty)
				penalties_horizontal_pass[x][y] = penalties_horizontal_pass[x-1][y]  - grid[removeIndex][y].movement_penalty + grid[addIndex][y].movement_penalty
	
		for x in range(gridSizeX):
			for y in range(-kernel_extents, kernel_extents + 1 + 1):
				var sampleY : int = int(clamp(y, 0, kernel_extents))
				penalties_vertical_pass[x][0] += penalties_horizontal_pass[x][sampleY]
			
			var blurred_penalty : int = int(round(penalties_vertical_pass[x][0]  / float(kernel_size * kernel_size)))
#			if grid[x][0] != null:
			grid[x][0].movement_penalty = blurred_penalty
			
			for y in range(1, gridSizeY):
				var removeIndex : int = int(clamp(y - kernel_extents - 1, 0, gridSizeY))
				var addIndex : int = int(clamp(y + kernel_extents, 0, gridSizeY - 1))
			
				penalties_vertical_pass[x][y] = penalties_vertical_pass[x][y-1]  - penalties_horizontal_pass[x][removeIndex] + penalties_horizontal_pass[x][addIndex]
				blurred_penalty = int(round(penalties_vertical_pass[x][y]  / float(kernel_size * kernel_size)))
#				if grid[x][y] != null:
				grid[x][y].movement_penalty = blurred_penalty
				
				if blurred_penalty > penaltyMax:
					penaltyMax = blurred_penalty
				if blurred_penalty < penaltyMin:
					penaltyMin = blurred_penalty
	
	func create_empty_matrix(column, row, value) -> Array:
		var matrix = []
		for i in row:
			var mat_row = []
			for j in column:
				mat_row.append(value)
			matrix.append(mat_row)
		return matrix


class TerrainType:
	var terrainMask : int
	var terrainPenalty : int
	
	func _init(_mask : int, _penalty : int):
		self.terrainMask = _mask
		self.terrainPenalty = _penalty 


class Line:
	const VERTICAL_LINE_GRAD : float = pow(10,5)
	
	var gradient : float
	var y_intercept : float
	var point_on_line_1 : Vector2
	var point_on_line_2 : Vector2
	
	var gradientPerpendicular : float
	
	var approachSide : bool
	
	func _init(point_on_line : Vector2, point_perp_to_line : Vector2):
		var dx : float = point_on_line.x - point_perp_to_line.x
		var dy : float = point_on_line.y - point_perp_to_line.y
		
		if dx == 0:
			gradientPerpendicular = VERTICAL_LINE_GRAD
		else:
			gradientPerpendicular = dy / dx
		
		if gradientPerpendicular == 0:
			gradient = VERTICAL_LINE_GRAD
		else:
			gradient = -1 / gradientPerpendicular
		
		y_intercept = point_on_line.y - gradient * point_on_line.x
		point_on_line_1 = point_on_line
		point_on_line_2 = point_on_line + Vector2(1, gradient)
		
		approachSide = false
		approachSide = get_side(point_perp_to_line)
		
	func get_side(p : Vector2) -> bool:
		return (p.x - point_on_line_1.x) * (point_on_line_2.y - point_on_line_1.y) > (p.y - point_on_line_1.y) * (point_on_line_2.x - point_on_line_1.x)
	
	func has_crossed_line(p : Vector2) -> bool:
		return get_side(p) != approachSide
	
	func distance_from_point(p : Vector2) -> float:
		var yInterceptPerp : float = p.y - gradientPerpendicular * p.x
		var intersectX : float = (yInterceptPerp - y_intercept)/(gradient-gradientPerpendicular)
		var intersectY : float = gradient * intersectX + y_intercept
		return p.distance_to(Vector2(intersectX, intersectY))

	func draw_line(geometry : ImmediateGeometry, length : float) -> void:
		var lineDir : Vector3  = Vector3(1,0,gradient).normalized()
		var lineCenter : Vector3 = Vector3(point_on_line_1.x, 0, point_on_line_1.y) + Vector3.UP
		geometry.add_vertex(lineCenter - lineDir * length/2.0)
		geometry.add_vertex(lineCenter + lineDir * length/2.0)


class SmoothPath:
	var parent : Object
	var lookPoints : PoolVector3Array = []
	var turnBoundaries : Array = []
	var finishLineIndex : int
	var slowDownIndex : int
	
	func _init(_parent : Object, waypoints : PoolVector3Array, start_pos : Vector3, _draw_path : Array, turn_dist : float, stopping_dist : float):
		self.parent = _parent
		lookPoints = waypoints
		turnBoundaries.resize(lookPoints.size())
		finishLineIndex = turnBoundaries.size() - 1
		
		var prev_point : Vector2 = V3_to_V2(start_pos)
		for i in range(lookPoints.size()):
			var currentPoint : Vector2 = V3_to_V2(lookPoints[i])
			var dirToCurrentPoints : Vector2 = (currentPoint - prev_point).normalized()
			var turnBoundaryPoint : Vector2 = currentPoint if (i == finishLineIndex) else currentPoint - dirToCurrentPoints * turn_dist
			turnBoundaries[i] = Line.new(turnBoundaryPoint, prev_point - dirToCurrentPoints * turn_dist)
			prev_point = turnBoundaryPoint
		
		if _draw_path[0]:
			draw_path(_draw_path[1], _draw_path[2])
		
		var distFromEndPoint = 0
		for i in range(lookPoints.size()-1, -1, -1):
			distFromEndPoint += lookPoints[i].distance_to(lookPoints[i-1])
			if distFromEndPoint > stopping_dist:
				slowDownIndex = i
				break
				
	func V3_to_V2(v3 : Vector3) -> Vector2:
		return Vector2(v3.x, v3.z)
	
	func draw_path(path_debug : ImmediateGeometry, point_debug : ImmediateGeometry) -> void:
		path_debug.clear()
		var spatial = SpatialMaterial.new()
		spatial.albedo_color = Color.red
		path_debug.material_override = spatial
		path_debug.begin(Mesh.PRIMITIVE_LINE_STRIP)
		for points in lookPoints:
			path_debug.add_vertex(points)
		path_debug.end()


class PathNode:
	var gridX : int
	var gridY : int
	var walkable : bool
	var worldPosition : Vector3
	var movement_penalty : int
	
	var gCost : int = 0
	var hCost : int = 0
	
	var parent : PathNode
	
	func _init(_walkable : bool, _worldPos : Vector3, _gridX : int, _gridY : int, _movement_penalty : int):
		self.gridX = _gridX
		self.gridY = _gridY
		self.walkable = _walkable
		self.worldPosition = _worldPos
		self.movement_penalty = _movement_penalty

	func fCost() -> int:
		return gCost + hCost
	
	func compare_to(node : PathNode):
		var comparison : int = node.fCost() - fCost()
		if comparison == 0:
			return node.hCost - hCost
		else:
			return comparison

class Heap:
	var heap_item_dict : Dictionary
	var items : Array
	var currentItemCount : int
	
	func _init(maxHeapSize : int):
		heap_item_dict = {}
		currentItemCount = 0
		items.resize(maxHeapSize)
	
	func append(item : Object):
		var heap_item = Heap_Item.new(item, currentItemCount)
		heap_item_dict[heap_item.unique_id] = heap_item
		if currentItemCount >= items.size():		# NOT OPTIMAL - FIX
			items.resize(int(currentItemCount*1.25))
		items[currentItemCount] = heap_item
		currentItemCount += 1
		sort_up(heap_item)
	
	func remove_first() -> Object:
		var firstItem : Heap_Item = items[0]
		currentItemCount-= 1
		items[0] = items[currentItemCount]
		items[0].heapIndex = 0
		sort_down(items[0])
		
		# warning-ignore:return_value_discarded
		heap_item_dict.erase(firstItem.unique_id)
		return firstItem.item
	
	func find(item : Object) -> Heap_Item:
		if heap_item_dict.has(item.worldPosition):
			return heap_item_dict[item.worldPosition]
		else:
			return null
	
	func update_item(item : Object):
		sort_up(find(item))
	
	func size() -> int:
		return currentItemCount
	
	func has(item : Object) -> bool:
		item = find(item)
		if item == null:
			return false
		if size() <= item.heapIndex:
			return false
		return items[item.heapIndex].item ==  item
	
	func sort_down(item : Heap_Item):
		while(true):
			var childIndexLeft : int = (item.heapIndex * 2) + 1
			var childIndexRight : int = (item.heapIndex * 2) + 2
			var swapIndex : int = 0
			if childIndexLeft < size():
				swapIndex = childIndexLeft
				if childIndexRight < size():
					if items[childIndexLeft].compare_to(items[childIndexRight]) < 0:
						swapIndex = childIndexRight
				
				if item.compare_to(items[swapIndex]) < 0:
					swap(item, items[swapIndex])
				else:
					return
			else:
				return
			
	func sort_up(item : Heap_Item):
		var parentIndex : int = int((item.heapIndex-1)/2.0)
		while (true):
			if parentIndex > 0 and item.compare_to(items[parentIndex]) > 0:
				swap(item, items[parentIndex])
			else:
				break
			parentIndex = int((item.heapIndex-1)/2.0)

	func swap(itemA : Heap_Item, itemB : Heap_Item):
		items[itemA.heapIndex] = itemB
		items[itemB.heapIndex] = itemA
		var itemAIndex : int = itemA.heapIndex
		itemA.heapIndex =  itemB.heapIndex
		itemB.heapIndex = itemAIndex
	
	class Heap_Item:
		var heapIndex : int
		var item : Object
		# Use World Point of Path Nodes as Unique identifier
		var unique_id : Vector3
		
		func _init(_item : Object, _heapIndex : int):
			self.heapIndex = _heapIndex
			self.item = _item
			self.unique_id = _item.worldPosition
		
		func compare_to(other : Heap_Item):
			return item.compare_to(other.item)

