# AStar-Implementation-Godot #
An AStar Pathfinding implementation in Godot game engine.

This was done in an attempt to improve upon the current Godot game engine's 3d pathing navigation.

### Capabilities / Advantages: ###
* Naive Binary Heap - to increase path-node comparison efficiency
* Path Tracking Smoothing - 'natural' like movement tracking
* Naive Obstacle Avoidance - increased obstacle avoidance utilizing weights
* Path Weights - favor paths over 'rough' terrain
* Gradient Slowdown - 'natural' slow down when approaching target

### Task List: ###
- [ ] Improve Naive Binary Heap Implementation
- [ ] Decrease 'jitter' in pathing
- [ ] Fix being caught on obstacles
- [ ] Increased favoring for weights
- [ ] Fix slowdown after close distance

#### Detailed Description ####
The main scence demonstrates these key features within only a few steps. First being the baking of the grid-node map with any user set parameters, which then displays its bake-time. Second spawning in as many "seekers/trackers" into the scene that will track the target which is represented by the red dot. Target can be moved around the scene by clicking any valid position. 

#### Included ####
* Primary Scripts, Assets, Scenes, and .project
* Executable Project File
