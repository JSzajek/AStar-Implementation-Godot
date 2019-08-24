GDPC                                                                                    res://AStar Implementation.tscn `      #      ���m�2�M�8Y�   res://assets/AStar.tscn �      �       9tx�]H�@���s���   res://assets/Canvas.tscnp      �)      ����MϘ��:7�V�:�   res://assets/Seeker.tscn`:      �      bq��2��$�����   res://assets/Target.tscn?      �      �ae�7
�e�s��>f   res://assets/World.tscn �@      |      ��V�����������%   res://default_env.tres  p`      �       um�`�N��<*ỳ�8   res://project.binary`�      k      |wP���~a@;+���,   res://scripts/AStar Implementation.gd.remap ��      7       ɾ��q.H�j5�)���S(   res://scripts/AStar Implementation.gdc   a      �      (�
>�p���\�_�y��   res://scripts/AStar.gd.remap��      (       \���
>���z��   res://scripts/AStar.gdc �n      �Q      �v�oG��Qⴴ���sH    res://scripts/Canvas.gd.remap    �      )       ���FZ��-/�(T��R   res://scripts/Canvas.gdc��      �      �j����*㎅I=��]R    res://scripts/Seeker.gd.remap   0�      )       �_���|�eq9�    res://scripts/Seeker.gdc��      �      	F����
,�].��?            [gd_scene load_steps=9 format=2]

[ext_resource path="res://scripts/AStar Implementation.gd" type="Script" id=1]
[ext_resource path="res://assets/Seeker.tscn" type="PackedScene" id=2]
[ext_resource path="res://assets/AStar.tscn" type="PackedScene" id=3]
[ext_resource path="res://assets/Canvas.tscn" type="PackedScene" id=4]
[ext_resource path="res://assets/World.tscn" type="PackedScene" id=5]
[ext_resource path="res://assets/Target.tscn" type="PackedScene" id=6]

[sub_resource type="ProceduralSky" id=1]
sky_top_color = Color( 0.403922, 0.686275, 0.843137, 1 )
sky_horizon_color = Color( 0.639216, 0.713726, 0.772549, 1 )
ground_bottom_color = Color( 0.403922, 0.686275, 0.843137, 1 )
ground_horizon_color = Color( 0.639216, 0.713726, 0.772549, 1 )

[sub_resource type="Environment" id=2]
background_mode = 2
background_sky = SubResource( 1 )

[node name="AStar Implementation" type="Node"]
script = ExtResource( 1 )
seeker = ExtResource( 2 )

[node name="AStar" parent="." instance=ExtResource( 3 )]
gridWorldSize = Vector2( 50, 50 )

[node name="DirectionalLight" type="DirectionalLight" parent="."]
transform = Transform( 0.707107, 0.298836, -0.640856, 0, 0.906308, 0.422618, 0.707107, -0.298836, 0.640856, 0, -12, 0 )
light_energy = 2.0
shadow_enabled = true
shadow_color = Color( 0.419608, 0.419608, 0.419608, 1 )
shadow_bias = 1.0

[node name="Pivot" type="Spatial" parent="."]

[node name="Swivel" type="Spatial" parent="Pivot"]

[node name="Camera" type="Camera" parent="Pivot/Swivel"]
transform = Transform( 1, 0, 0, 0, 0.707107, 0.707107, 0, -0.707107, 0.707107, 0, 30, 30 )
environment = SubResource( 2 )

[node name="Canvas" parent="." instance=ExtResource( 4 )]

[node name="World" parent="." instance=ExtResource( 5 )]

[node name="Target" parent="." instance=ExtResource( 6 )]
transform = Transform( 1, 0, 0, 0, 1, 0, 0, 0, 1, 3, 2.5, 21 )

[node name="Spawn_Points" type="Spatial" parent="."]
editor/display_folded = true

[node name="Pos_1" type="Position3D" parent="Spawn_Points"]
transform = Transform( 1, 0, 0, 0, 1, 0, 0, 0, 1, 19, 2, 0 )

[node name="Pos_2" type="Position3D" parent="Spawn_Points"]
transform = Transform( 1, 0, 0, 0, 1, 0, 0, 0, 1, -20, 2, 14 )

[node name="Pos_3" type="Position3D" parent="Spawn_Points"]
transform = Transform( 1, 0, 0, 0, 1, 0, 0, 0, 1, -16, 2, -6 )

[node name="Pos_4" type="Position3D" parent="Spawn_Points"]
transform = Transform( 1, 0, 0, 0, 1, 0, 0, 0, 1, -20, 2, -21 )

[node name="Pos_5" type="Position3D" parent="Spawn_Points"]
transform = Transform( 1, 0, 0, 0, 1, 0, 0, 0, 1, 3, 2, -20 )

[node name="Pos_6" type="Position3D" parent="Spawn_Points"]
transform = Transform( 1, 0, 0, 0, 1, 0, 0, 0, 1, -5, 2, 3 )

[node name="Pos_7" type="Position3D" parent="Spawn_Points"]
transform = Transform( 1, 0, 0, 0, 1, 0, 0, 0, 1, 17, 2, 20 )

[node name="Seekers" type="Node" parent="."]
             [gd_scene load_steps=2 format=2]

[ext_resource path="res://scripts/AStar.gd" type="Script" id=1]

[node name="AStar" type="Spatial"]
script = ExtResource( 1 )

[node name="Node_Grid" type="Spatial" parent="."]
             [gd_scene load_steps=6 format=2]

[ext_resource path="res://scripts/Canvas.gd" type="Script" id=1]

[sub_resource type="StyleBoxFlat" id=6]
bg_color = Color( 0.686275, 0.686275, 0.686275, 1 )
border_width_left = 2
border_width_right = 2
border_width_bottom = 2
border_color = Color( 0.294118, 0.294118, 0.294118, 1 )

[sub_resource type="StyleBoxFlat" id=2]
bg_color = Color( 0.52549, 0.521569, 0.521569, 1 )
border_width_top = 2
border_width_right = 2
border_width_bottom = 2
border_color = Color( 0.294118, 0.294118, 0.294118, 1 )

[sub_resource type="StyleBoxFlat" id=3]
bg_color = Color( 0.188235, 0.188235, 0.188235, 0.294118 )

[sub_resource type="StyleBoxFlat" id=5]
bg_color = Color( 0.52549, 0.521569, 0.521569, 1 )
border_width_left = 2
border_width_right = 2
border_width_bottom = 2
border_color = Color( 0.294118, 0.294118, 0.294118, 1 )

[node name="Canvas" type="Control"]
anchor_right = 1.0
anchor_bottom = 1.0
mouse_filter = 2
script = ExtResource( 1 )

[node name="Label" type="Label" parent="."]
anchor_left = 0.5
anchor_right = 0.5
margin_left = -70.5
margin_top = 15.0
margin_right = 89.5
margin_bottom = 31.0
rect_scale = Vector2( 3, 3 )
rect_pivot_offset = Vector2( 80, 0 )
text = "AStar Pathfinding"
align = 1
valign = 1

[node name="Bake_Time" type="Label" parent="."]
anchor_left = 0.5
anchor_right = 0.5
margin_left = -83.5
margin_top = 50.71
margin_right = 83.5
margin_bottom = 80.7101
text = "Bake Time : --"
align = 1
valign = 1

[node name="Parameters" type="ColorRect" parent="."]
anchor_left = 1.0
anchor_right = 1.0
anchor_bottom = 1.0
margin_left = -249.0
margin_right = 0.998535
rect_pivot_offset = Vector2( 0, 300 )
color = Color( 0.482353, 0.482353, 0.482353, 0.392157 )

[node name="Parameter_Button" type="Button" parent="Parameters"]
anchor_top = 0.5
anchor_bottom = 0.5
margin_top = -20.0
margin_right = 20.0
margin_bottom = 20.0
focus_mode = 0
custom_styles/hover = SubResource( 6 )
custom_styles/normal = SubResource( 2 )
enabled_focus_mode = 0
text = ">"

[node name="Display" type="Control" parent="Parameters"]
anchor_right = 1.0
anchor_bottom = 1.0
mouse_filter = 2

[node name="Label" type="Label" parent="Parameters/Display"]
anchor_left = 0.5
anchor_right = 0.5
margin_left = -127.0
margin_top = 10.0
margin_right = 143.0
margin_bottom = 40.0
text = "Map Parameters"
align = 1
valign = 1

[node name="Visualize_Grid" type="Panel" parent="Parameters/Display"]
anchor_left = 0.5
anchor_right = 0.5
margin_left = -105.0
margin_top = 50.0
margin_right = 105.0
margin_bottom = 90.0
custom_styles/panel = SubResource( 3 )

[node name="Label" type="Label" parent="Parameters/Display/Visualize_Grid"]
anchor_top = 0.5
anchor_bottom = 0.5
margin_left = 10.0
margin_top = -7.0
margin_right = 150.0
margin_bottom = 7.0
text = "Visualize Grid"
valign = 1

[node name="Visualize_Grid_CheckBox" type="CheckBox" parent="Parameters/Display/Visualize_Grid"]
anchor_left = 1.0
anchor_top = 0.5
anchor_right = 1.0
anchor_bottom = 0.5
margin_left = -30.0
margin_top = -12.0
margin_right = -6.0
margin_bottom = 12.0
focus_mode = 0
pressed = true
enabled_focus_mode = 0

[node name="Node_Size" type="Panel" parent="Parameters/Display"]
anchor_left = 0.5
anchor_right = 0.5
margin_left = -105.0
margin_top = 100.0
margin_right = 105.0
margin_bottom = 140.0
custom_styles/panel = SubResource( 3 )

[node name="Label" type="Label" parent="Parameters/Display/Node_Size"]
anchor_top = 0.5
anchor_bottom = 0.5
margin_left = 10.0
margin_top = -7.0
margin_right = 150.0
margin_bottom = 7.0
text = "Node Radius"
valign = 1

[node name="LineEdit" type="LineEdit" parent="Parameters/Display/Node_Size"]
anchor_left = 1.0
anchor_top = 0.5
anchor_right = 1.0
anchor_bottom = 0.5
margin_left = -62.0
margin_top = -12.0
margin_right = -4.0
margin_bottom = 12.0
text = "1.0"
align = 1
context_menu_enabled = false

[node name="Weights_Control" type="Panel" parent="Parameters/Display"]
anchor_left = 0.5
anchor_right = 0.5
margin_left = -105.0
margin_top = 150.0
margin_right = 105.0
margin_bottom = 190.0
custom_styles/panel = SubResource( 3 )

[node name="Label" type="Label" parent="Parameters/Display/Weights_Control"]
anchor_top = 0.5
anchor_bottom = 0.5
margin_left = 10.0
margin_top = -7.0
margin_right = 150.0
margin_bottom = 7.0
text = "Blurr Weights"
valign = 1

[node name="CheckBox" type="CheckBox" parent="Parameters/Display/Weights_Control"]
anchor_left = 1.0
anchor_top = 0.5
anchor_right = 1.0
anchor_bottom = 0.5
margin_left = -30.0
margin_top = -12.0
margin_right = -6.0
margin_bottom = 12.0
focus_mode = 0
pressed = true
enabled_focus_mode = 0

[node name="Kernel_Size" type="Panel" parent="Parameters/Display"]
anchor_left = 0.5
anchor_right = 0.5
margin_left = -105.0
margin_top = 200.0
margin_right = 105.0
margin_bottom = 240.0
custom_styles/panel = SubResource( 3 )

[node name="Label" type="Label" parent="Parameters/Display/Kernel_Size"]
anchor_top = 0.5
anchor_bottom = 0.5
margin_left = 10.0
margin_top = -7.0
margin_right = 150.0
margin_bottom = 7.0
text = "Kernel Size"
valign = 1

[node name="LineEdit" type="LineEdit" parent="Parameters/Display/Kernel_Size"]
anchor_left = 1.0
anchor_top = 0.5
anchor_right = 1.0
anchor_bottom = 0.5
margin_left = -62.0
margin_top = -12.0
margin_right = -4.0
margin_bottom = 12.0
text = "1"
align = 1
max_length = 1
context_menu_enabled = false

[node name="Bake_Button" type="Button" parent="Parameters/Display"]
anchor_left = 0.5
anchor_right = 0.5
margin_left = -85.0
margin_top = 250.0
margin_right = 85.0
margin_bottom = 280.0
focus_mode = 0
enabled_focus_mode = 0
text = "Bake Navigation Grid"

[node name="Label2" type="Label" parent="Parameters/Display"]
anchor_left = 0.5
anchor_right = 0.5
margin_left = -137.0
margin_top = 320.0
margin_right = 133.0
margin_bottom = 350.0
text = "Seekers Parameters"
align = 1
valign = 1

[node name="Spawn_Seeker" type="Button" parent="Parameters/Display"]
anchor_left = 0.5
anchor_right = 0.5
margin_left = -85.0
margin_top = 360.0
margin_right = 85.0
margin_bottom = 390.0
disabled = true
enabled_focus_mode = 0
text = "Spawn Seeker"

[node name="Clear_Seekers" type="Button" parent="Parameters/Display"]
anchor_left = 0.5
anchor_right = 0.5
margin_left = -85.0
margin_top = 405.0
margin_right = 85.0
margin_bottom = 435.0
disabled = true
enabled_focus_mode = 0
text = "Clear Seekers"

[node name="Visualize_Path" type="Panel" parent="Parameters/Display"]
anchor_left = 0.5
anchor_right = 0.5
margin_left = -105.0
margin_top = 445.0
margin_right = 105.0
margin_bottom = 485.0
custom_styles/panel = SubResource( 3 )

[node name="Label" type="Label" parent="Parameters/Display/Visualize_Path"]
anchor_top = 0.5
anchor_bottom = 0.5
margin_left = 10.0
margin_top = -7.0
margin_right = 150.0
margin_bottom = 7.0
text = "Visualize Path"
valign = 1

[node name="Visualize_Path_CheckBox" type="CheckBox" parent="Parameters/Display/Visualize_Path"]
anchor_left = 1.0
anchor_top = 0.5
anchor_right = 1.0
anchor_bottom = 0.5
margin_left = -30.0
margin_top = -12.0
margin_right = -6.0
margin_bottom = 12.0
enabled_focus_mode = 0

[node name="Track_Button" type="Button" parent="Parameters/Display"]
anchor_left = 0.5
anchor_right = 0.5
margin_left = -85.0
margin_top = 495.0
margin_right = 85.0
margin_bottom = 525.0
disabled = true
enabled_focus_mode = 0
text = "Start Tracking"

[node name="Navigation" type="ColorRect" parent="."]
anchor_left = 0.5
anchor_top = 1.0
anchor_right = 0.5
anchor_bottom = 1.0
margin_left = -175.0
margin_top = -120.0
margin_right = 175.0
margin_bottom = 0.000183105
color = Color( 0.482353, 0.482353, 0.482353, 0.392157 )

[node name="Navigation_Button" type="Button" parent="Navigation"]
anchor_left = 0.5
anchor_right = 0.5
margin_left = -50.0
margin_right = 50.0
margin_bottom = 20.0
focus_mode = 0
custom_styles/hover = SubResource( 6 )
custom_styles/normal = SubResource( 5 )
enabled_focus_mode = 0
text = "v"

[node name="Display" type="Control" parent="Navigation"]
editor/display_folded = true
anchor_right = 1.0
anchor_bottom = 1.0
mouse_filter = 2

[node name="Down_Rotation" type="Button" parent="Navigation/Display"]
anchor_left = 0.5
anchor_top = 1.0
anchor_right = 0.5
anchor_bottom = 1.0
margin_left = -50.0
margin_top = -40.0
margin_right = 50.0
margin_bottom = -10.0
focus_mode = 0
enabled_focus_mode = 0
text = "v"

[node name="Up_Rotation" type="Button" parent="Navigation/Display"]
anchor_left = 0.5
anchor_top = 1.0
anchor_right = 0.5
anchor_bottom = 1.0
margin_left = -50.0
margin_top = -70.0
margin_right = 50.0
margin_bottom = -40.0
focus_mode = 0
enabled_focus_mode = 0
text = "^"

[node name="Right_Rotation" type="Button" parent="Navigation/Display"]
anchor_left = 0.5
anchor_top = 1.0
anchor_right = 0.5
anchor_bottom = 1.0
margin_left = 50.0
margin_top = -70.0
margin_right = 115.0
margin_bottom = -10.0
focus_mode = 0
enabled_focus_mode = 0
text = ">"

[node name="Left_Rotation" type="Button" parent="Navigation/Display"]
anchor_left = 0.5
anchor_top = 1.0
anchor_right = 0.5
anchor_bottom = 1.0
margin_left = -115.0
margin_top = -70.0
margin_right = -50.0
margin_bottom = -10.0
focus_mode = 0
enabled_focus_mode = 0
text = "<"

[node name="Label" type="Label" parent="Navigation/Display"]
anchor_left = 0.5
anchor_right = 0.5
margin_left = -115.0
margin_top = 27.0
margin_right = 115.0
margin_bottom = 41.0
text = "Navigation"
align = 1
valign = 1
[connection signal="pressed" from="Parameters/Parameter_Button" to="." method="_on_Parameter_Button_pressed"]
[connection signal="pressed" from="Parameters/Display/Visualize_Grid/Visualize_Grid_CheckBox" to="." method="_on_Visualize_Grid_CheckBox_pressed"]
[connection signal="pressed" from="Parameters/Display/Bake_Button" to="." method="_on_Bake_Button_pressed"]
[connection signal="pressed" from="Parameters/Display/Spawn_Seeker" to="." method="_on_Spawn_Seeker_pressed"]
[connection signal="pressed" from="Parameters/Display/Clear_Seekers" to="." method="_on_Clear_Seekers_pressed"]
[connection signal="pressed" from="Parameters/Display/Visualize_Path/Visualize_Path_CheckBox" to="." method="_on_Visualize_Path_CheckBox_pressed"]
[connection signal="pressed" from="Parameters/Display/Track_Button" to="." method="_on_Track_Button_pressed"]
[connection signal="pressed" from="Navigation/Navigation_Button" to="." method="_on_Navigation_Button_pressed"]
[connection signal="pressed" from="Navigation/Display/Down_Rotation" to="." method="_on_Down_Rotation_pressed"]
[connection signal="pressed" from="Navigation/Display/Up_Rotation" to="." method="_on_Up_Rotation_pressed"]
[connection signal="pressed" from="Navigation/Display/Right_Rotation" to="." method="_on_Right_Rotation_pressed"]
[connection signal="pressed" from="Navigation/Display/Left_Rotation" to="." method="_on_Left_Rotation_pressed"]
          [gd_scene load_steps=7 format=2]

[ext_resource path="res://scripts/Seeker.gd" type="Script" id=1]

[sub_resource type="SphereShape" id=1]
radius = 2.0

[sub_resource type="SphereMesh" id=2]

[sub_resource type="SpatialMaterial" id=3]
albedo_color = Color( 0, 1, 0.952941, 1 )

[sub_resource type="PrismMesh" id=4]
size = Vector3( 1.5, 1, 0.25 )

[sub_resource type="SpatialMaterial" id=5]
albedo_color = Color( 0.643137, 0.643137, 0.643137, 1 )

[node name="Seeker" type="KinematicBody" groups=[
"seekers",
]]
script = ExtResource( 1 )
move_speed = 4.0
stopping_distance = 3.0

[node name="CollisionShape" type="CollisionShape" parent="."]
shape = SubResource( 1 )

[node name="Body" type="MeshInstance" parent="."]
mesh = SubResource( 2 )
material/0 = SubResource( 3 )

[node name="Direction_Indicator" type="MeshInstance" parent="Body"]
transform = Transform( 1, 0, 0, 0, -4.37114e-008, 1, 0, -1, -4.37114e-008, 0, 0, -1 )
mesh = SubResource( 4 )
material/0 = SubResource( 5 )

[node name="Point_Debug" type="ImmediateGeometry" parent="."]
transform = Transform( -4.37114e-008, 0, -1, 0, 1, 0, 1, 0, -4.37114e-008, 0, 0, 0 )

[node name="Path_Debug" type="ImmediateGeometry" parent="."]
          [gd_scene load_steps=4 format=2]

[sub_resource type="SphereMesh" id=1]

[sub_resource type="SpatialMaterial" id=2]
albedo_color = Color( 1, 0.215686, 0.215686, 1 )

[sub_resource type="SphereShape" id=3]

[node name="Target" type="KinematicBody"]

[node name="MeshInstance" type="MeshInstance" parent="."]
mesh = SubResource( 1 )
material/0 = SubResource( 2 )

[node name="CollisionShape" type="CollisionShape" parent="."]
shape = SubResource( 3 )
disabled = true
               [gd_scene load_steps=10 format=2]

[sub_resource type="CubeMesh" id=1]
size = Vector3( 50, 1, 50 )

[sub_resource type="SpatialMaterial" id=2]
albedo_color = Color( 0.0117647, 0.541176, 0.133333, 1 )

[sub_resource type="ConvexPolygonShape" id=3]
points = PoolVector3Array( -25, 0.5, 25, 25, 0.5, -25, 25, 0.5, 25, -25, 0.5, -25, -25, -0.5, 25, 25, -0.5, -25, 25, -0.5, 25, -25, -0.5, -25, 25, 0.5, 25, -25, 0.5, -25, 25, 0.5, -25, -25, 0.5, 25, 25, -0.5, 25, -25, -0.5, -25, 25, -0.5, -25, -25, -0.5, 25, 25, 0.5, 25, -25, -0.5, 25, -25, 0.5, 25, 25, -0.5, 25, 25, 0.5, -25, -25, -0.5, -25, -25, 0.5, -25, 25, -0.5, -25 )

[sub_resource type="CubeMesh" id=4]

[sub_resource type="SpatialMaterial" id=5]
albedo_color = Color( 0.34902, 0.34902, 0.34902, 1 )

[sub_resource type="ConvexPolygonShape" id=6]
points = PoolVector3Array( -1, 1, 1, 1, 1, -1, 1, 1, 1, -1, 1, -1, -1, -1, 1, 1, -1, -1, 1, -1, 1, -1, -1, -1, 1, 1, 1, -1, 1, -1, 1, 1, -1, -1, 1, 1, 1, -1, 1, -1, -1, -1, 1, -1, -1, -1, -1, 1, 1, 1, 1, -1, -1, 1, -1, 1, 1, 1, -1, 1, 1, 1, -1, -1, -1, -1, -1, 1, -1, 1, -1, -1 )

[sub_resource type="CubeMesh" id=7]
size = Vector3( 1, 0.5, 1 )

[sub_resource type="SpatialMaterial" id=8]
albedo_color = Color( 0.505882, 0.262745, 0, 1 )

[sub_resource type="ConvexPolygonShape" id=9]
points = PoolVector3Array( -0.5, 0.25, 0.5, 0.5, 0.25, -0.5, 0.5, 0.25, 0.5, -0.5, 0.25, -0.5, -0.5, -0.25, 0.5, 0.5, -0.25, -0.5, 0.5, -0.25, 0.5, -0.5, -0.25, -0.5, 0.5, 0.25, 0.5, -0.5, 0.25, -0.5, 0.5, 0.25, -0.5, -0.5, 0.25, 0.5, 0.5, -0.25, 0.5, -0.5, -0.25, -0.5, 0.5, -0.25, -0.5, -0.5, -0.25, 0.5, 0.5, 0.25, 0.5, -0.5, -0.25, 0.5, -0.5, 0.25, 0.5, 0.5, -0.25, 0.5, 0.5, 0.25, -0.5, -0.5, -0.25, -0.5, -0.5, 0.25, -0.5, 0.5, -0.25, -0.5 )

[node name="World" type="Spatial"]

[node name="Grass" type="MeshInstance" parent="."]
mesh = SubResource( 1 )
material/0 = SubResource( 2 )

[node name="StaticBody" type="StaticBody" parent="Grass"]
editor/display_folded = true
collision_layer = 1280

[node name="CollisionShape" type="CollisionShape" parent="Grass/StaticBody"]
shape = SubResource( 3 )

[node name="Obstacles" type="Spatial" parent="."]

[node name="Rock_1" type="MeshInstance" parent="Obstacles"]
transform = Transform( 1.71257, 0, 1.46013, 0, 2.12504, 0, -1.71257, 0, 1.46013, -16.6858, 2.42098, -15.6126 )
mesh = SubResource( 4 )
material/0 = SubResource( 5 )

[node name="StaticBody" type="StaticBody" parent="Obstacles/Rock_1"]
collision_layer = 128

[node name="CollisionShape" type="CollisionShape" parent="Obstacles/Rock_1/StaticBody"]
shape = SubResource( 6 )

[node name="Rock_2" type="MeshInstance" parent="Obstacles"]
transform = Transform( 4.76534, 0, 0, 0, 2.12504, 0, 0, 0, 3.88683, 14.063, 2.42098, 12.0901 )
mesh = SubResource( 4 )
material/0 = SubResource( 5 )

[node name="StaticBody" type="StaticBody" parent="Obstacles/Rock_2"]
collision_layer = 128

[node name="CollisionShape" type="CollisionShape" parent="Obstacles/Rock_2/StaticBody"]
shape = SubResource( 6 )

[node name="Rock_3" type="MeshInstance" parent="Obstacles"]
transform = Transform( 2.1444, 0, 0, 0, 2.12504, 0, 0, 0, 2.36894, 9.06304, 0.420984, 16.2119 )
mesh = SubResource( 4 )
material/0 = SubResource( 5 )

[node name="StaticBody" type="StaticBody" parent="Obstacles/Rock_3"]
collision_layer = 128

[node name="CollisionShape" type="CollisionShape" parent="Obstacles/Rock_3/StaticBody"]
shape = SubResource( 6 )

[node name="Rock_4" type="MeshInstance" parent="Obstacles"]
transform = Transform( 3.96715, 0, 0, 0, 2.97506, 0, 0, 0, 3.55341, -10.4422, 2.42098, 12.5596 )
mesh = SubResource( 4 )
material/0 = SubResource( 5 )

[node name="StaticBody" type="StaticBody" parent="Obstacles/Rock_4"]
collision_layer = 128

[node name="CollisionShape" type="CollisionShape" parent="Obstacles/Rock_4/StaticBody"]
shape = SubResource( 6 )

[node name="Rock_5" type="MeshInstance" parent="Obstacles"]
transform = Transform( 4.51521, 0, 0, 0, 2.97506, 0, 0, 0, 3.55341, 2.5723, 2.42098, -3.89553 )
mesh = SubResource( 4 )
material/0 = SubResource( 5 )

[node name="StaticBody" type="StaticBody" parent="Obstacles/Rock_5"]
collision_layer = 128

[node name="CollisionShape" type="CollisionShape" parent="Obstacles/Rock_5/StaticBody"]
shape = SubResource( 6 )

[node name="Rock_6" type="MeshInstance" parent="Obstacles"]
transform = Transform( 4.24291, 0, -1.21534, 0, 2.97506, 0, 1.54429, 0, 3.33912, 15.0408, 2.42098, -17.5742 )
mesh = SubResource( 4 )
material/0 = SubResource( 5 )

[node name="StaticBody" type="StaticBody" parent="Obstacles/Rock_6"]
collision_layer = 128

[node name="CollisionShape" type="CollisionShape" parent="Obstacles/Rock_6/StaticBody"]
shape = SubResource( 6 )

[node name="Rock_7" type="MeshInstance" parent="Obstacles"]
transform = Transform( 3.45187, 0, -9.11355e-008, 0, 1.58697, 0, 8.40287e-008, 0, 2.50474, 9.12328, 1.19613, -22.7615 )
mesh = SubResource( 4 )
material/0 = SubResource( 5 )

[node name="StaticBody" type="StaticBody" parent="Obstacles/Rock_7"]
collision_layer = 128

[node name="CollisionShape" type="CollisionShape" parent="Obstacles/Rock_7/StaticBody"]
shape = SubResource( 6 )

[node name="Roads" type="Spatial" parent="."]

[node name="Road_1" type="MeshInstance" parent="Roads"]
transform = Transform( 6.162, 0, 0, 0, 1, 0, 0, 0, 19.5404, 2.5831, 0.358764, 15.316 )
mesh = SubResource( 7 )
material/0 = SubResource( 8 )

[node name="StaticBody" type="StaticBody" parent="Roads/Road_1"]
collision_layer = 768

[node name="CollisionShape" type="CollisionShape" parent="Roads/Road_1/StaticBody"]
shape = SubResource( 9 )

[node name="Road_2" type="MeshInstance" parent="Roads"]
transform = Transform( -2.02012e-007, 0, 20.4187, 0, 1, 0, -6.162, 0, -1.19004e-006, 2.5831, 0.358764, 2.63609 )
mesh = SubResource( 7 )
material/0 = SubResource( 8 )

[node name="StaticBody" type="StaticBody" parent="Roads/Road_2"]
collision_layer = 768

[node name="CollisionShape" type="CollisionShape" parent="Roads/Road_2/StaticBody"]
shape = SubResource( 9 )

[node name="Road_5" type="MeshInstance" parent="Roads"]
transform = Transform( -2.02012e-007, 0, 20.4187, 0, 1, 0, -6.162, 0, -1.19004e-006, 2.5831, 0.358764, -10.4573 )
mesh = SubResource( 7 )
material/0 = SubResource( 8 )

[node name="StaticBody" type="StaticBody" parent="Roads/Road_5"]
collision_layer = 768

[node name="CollisionShape" type="CollisionShape" parent="Roads/Road_5/StaticBody"]
shape = SubResource( 9 )

[node name="Road_6" type="MeshInstance" parent="Roads"]
transform = Transform( 3.53438, 0, 16.7261, 0, 1, 0, -5.04762, 0, 11.7117, -3.16143, 0.358764, -16.7759 )
mesh = SubResource( 7 )
material/0 = SubResource( 8 )

[node name="StaticBody" type="StaticBody" parent="Roads/Road_6"]
collision_layer = 768

[node name="CollisionShape" type="CollisionShape" parent="Roads/Road_6/StaticBody"]
shape = SubResource( 9 )

[node name="Road_7" type="MeshInstance" parent="Roads"]
transform = Transform( 0, 0, 15.568, 0, 1, 0, -6.162, 0, -9.53674e-007, -17.2814, 0.358764, -22.0921 )
mesh = SubResource( 7 )
material/0 = SubResource( 8 )

[node name="StaticBody" type="StaticBody" parent="Roads/Road_7"]
collision_layer = 768

[node name="CollisionShape" type="CollisionShape" parent="Roads/Road_7/StaticBody"]
shape = SubResource( 9 )

[node name="Road_3" type="MeshInstance" parent="Roads"]
transform = Transform( 6.162, 0, 2.97511e-007, 0, 1, 0, 2.40731e-008, 0, 7.2997, -4.55537, 0.358764, -4 )
mesh = SubResource( 7 )
material/0 = SubResource( 8 )

[node name="StaticBody" type="StaticBody" parent="Roads/Road_3"]
collision_layer = 768

[node name="CollisionShape" type="CollisionShape" parent="Roads/Road_3/StaticBody"]
shape = SubResource( 9 )

[node name="Road_4" type="MeshInstance" parent="Roads"]
transform = Transform( 6.162, 0, 2.97511e-007, 0, 1, 0, 2.40731e-008, 0, 7.2997, 9.71567, 0.358764, -4 )
mesh = SubResource( 7 )
material/0 = SubResource( 8 )

[node name="StaticBody" type="StaticBody" parent="Roads/Road_4"]
collision_layer = 768

[node name="CollisionShape" type="CollisionShape" parent="Roads/Road_4/StaticBody"]
shape = SubResource( 9 )
    [gd_resource type="Environment" load_steps=2 format=2]

[sub_resource type="ProceduralSky" id=1]

[resource]
background_mode = 2
background_sky = SubResource( 1 )
             GDSC   ?      W   T     ���Ӷ���   ����������Ӷ   �����Ķ�   ���������޶�   ����������������������Ŷ   ����¶��   ������ڶ   �����ڶ�   �����¶�   ������������϶��   �����׶�   �����׶�   �������Ѷ���   �������������Ӷ�   �����϶�   �������Ӷ���   ���������������¶���   ����¶��   ��������������������ض��   ������Ҷ   �����������ζ���   �������۶���   �����������������ض�   �������ض���   �����ٶ�   �����������������ڶ�   ����������Ӷ   ��������Ҷ��   �����������������Ӷ�   �����¶�   ������������϶��   ����������������������ض   ����������������Ҷ��   ������������׶��   ���������������۶���   �����ض�   �����������¶���   ����Ӷ��   ����Ҷ��   �����������ض���   �������������Ѷ�   �������������޶�   ������������Ŷ��   ���������Ӷ�   �����������Ķ���   �����������Ŷ���   ���������ζ�   ��������������¶   ����¶��   �������؅�   ��������Ҷ��   ���������Ķ�   �������Ӷ���   ����ƶ��   ��������Ҷ��   ���������������������ض�   ���������Ӷ�   ��������޶��   ��������ض��   �������ζ���   �������϶���   ���������������Ŷ���   ζ��   �     
                Pivot         Pivot/Swivel      Camera        Target              AStar               ui_down       down      ui_up         up        ui_left       left      ui_right      right               �>      Seekers       Spawn_Points   -                            
                                 	       
   %      &      +      ,      1      2      9      @      A      G      N      U      ^      e      f      m      }      �      �      �      �      �       �   !   �   "   �   #   �   $   �   %   �   &   �   '   �   (   �   )   �   *     +     ,     -   "  .   &  /   *  0   7  1   >  2   E  3   H  4   U  5   [  6   a  7   b  8   h  9   u  :   {  ;   |  <   �  =   �  >   �  ?   �  @   �  A   �  B   �  C   �  D   �  E   �  F   �  G   �  H   �  I   �  J   �  K   �  L     M     N     O     P     Q   #  R   &  S   0  T   3  U   >  V   R  W   3YY8P�  Q;�  YY:�  V�  YY:�  V�  �  YY;�  V�  Y;�  V�  YY;�  V�	  YY;�
  V�  YY;�  V�  �  Y;�  V�  �  YY0�  PQV�  �  �  P�  Q�  �  �  P�  Q�  �
  �  T�  P�  Q�  �  �  P�  QYY0�  P�  QV�  &�  4�  �  T�  �  T�  �  V�  ;�  V�  �
  T�  P�  T�  Q�  ;�  V�  �
  T�  P�  T�  Q�  �  ;�  �  P�  QT�  PQT�  �  ;�  �  T�  P�  R�  RLMR�	  Q�  &�  V�  �  P�  T�  Q�  &�  T�   P�
  QV�  �!  P�  Q�  &�  T�   P�  QV�  �!  P�  Q�  &�  T�   P�  QV�  �!  P�  Q�  &�  T�   P�  QV�  �!  P�  Q�  Y0�  P�  V�  QV�  �  T�"  T�#  �  �  P�  R�  R�  QYY0�$  P�%  V�  QV�  �  �%  �  &�  V�  )�&  �  P�  QT�'  PQV�  &�&  T�  V�  �&  T�(  P�  Q�  (V�  )�&  �  P�  QT�'  PQV�  �&  T�  �  �  �&  T�)  �  YY0�*  PQV�  )�&  �  P�  QT�'  PQV�  �&  T�+  PQYY0�,  PQV�  ;�-  �  P�  Q�  ;�.  �   PQ�-  T�/  PQ�  ;�0  V�1  �-  T�2  P�.  Q�  ;�3  �  T�4  PQ�  �3  T�5  P�  P�  QQ�  �  P�  QT�6  P�3  Q�  �3  T�"  T�#  �0  T�"  T�#  �  &�  V�  �3  T�(  P�  QYY0�7  P�8  V�  QV�  �  �8  �  )�&  �  P�  QT�'  PQV�  �&  T�9  �  YY0�!  P�:  V�  QV�  /P�:  QV�  �  V�  �  T�;  P�%  P�  QQ�  �  V�  �  T�;  P�%  P�  QQ�  �  V�  �  T�<  P�%  P�  QQ�  �  V�  �  T�<  P�%  P�  QQ�  �  T�=  T�>  �/  P�  T�=  T�>  R�  R�  QY`        GDSC   !     g  �     ������ڶ   �������������ݶ�   ������������Ӷ��   ���������Ŷ�   �����������Ŷ���   ��������������Ӷ   �����������������Ҷ�   ���������������Ŷ���   ����������Ӷ   ����   �������������������Ķ���   �����������������Ķ�   �������ƶ���   ���Ҷ���   ��������Ӷ��   �������ƶ���   ���������¶�   �嶶   �������������ն�   ����������������Ҷ��   ������������Ӷ��   �������������Ҷ�   �������Ӷ���   ��������������¶   ����Ҷ��   �����������ض���   ���������Ӷ�   ��������   ���Ҷ���   ζ��   ���Ӷ���   ϶��   ����Ķ��   ����Ӷ��   ���������������϶���   ����ݶ��   ���������ض�   ���������ζ�   �������Ӷ���   ��Ҷ   ����������������������Ķ   ������������ض��   �������ض���   ������������Ӷ��   �����������Ӷ���   �������ڶ���   ��������������ڶ   ���޶���   ���������޶�   �����Ŷ�   �����¶�   �������޶���   �����������Ķ���   ��������Ҷ��   �������������������ڶ���   ���������������۶���   �����ض�   �����������޶���   �������Ŷ���   ��������Ŷ��   �������ݶ���   ������ж   ����������¶   ��������޶��   ��������Ŷ��   �����������Ŷ���   ��������Ӷ��   �������Ӷ���   �����������������¶�   ���������Ӷ�   ������¶   ���ƶ���   �����������Ӷ���   ��������¶��   �����Ҷ�   ����������Ӷ   �����������¶���   �������Ķ���   ������������Ŷ��   ��Ŷ   ��������������������Ķ��   ����¶��   �����������Ӷ���   ����¶��   �����¶�   ����������۶   �����������޶���   ������Ӷ   ���������Ŷ�   ������������޶��   �����¶�   ������������Ҷ��   ��������   ߶��   ����������������   �����   ����ﶶ�   �涶   ��������   ��������   �����   ����ﶶ�   �����������������Ӷ�   ����������Ѷ   ������������������Ҷ   �����Ҷ�   �����������������ζ�   ����ζ��   ����¶��   �����������Ѷ���   �����������¶���   ���ݶ���   �����ݶ�   ������������Ҷ��   ����������������Ҷ��   ����Ķ��   ����¶��   ����������������Ӷ��   ���Ŷ���   �����������������ƶ�   �������������޶�   ������������Ŷ��   ��������¶��   ������Ҷ   ��������ն��   ��������¶��   �����¶�   ���Ҷ���   ��������ݶ��   �����������¶���   ������������¶��   �����������Ķ���   ���������   ��������ﶶ�   �����������������������϶���   �����������ݶ���   �����������������������϶���   ����������������Ŷ��   �������������϶�   ������ض   ����������ݶ   ����������Ҷ   ������������������ζ   ��������������¶   ����ⶶ�   �������   �����������Ӷ���   ����������������������Ӷ   ��������Ҷ��   �����������������Ӷ�   �����������Ӷ���   ��������������������������Ŷ   ����Ӷ��   ����������Ӷ   ��������Ӷ��   �������������ݶ�   ����������������¶��   ����������������¶��   ���������¶�   ��������۶��   �����¶�   ��������������Ӷ   ������Ŷ   ������������϶��   ��������   ����Ķ��   �������Ӷ���   �������Ķ���   ��������������Ķ   ���������������ƶ���   ����Ӷ��   ���Ӷ���   ���Ӷ���   ��������Ŷ��   �����   �����ﶶ   ��������Ӷ��   ���������   �������ﶶ��   ̶��   ��������������Ŷ   ��¶   ��������Ӷ��   ����������Ӷ   �������������Ŷ�   ������������������������Ŷ��   ����������������������Ŷ   �������   ����������ζ   �������ζ���   �������   ��������������϶   �����ض�   ����   �����ζ�   ��������   ܶ��   ����ݶ��   �������϶���   ���Ӷ���   ������������������   �������¶���   ����������¶   �������������釶   �������������鄶   ��������������������Ķ��   �����������Ӷ���   ������������Ӷ��   �����������������Ӷ�   �ζ�   �϶�   �������Ӷ���   ƶ��   ���������������Ӷ���   ������������������¶   �������������ƶ�   ���������   ���������ﶶ   ����������ٶ   ��������Ӷ��   �������϶���   ����������������϶��   �����޶�   ������Ķ   ���������Ҷ�   ���������Ķ�   ���������ζ�   ���������޶�   ���������Ŷ�   �������������Ŷ�   ��������������ζ   ������������ζ��   ������¶   ��������Ŷ��   ���������޶�   ��������¶��   ������������¶��   �����Ӷ�   ���������¶�   ������������   �����������¶���   �����������������Ŷ�   ����������������¶��   ��������޶��   ���������������¶���   ����   ���������Ѷ�   ����������Ѷ   ����Ķ��   ������ڶ   ����������������Ӷ��   ����ض��   ���޶���   �������������������涶��   �����Ŷ�   ��Ҷ   ��������Ӷ��   ��������Ŷ��   �����   �����ﶶ   ����������������϶��   ����¶��   ���������ٶ�   ���������ض�   �������������¶�   ����Ŷ��   ���������������¶���   ����������Ӷ   ���۶���   ��������۶��   ��������۶��   ��������Ҷ��   ������ƶ   ��������۶��   ��������ζ��   ��������ض��   ����Ӷ��   ���Ҷ���   �������������¶�   ��������������¶   ��������ζ��   ���ƶ���   ����������ζ   ��������   ��������   ���������ζ�   ����۶��   ���������ζ�   ����Ķ��                      
                             Bake Time:         msec          	   Node_Grid                           path_data_defered         path_data_execute         path_data_clean_up        @   2      d                    �?                                           &      '   	   0   
   1      :      ;      <      C      D      N      O      Y      Z      [      \      a      f      g      h      i      j      q      r      x      �       �   !   �   "   �   #   �   $   �   %   �   &   �   '   �   (   �   )   �   *   �   +   �   ,   �   -   �   .   �   /   �   0   �   1   �   2   �   3   �   4   �   5   �   6     7     8   	  9     :     ;   %  <   (  =   /  >   9  ?   F  @   O  A   [  B   ]  C   k  D   �  E   �  F   �  G   �  H   �  I   �  J   �  K   �  L   �  M   �  N   �  O   �  P      Q   
  R     S     T     U   -  V   =  W   >  X   K  Y   S  Z   Z  [   f  \   r  ]   s  ^   t  _   ~  `     a   �  b   �  c   �  d   �  e   �  f   �  g   �  h   �  i   �  j   �  k   �  l   �  m   �  n   �  o   �  p   �  q   
  r     s     t   !  u   "  v   ,  w   3  x   6  y   =  z   A  {   J  |   K  }   R  ~   S     T  �   c  �   k  �   r  �   s  �   y  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �      �     �     �     �     �   *  �   =  �   C  �   P  �   S  �   `  �   a  �   b  �   f  �   n  �   s  �   t  �   y  �   ~  �     �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �     �     �     �     �     �   $  �   %  �   .  �   4  �   5  �   ?  �   @  �   E  �   O  �   S  �   W  �   X  �   Y  �   ]  �   b  �   g  �   l  �   m  �   ~  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   	  �     �     �     �   !  �   '  �   -  �   ;  �   I  �   R  �   \  �   b  �   m  �   x  �   |  �   }  �   �  �   �     �    �    �    �    �    �    �    �    �  	  �  
  �                8    @    J    W    ^    _    �    �    �    �    �    �    �    �    �    �    �    �     �  !  �  "  �  #  �  $  �  %  �  &  �  '  �  (  �  )    *    +    ,  *  -  4  .  6  /  7  0  B  1  M  2  _  3  k  4  x  5  {  6  |  7  �  8  �  9  �  :  �  ;  �  <  �  =  �  >  	  ?  	  @  	  A  	  B  	  C  &	  D  )	  E  *	  F  5	  G  @	  H  P	  I  Q	  J  _	  K  m	  L  n	  M  w	  N  �	  O  �	  P  �	  Q  �	  R  �	  S  �	  T  �	  U  �	  V  �	  W  �	  X  �	  Y  �	  Z  �	  [  
  \  
  ]  
  ^  &
  _  7
  `  G
  a  H
  b  b
  c  c
  d  o
  e  p
  f  {
  g  �
  h  �
  i  �
  j  �
  k  �
  l  �
  m  �
  n  �
  o  �
  p  �
  q  �
  r    s    t    u    v    w  !  x  '  y  .  z  5  {  8  |  9  }  :  ~  >    C  �  H  �  I  �  V  �  \  �  b  �  c  �  d  �  h  �  t  �  u  �  z  �    �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �    �    �    �    �    �    �  C  �  D  �  O  �  W  �  X  �  c  �  r  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �     �    �    �    �    �  0  �  6  �  :  �  E  �  O  �  P  �  Z  �  g  �  t  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �    �    �    �  !  �  '  �  0  �  8  �  >  �  G  �  M  �  T  �  Z  �  [  �  \  �  `  �  e  �  j  �  o  �  t  �  y  �  z  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �     �    �    �                 
          	    
      #    '    .    /    8    D    M    W    c    j    n    s    t    |    �    �    �    �    �    �    �     �  !  �  "  �  #  �  $  �  %  �  &  �  '  �  (  �  )  �  *  �  +  �  ,  �  -  �  .  �  /    0    1    2    3    4  !  5  -  6  .  7  7  8  =  9  L  :  [  ;  b  <  j  =  n  >  v  ?  �  @  �  A  �  B  �  C  �  D  �  E  �  F  �  G  �  H  �  I  �  J  �  K  �  L  �  M  �  N  �  O  �  P     Q    R    S    T     U  )  V  1  W  7  X  8  Y  <  Z  A  [  F  \  G  ]  L  ^  M  _  Z  `  `  a  f  b  n  c  o  d  x  e  �  f  �  g  3YY8P�  Q;�  Y8P�  Q;�  Y8P�  Q;�  �  YY8P�  Q;�  �  YY8P�  Q;�  �  YY8P�  Q;�  �  YYY;�  V�  L�  �  �  T�	  P�  R�  QR�  �  �  T�	  P�  R�  QM�  �  YY;�
  V�  Y;�  V�  YYYYY;�  V�  �  YY0�  PQV�  ;�  �  T�  PQ�  �  �  T�	  PR�  R�  R�  R�  Q�  �  �
  �  T�	  PQ�  �  �  PQY�  &�  V�  �  PQ�  �  �  �7  P�  T�  PQ�  Q�  YY0�  PQX�  V�  .�  YY0�  PQV�  &�  �	  V�  .�  &�  P�
  QT�  PQ�  V�  �  PQ�  (V�  �  PQYY0�  PQV�  )�  �  P�
  QT�  PQV�  �  T�  PQYY0�  PQV�  &�  P�
  QT�  PQ�  V�  �  P�
  QT�  PQ�  (V�  ;�  �  T�  �  )�  �  T�  PQV�  )�  �  L�  MT�  PQV�  ;�   V�  �  T�!  �  &�  L�  ML�  M�	  V�  ,�  &�  L�  ML�  MT�"  �  V�  �   �  P�  T�!  R�  T�#  R�  P�  T�$  R�  T�%  R�  L�  ML�  MT�"  QQ�  �  �   �   &�  L�  ML�  MT�&  (�  T�'  �  �(  P�  L�  ML�  MT�)  �  P�  R�  R�  QR�   QYY0�(  P�*  V�  R�   V�  QV�  ;�+  �,  T�	  PQ�  ;�-  �.  T�	  PQ�  ;�/  �0  T�	  PQ�  �/  T�1  �  �  �  �/  T�2  �/  T�1  �  �  �+  T�3  P�/  Q�  �-  T�4  �   �  �  P�
  QT�5  P�+  Q�  �+  T�6  P�  R�-  Q�  �+  T�7  T�8  �*  YY0�9  P�:  V�  R�;  V�  R�<  V�=  QV�  �
  T�9  P�>  T�	  P�:  R�;  R�<  QQYY0�?  P�:  V�  R�;  V�  QV�  ;�@  V�  LM�  ;�A  V�  �  �  ;�B  V�C  �  T�D  P�:  Q�  ;�E  V�C  �  T�D  P�;  Q�  �  �  &�B  T�&  �E  T�&  V�  �  ;�F  V�G  �G  T�	  P�  T�H  PQQ�  ;�I  V�  LM�  �F  T�J  P�B  Q�  �  *�F  T�  PQ�  V�  ;�K  V�C  �F  T�L  PQ�  �I  T�J  P�K  Q�  �  &�K  �E  V�  �A  �  �  +�  �  )�M  �  T�N  P�K  QV�  &�M  T�&  �I  T�O  P�M  QV�  ,�  ;�P  V�  P�K  T�Q  �R  P�K  R�M  QQ�M  T�"  �  &�F  T�O  P�M  Q�P  	�M  T�Q  V�  �M  T�Q  �P  �  �M  T�S  �R  P�M  R�E  Q�  �M  T�T  �K  �  �  &�F  T�O  P�M  QV�  �F  T�J  P�M  Q�  (V�  �F  T�U  P�M  Q�  &�A  V�  �@  �V  P�B  R�E  Q�  �  .L�@  R�A  M�  YY0�V  P�B  V�C  R�W  V�C  QX�  V�  ;�X  V�  LM�  ;�K  V�C  �W  �  �  *�K  �B  V�  �X  T�J  P�K  Q�  �K  �K  T�T  �  �  ;�@  �Y  P�X  Q�  �@  T�Z  PQ�  .�@  YY0�Y  P�X  V�  QX�  V�  ;�@  V�  LM�  ;�[  V�  �  T�\  �  )�]  �D  P�X  T�  PQQV�  ;�^  V�  �  P�X  L�]  �  MT�_  �X  L�]  MT�_  R�X  L�]  �  MT�`  �X  L�]  MT�`  Q�  &�^  �[  V�  �@  T�J  P�X  L�]  MT�)  �  T�a  Q�  �[  �^  �  .�@  �  Y0�R  P�b  V�C  R�c  V�C  QX�  V�  ;�d  V�  �  P�  P�b  T�_  �c  T�_  QQ�  ;�e  V�  �  P�  P�b  T�`  �c  T�`  QQ�  &�d  �e  V�  .�  �e  �  P�d  �e  Q�  (V�  .�  �d  �  P�e  �d  QYYY1�  V�  ;�f  V�  LM�  ;�g  V�  �  �  ;�h  V�i  �  ;�j  V�k  �  �  0�l  P�m  V�  QV�  T�g  �m  �  �  0�9  P�n  V�>  QV�  &�h  �	  V�  �h  �i  T�	  PQ�  �j  �k  T�	  PQ�  �j  T�o  PQ�  �f  T�J  P�n  Q�  �j  T�p  PQ�  &�f  T�  PQ�  V�  �  �q  P�  Q�  �  0�r  PQV�  ;�s  �h  T�t  PR�  R�f  L�  MQ�  &�s  �  V�  �8  P�s  Q�  �  0�u  P�v  QV�  �q  P�  Q�  .�v  �  �  0�w  PQV�  ;�v  �h  T�x  PQ�  ;�y  �g  T�?  P�v  T�z  R�v  T�{  Q�  �  �v  T�<  T�|  P�y  Q�  �f  T�}  PQ�  �  &�f  T�  PQ�  V�  �  �q  P�  Q�  '�f  T�  PQ�  V�  �h  �	  �  �j  �	  YYY1�>  V�  ;�z  V�  �  ;�{  V�  �  ;�<  V�=  Y�  0�l  P�~  V�  R�  V�  R��  V�=  QV�  T�z  �~  �  T�{  �  �  T�<  ��  YYY1�  V�  ;�T  V�  �  ;��  V�  �  ;��  V�  �  ;�  V�  �  ;�  V�  �  ;�  V�  �  �  ;��  V�  �  ;��  V�  �  ;��  V�  �  �  �  ;��  V�  �  �  �  ;�%  V�  �  ;�$  V�  �  �  ;�  V�  �  �  ;��  V�  LM�  ;��  V�  NO�  �  0�l  P�T  V�  R��  V�  R�  V�  R�  V�  R��  V�  QV�  T�T  �T  �  T��  ��  �  T�  �  �  T�  �  �  T�  ��  �  ��  �  �  �  ��  �  P�  P�  T�  ��  QQ�  ��  �  P�  P�  T�  ��  QQ�  �$  �  L�  MT��  �  �%  �  L�  MT��  �  )��  �  V�  ��  T�J  P��  T��  �  Q�  ��  L��  T��  M��  T��  �  ��  PQ�  �  0�H  PQV�  .��  ��  �  �  0��  PQV�  �  ��  P��  R��  R�	  Q�  ;��  V�  ��  P�  T��  �  P�  T�  �  QQP�  T��  �  P�  T�  �  QQ�  ;��  V��  �T  T��  PQT��  �  ;��  V��  ��  T�	  PQ�  ;��  V��  ��  T�	  PQ�  ��  T�1  �  �  ��  T��  P��  Q�  ��  T��  ��  PL��  MQ�  �  ;��  ��  P��  Q�  )�  �D  P��  QV�  )�  �D  P��  QV�  ;��  V�  ��  P�  T��  P�  ��  �  QQP�  T��  P�  ��  �  QQ�  ��  T��  T�8  ��  �  ;��  ��  T��  P��  Q�  ;�&  V�  ��  T�  PQ�  �  ;�"  V�  �  Y�  ;��  ��  T��  P��  P�  T�a  �  QR��  P�  T��  �  QRLMR��  Q�  &��  V�  ;��  ��  P��  T��  T��  �  R�  Q�  �  &��  T�O  P��  �  QV�  �"  ��  L��  �  MYYYY�  &�&  V�  �"  ��  �  �  �  L�  ML�  M�C  T�	  P�&  R��  R�  R�  R�"  Q�  �  &�T  T�  V�  ��  P�T  T�  Q�  �  0��  P��  V�  R��  V�  QX�  V�  .�  P�  P��  Q�  P��  QQ�  �  0�N  P��  V�C  QX�  V�  ;��  V�  LM�  )�  �D  P�  R�  R�  QV�  )�  �D  P�  R�  R�  QV�  &�  �  �  �  V�  ,�  �  ;��  V�  ��  T�_  �  �  ;��  V�  ��  T�`  �  �  &��  �  ��  	��  ��  �  ��  	��  V�  &�  L��  ML��  M�	  V�  ��  T�J  P�  L��  ML��  MQ�  .��  �  �  0�D  P�)  V�  QX��  V�  ;��  V�  P�)  T�  P�  T�  �  QQ�  P�  T�  Q�  ;��  V�  P�)  T��  P�  T�  �  QQ�  P�  T�  Q�  ��  �/  P��  R�  R�  Q�  ��  �/  P��  R�  R�  Q�  ;�  V�  �  P�  PP��  �  Q��  QQ�  ;�  V�  �  P�  PP��  �  Q��  QQ�  .�  L�  ML�  M�  �  0��  P��  V�  QX�  V�  ;��  V�  �  �  )��  ��  V�  ��  �  P�  P�  R��  QQ�  .��  �  �  0��  P��  V�  QX=V�  ;��  V�  ��  �  �  �  ;��  V�  �  PP��  �  Q�  Q�  �  ;��  V�  ��  P��  R��  R�  Q�  ;��  V�  ��  P��  R��  R�  Q�  �  )�  �D  P��  QV�  )�  �D  P��  R��  �  �  QV�  ;��  V�  �  P�/  P�  R�  R��  QQYY�  ��  L�  ML�  M�  L��  ML�  MT�"  �  �  �  )�  �D  P�  R��  QV�  ;��  V�  �  P�/  P�  ��  �  R�  R��  QQ�  ;��  V�  �  P�/  P�  ��  R�  R��  �  QQYYY�  ��  L�  ML�  M��  L�  �  ML�  M�  L��  ML�  MT�"  �  L��  ML�  MT�"  �  �  )�  �D  P��  QV�  )�  �D  P��  R��  �  �  QV�  ;��  V�  �  P�/  P�  R�  R��  QQ�  ��  L�  ML�  M��  L�  ML��  M�  �  ;��  V�  �  P�  P��  L�  ML�  M�  P��  ��  QQQY�  �  L�  ML�  MT�"  ��  �  �  )�  �D  P�  R��  QV�  ;��  V�  �  P�/  P�  ��  �  R�  R��  QQ�  ;��  V�  �  P�/  P�  ��  R�  R��  �  QQ�  �  ��  L�  ML�  M��  L�  ML�  �  M��  L�  ML��  M��  L�  ML��  M�  ��  �  P�  P��  L�  ML�  M�  P��  ��  QQQY�  �  L�  ML�  MT�"  ��  �  �  &��  �%  V�  �%  ��  �  &��  	�$  V�  �$  ��  �  �  0��  P��  R��  R��  QX�  V�  ;��  LM�  )�]  ��  V�  ;��  LM�  )��  ��  V�  ��  T�J  P��  Q�  ��  T�J  P��  Q�  .��  YYY1�  V�  ;��  V�  �  ;��  V�  �  �  0�l  P��  V�  R��  V�  QV�  T��  ��  �  T��  ��  YYY1��  V�  :��  V�  �  P�  R�  Q�  �  ;��  V�  �  ;��  V�  �  ;��  V�  �  ;��  V�  �  �  ;��  V�  �  �  ;��  V�  �  �  0�l  P��  V�  R��  V�  QV�  ;��  V�  ��  T�  ��  T�  �  ;��  V�  ��  T�  ��  T�  �  �  &��  �  V�  ��  ��  �  (V�  ��  ��  ��  �  �  &��  �  V�  ��  ��  �  (V�  ��  �  ��  �  �  ��  ��  T�  ��  ��  T�  �  ��  ��  �  ��  ��  �  P�  R��  Q�  �  ��  �  �  ��  ��  P��  Q�  �  0��  P��  V�  QX�  V�  .P��  T�  ��  T�  QP��  T�  ��  T�  QP��  T�  ��  T�  QP��  T�  ��  T�  Q�  �  0��  P��  V�  QX�  V�  .��  P��  Q��  �  �  0��  P��  V�  QX�  V�  ;��  V�  ��  T�  ��  ��  T�  �  ;��  V�  P��  ��  QP��  ��  Q�  ;��  V�  ��  ��  ��  �  .��  T��  P�  P��  R��  QQY�  0��  P��  V��  R��  V�  QX=V�  ;��  V�  �  P�  R�  R��  QT��  PQ�  ;��  V�  �  P��  T�  R�  R��  T�  Q�  T�a  �  ��  T��  P��  ��  ��  �  Q�  ��  T��  P��  ��  ��  �  QYYY1��  V�  ;�T  V�  �  ;��  V�  LM�  ;��  V�  LM�  ;��  V�  �  ;��  V�  �  �  0�l  P��  V�  R�@  V�  R��  V�  R��  V�  R��  V�  R��  V�  QV�  T�T  ��  �  ��  �@  �  ��  T��  P��  T�  PQQ�  ��  ��  T�  PQ�  �  �  ;��  V�  ��  P��  Q�  )�]  �D  P��  T�  PQQV�  ;��  V�  ��  P��  L�]  MQ�  ;��  V�  P��  ��  QT��  PQ�  ;��  V�  ��  &P�]  ��  Q(��  ��  ��  �  ��  L�]  M��  T�	  P��  R��  ��  ��  Q�  ��  ��  �  �  &��  L�  MV�  ��  P��  L�  MR��  L�  MQ�  �  ;��  �  �  )�]  �D  P��  T�  PQ�  R�  R�  QV�  ��  ��  L�]  MT��  P��  L�]  �  MQ�  &��  ��  V�  ��  �]  �  +�  �  0��  P��  V�  QX�  V�  .�  P��  T�  R��  T��  Q�  �  0��  P��  V��  R��  V��  QX=V�  ��  T��  PQ�  ;��  �.  T�	  PQ�  ��  T�4  �  T�'  �  ��  T��  ��  �  ��  T��  P��  T��  Q�  )��  ��  V�  ��  T��  P��  Q�  ��  T��  PQYYY1�C  V�  ;�_  V�  �  ;�`  V�  �  ;�&  V�  �  ;�)  V�  �  ;�"  V�  �  �  ;�Q  V�  �  �  ;�S  V�  �  �  �  ;�T  V�C  �  �  0�l  P�  V�  R� V�  R� V�  R� V�  R� V�  QV�  T�_  � �  T�`  � �  T�&  �  �  T�)  � �  T�"  � Y�  0� PQX�  V�  .�Q  �S  �  �  0� P��  V�C  QV�  ;� V�  ��  T� PQ� PQ�  &� �  V�  .��  T�S  �S  �  (V�  .� YY1�G  V�  ;� V�  �  ;�	 V�  �  ;�
 V�  �  �  0�l  P� V�  QV�  � NO�  �
 �  �  �	 T��  P� Q�  �  0�J  P� V�  QV�  ;� � T�	  P� R�
 Q�  � L� T� M� �  &�
 �	 T�  PQV�  �	 T��  P�  P�
 �  QQ�  �	 L�
 M� �  �
 �  �  � P� Q�  �  0�L  PQX�  V�  ;� V� �	 L�  M�  �
 �  �  �	 L�  M�	 L�
 M�  �	 L�  MT� �  �  � P�	 L�  MQ�  �  �  � T� P� T� Q�  .� T� �  �  0� P� V�  QX� V�  &� T�O  P� T�)  QV�  .� L� T�)  M�  (V�  .�	  �  �  0�U  P� V�  QV�  � P� P� QQ�  �  0�  PQX�  V�  .�
 �  �  0�O  P� V�  QX�  V�  � � P� Q�  &� �	  V�  .�  �  &�  PQ
� T� V�  .�  �  .�	 L� T� MT� � �  �  0� P� V� QV�  *P�  QV�  ;� V�  P� T� �  Q�  �  ;� V�  P� T� �  Q�  �  ;� V�  �  �  &� 	�  PQV�  � � �  &� 	�  PQV�  &�	 L� MT� P�	 L� MQ	�  V�  � � �  �  &� T� P�	 L� MQ	�  V�  � P� R�	 L� MQ�  (V�  .�  (V�  .�  �  0� P� V� QV�  ;� V�  �  PP� T� �  Q�  Q�  *P�  QV�  &� �  � T� P�	 L� MQ�  V�  � P� R�	 L� MQ�  (V�  +�  � �  PP� T� �  Q�  QY�  0� P� V� R� V� QV�  �	 L� T� M� �  �	 L� T� M� �  ;� V�  � T� �  � T� � T� �  � T� � �  �  1� V�  ;� V�  �  ;� V�  �  �  ;� V�  �  �  0�l  P� V�  R� V�  QV�  T� � �  T� � �  T� � T�)  �  �  0� P�  V� QV�  .� T� P�  T� QYY`              GDSC   6   "   s   D     ������ڶ   ����Ķ��   ����������������϶��   �����������������϶�   �����϶�   ���������¶�   �������Ӷ���   �������Ŷ���   ����׶��   ��������������¶   �������Ҷ���    ���������������������������Ҷ���   ������Ӷ   ���Ӷ���   ���¶���   �������Ŷ���   ������������ض��   ��������¶��   �����������¶���   ���Ӷ���   ζ��   ϶��   ��������    ����������������������������Ҷ��   ����������������������Ҷ   ������������Ŷ��   ����������Ӷ   �������������Ҷ�   ��������Ӷ��   ���������Ҷ�   �������ⶶ��   ������������   ���������Ŷ�   �����������Ŷ���   ��������������Ӷ   �����������������Ҷ�   �������ƶ���   ������������Ӷ��   ������������������������Ҷ��   ������������׶��   ����������������������Ҷ   �������������������������Ҷ�   ������������������������Ҷ��   �����������������������Ҷ���   �����������Ķ���   ������������������������Ҷ��   ������������Ŷ��   ����������������Ӷ��$   ����������������������������������Ҷ   ���������������������ض�   �����������������������Ҷ���   �����������¶���   �������Ѷ���$   ����������������������������������Ҷ      AStar         Parameters/Display        Navigation/Display        Seekers              Bake_Button             Track_Button             Parameter_Button      <               >      �         Navigation_Button         ^         v      d              �?      Weights_Control/CheckBox      Kernel_Size/LineEdit      Node_Size/LineEdit     &   Visualize_Grid/Visualize_Grid_CheckBox        Spawn_Seeker      Clear_Seekers      	   Bake_Time         down      up        right         left   &   Visualize_Path/Visualize_Path_CheckBox        Stop Tracking         Start Tracking                           	                           	   %   
   ,      3      4      ;      L      W      b      c      i      o      u      �      �      �      �      �      �      �      �      �      �      �       �   !   �   "   �   #     $     %     &   %  '   &  (   ;  )   >  *   D  +   S  ,   ^  -   g  .   |  /   }  0   �  1   �  2   �  3   �  4   �  5   �  6   �  7   �  8   �  9   �  :   �  ;   �  <   �  =   �  >     ?   
  @     A     B     C     D   (  E   3  F   >  G   I  H   V  I   W  J   ]  K   f  L   g  M   m  N   v  O   w  P   }  Q   �  R   �  S   �  T   �  U   �  V   �  W   �  X   �  Y   �  Z   �  [   �  \   �  ]   �  ^   �  _   �  `   �  a   �  b   �  c   �  d   �  e   �  f   �  g   �  h     i     j     k     l     m   "  n   -  o   .  p   /  q   5  r   B  s   3YY;�  V�  YY;�  VY;�  VYY0�  PQV�  �  �  PQT�  PQ�  �  �  P�  Q�  �  �  P�  QYY0�  P�  QV�  &�  PQT�  P�  QT�	  PQ�  V�  �  T�  P�  QT�
  �  �  �  T�  P�  QT�
  �  YY0�  PQV�  &�  T�  V�  �  T�  PQ�  �  T�  PQT�  P�	  QT�  �
  �  ;�  �  T�  PQT�  �  ;�  �  PQT�  �  �  T�  PQT�  �  P�  T�  �  R�  T�  Q�  (V�  �  T�  PQ�  �  T�  PQT�  P�	  QT�  �  �  ;�  �  T�  PQT�  �  ;�  �  PQT�  �  �  T�  PQT�  �  P�  T�  �  R�  T�  QYYY0�  PQV�  &�  T�  V�  �  T�  PQ�  �  T�  PQT�  P�  QT�  �  �  ;�  �  T�  PQT�  �  ;�  �  PQT�  �  �  �  T�  PQT�  �  P�  T�  R�  T�  �  Q�  (V�  �  T�  PQ�  �  T�  PQT�  P�  QT�  �  �  ;�  �  T�  PQT�  �  ;�  �  PQT�  �  �  T�  PQT�  �  P�  T�  R�  T�  �  QYY0�  PQV�  ;�  V�  �  �  ;�  V�  �  �  ;�  V�  �  �  ;�  V�  �  �  &�  T�  P�  QT�  PQV�  �  �  �  &�4  P�  T�  P�  QT�  Q�  V�  �  �  P�  T�  P�  QT�  Q�  &�4  P�  T�  P�  QT�  Q�  V�  �  �  P�  T�  P�  QT�  Q�  &�  T�  P�  QT�  PQV�  �  �  �  �  �  T�   �  �  �  T�!  �  �  �  T�"  �  �  �  T�#  �  �  �  �  T�$  PQ�  �  T�  P�  QT�
  �  �  �  T�  P�  QT�
  �  �  �  T�  P�  QT�
  �  �  �  T�  P�  QT�
  �  �  �  P�  QT�  �  T�%  PQYY0�&  PQV�  �  PQT�'  P�  QYY0�(  PQV�  �  PQT�'  P�  QYY0�)  PQV�  �  PQT�'  P�  QYY0�*  PQV�  �  PQT�'  P�  QYYY0�+  PQV�  �  PQT�,  PQYYY0�-  PQV�  �  PQT�.  PQ�  �  �  T�  P�  QT�
  �  �  �  T�  P�  QT�
  �  �  �/  PQYYY0�0  PQV�  �  PQT�1  P�  T�  P�  QT�  PQQYY0�2  PQV�  �/  PQ�  �  PQT�3  P�  PQT�4  QYY0�/  PQV�  &�  PQT�4  V�  �  T�  P�  QT�  �   �  (V�  �  T�  P�  QT�  �!  YYY0�5  PQV�  �  PQT�  PQT�  PQY`     GDSC   L      n   �     ������������϶��   ������϶   ��������   �������������������󶶶�   ���������¶�   �嶶   �������������ն�   ��������������������������   ��������޶��   �����¶�   ���������Ҷ�   ��������¶��   ���������Ҷ�   ����������������Ӷ��   �������϶���   ���޶���   ����Ķ��   ��������ζ��   �������������޶�   �����������¶���   �������Ѷ���   ���������Ѷ�   ����������������϶��   ����������Ѷ   �����϶�   ����   ���������¶�   ��������Ҷ��   ���������Ӷ�   �����������Ҷ���   ����ƶ��   �����Ķ�   �������������Ѷ�   ���������¶�   ����������޶   ������������Ѷ��   ���������Ҷ�   ������������Ŷ��   ����޶��   ������Ŷ   �������޶���   ���������޶�   ���������������۶���   �����ض�   �������޶���   �������Ӷ���   �����������Ķ���   �����������������޶�   �����������������Ҷ�   �������������Ҷ�   �������������Ҷ�   �����������޶���   ��������������޶   ���������׶�   �������������Ŷ�   ���Ӷ���   ��ń򶶶   ζ��   ̶��   ���������������Ӷ���   ��������������ζ   ������������ζ��   ������������������¶   �����������Ŷ���   ��������۶��   ���������¶�   ���������Ŷ�   �涶   �������ض���   ����Ŷ��   ��������Ķ��   �������������Ӷ�   ������Ҷ   ϶��   ���������������Ŷ���   ����׶��        �������?      ?                                                  333333�?      timeout    
   path_found    {�G�z�?                                           $      %   	   .   
   /      4      =      F      O      X      a      b      g      h      m      t      {      �      �      �      �      �      �      �      �      �       �   !   �   "   �   #   �   $   �   %   �   &   �   '   �   (   �   )   �   *   �   +   �   ,     -     .     /     0     1     2     3      4   *  5   4  6   8  7   V  8   \  9   a  :   b  ;   h  <   t  =   �  >   �  ?   �  @   �  A   �  B   �  C   �  D   �  E   �  F   �  G   �  H   �  I   �  J   �  K   �  L   �  M   �  N   �  O   �  P     Q     R     S   $  T   ,  U   0  V   2  W   5  X   9  Y   =  Z   I  [   b  \   h  ]   l  ^   m  _   �  `   �  a   �  b   �  c   �  d   �  e   �  f   �  g   �  h   �  i   �  j   �  k   �  l   �  m   �  n   3YY:�  �  T�  YY:�  V�  �  Y;�  �  T�  PQY:�  V�  �  YY8P�  Q;�  �  YY;�	  VY8P�  Q;�
  �  Y8P�  Q;�  �  Y8P�  Q;�  �  Y8P�  Q;�  �  Y;�  V�  �  PQYY;�  V�  YY;�  V�  Y;�  V�  �  Y;�  V�  �  Y;�  V�  �  YY;�  V�  �  YY;�  V�  Y;�  V�  YY0�  PQV�  �  �  T�  PQ�  �  �  T�  PQ�  �  PQT�  PQT�  P�  Q�  �  PQT�  PQT�  P�  QYY0�  PQV�  �  PQT�  PQT�  P�  Q�  �  PQT�  PQT�  P�  Q�  Y0�  P�  V�  QV�  �  �  YY0�   P�!  VQV�  �	  �!  �  �  �	  �  �"  PQYY0�#  PQV�  �  �  YY0�$  P�%  V�  QV�  ;�&  V�  �%  L�  M�  ;�'  V�  �%  L�  M�  &�'  V�  ;�(  �  T�)  T�  PR�&  R�*  T�+  RL�  R�  R�  MR�  R�  Q�  &�(  �
  V�  �,  P�(  Q�  Y0�"  PQV�  &�  T�  PQ�  	�  V�  AP�-  PQT�.  P�  QR�  Q�  �  �  �/  PQ�  �  ;�0  �  �  �  ;�1  �	  T�*  T�+  �  *�  V�  AP�-  PQT�.  P�  QR�  Q�  &P�	  T�*  T�+  �1  QT�2  PQ�0  V�  �/  PQ�  �1  �	  T�*  T�+  YY0�/  PQV�  �  T�3  P�*  T�+  R�	  T�*  T�+  R�2  PR�  QQYY0�4  P�5  V�  QX=V�  �  &�  �  T�6  T�7  PQV�  .Y�  ;�8  V�  �  P�*  T�+  T�9  R�*  T�+  T�:  Q�  *�  T�6  L�  MT�;  P�8  QV�  &�  �  T�<  V�  �  �  �  +�  (V�  �  �  �  &�  V�  &�  �  T�=  �  �  V�  �  �/  P�  T�6  L�  T�<  MT�>  P�8  Q�  R�  R�  Q�  &�  	�  V�  �  �  Y�  ;�?  V�  �@  T�A  P�  T�B  L�  MR�  T�C  Q�  �D  �  P�D  R�?  T�E  T�F  PQR�  Q�  �G  P�  P�  R�  R�  �
  �  QT�H  P�  T�C  R�D  T�I  QR�  T�C  Q�  YY0�,  P�(  V�  QX=V�  �  �(  �  �  �  �  �  �	  �  &�  V�  .�  -YY0�J  P�K  QV�  &�  V�  �4  P�K  Q`        [remap]

path="res://scripts/AStar Implementation.gdc"
         [remap]

path="res://scripts/AStar.gdc"
        [remap]

path="res://scripts/Canvas.gdc"
       [remap]

path="res://scripts/Seeker.gdc"
       ECFG      _global_script_classes             _global_script_class_icons             application/config/name         AStar Implementation   application/run/main_scene(         res://AStar Implementation.tscn !   display/window/size/always_on_top            display/window/dpi/allow_hidpi            layer_names/3d_physics/layer_8      
   unwalkable     layer_names/3d_physics/layer_9         walkable   layer_names/3d_physics/layer_10         floor      layer_names/3d_physics/layer_11         grass   )   rendering/environment/default_environment          res://default_env.tres       GDPC