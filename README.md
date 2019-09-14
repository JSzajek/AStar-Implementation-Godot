# AStar-Implementation-Godot #
An AStar Pathfinding implementation in Godot game engine.

This was done in an attempt to improve upon the current Godot game engine's 3d pathing navigation.

### Capabilities / Advantages: ###
* Naive Binary Heap - to increase path-node comparison efficiency
* Path Tracking Smoothing - 'natural' like movement tracking
* Naive Obstacle Avoidance - increased obstacle avoidance utilizing weights
* Path Weights - favor paths over 'rough' terrain
* Gradient Slowdown - 'natural' slow down when approaching target
* Path Request Trimming - replaces old requests

### Task List: ###
- [ ] Improve Naive Binary Heap Implementation
- [ ] Decrease 'jitter' in pathing
- [ ] Fix being caught on obstacles
- [ ] Increased favoring for weights
- [x] Fix slowdown after close distance
- [ ] Move path following into Astar script
- [ ] Visualize smooth path as curve 
- [ ] Add Additional Environments
- [ ] Implement Jump Point Search w/ weights

#### Detailed Description ####
The main scence demonstrates these key features within only a few steps. 
1. The baking of the grid-node map with any user set parameters, which then displays its bake-time. 
2. Spawning in as many "seekers/trackers" into the scene that will track the target which is represented by the red dot. 
3. Target can be moved around the scene by clicking any valid position. 

#### Included ####
* Primary Scripts, Assets, Scenes
* Built Executable Project


#### Example Baking ####
![alt text](https://github.com/JSzajek/AStar-Implementation-Godot/blob/master/Baking_Example.png)

#### Example Pathing ####
![alt text](https://github.com/JSzajek/AStar-Implementation-Godot/blob/master/Pathing_Example.png)
