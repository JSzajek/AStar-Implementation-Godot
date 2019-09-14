GDPC                                                                                    res://AStar Implementation.tscn �      #      ���m�2�M�8Y�$   res://AStar-Gap Implementation.tscn        L      J�8+����Z�:Ȗ   res://assets/AStar.tscn P      �       9tx�]H�@���s���   res://assets/Canvas.tscn0      �)      ����MϘ��:7�V�:�   res://assets/Seeker.tscn E      .      z���J5K�K��\��a   res://assets/Target.tscnPJ      �      �ae�7
�e�s��>f   res://assets/World-Gap.tscn 0L      +"      �?����@hEYw�9e   res://assets/World.tscn `n      |      ��V�����������%   res://default_env.tres  ��      �       um�`�N��<*ỳ�8   res://project.binary     k      |wP���~a@;+���(   res://scripts/AStar Implementation.gd   ��      
      h�:�7zmw���N�r   res://scripts/AStar.gd  ��      U      _��K3��Q�u�9�n�<   res://scripts/Canvas.gd ��      �      ��r!��^ޜ�V�q   res://scripts/Seeker.gd ��      g      P���	Bb'Y���91            [gd_scene load_steps=9 format=2]

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
             [gd_scene load_steps=9 format=2]

[ext_resource path="res://scripts/AStar Implementation.gd" type="Script" id=1]
[ext_resource path="res://assets/Seeker.tscn" type="PackedScene" id=2]
[ext_resource path="res://assets/AStar.tscn" type="PackedScene" id=3]
[ext_resource path="res://assets/Canvas.tscn" type="PackedScene" id=4]
[ext_resource path="res://assets/Target.tscn" type="PackedScene" id=5]
[ext_resource path="res://assets/World-Gap.tscn" type="PackedScene" id=6]

[sub_resource type="ProceduralSky" id=1]
sky_top_color = Color( 0.403922, 0.686275, 0.843137, 1 )
sky_horizon_color = Color( 0.639216, 0.713726, 0.772549, 1 )
ground_bottom_color = Color( 0.403922, 0.686275, 0.843137, 1 )
ground_horizon_color = Color( 0.639216, 0.713726, 0.772549, 1 )

[sub_resource type="Environment" id=2]
background_mode = 2
background_sky = SubResource( 1 )

[node name="AStar-Gap Implementation" type="Node"]
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
editor/display_folded = true

[node name="Swivel" type="Spatial" parent="Pivot"]

[node name="Camera" type="Camera" parent="Pivot/Swivel"]
transform = Transform( 1, 0, 0, 0, 0.707107, 0.707107, 0, -0.707107, 0.707107, 0, 30, 30 )
environment = SubResource( 2 )

[node name="Canvas" parent="." instance=ExtResource( 4 )]

[node name="Target" parent="." instance=ExtResource( 5 )]
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

[node name="World-Gap" parent="." instance=ExtResource( 6 )]
    [gd_scene load_steps=2 format=2]

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

[node name="Seeker" type="KinematicBody"]
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

[node name="Path_Update_Timer" type="Timer" parent="."]
[connection signal="timeout" from="Path_Update_Timer" to="." method="_on_Path_Update_Timer_timeout"]
  [gd_scene load_steps=4 format=2]

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

[node name="World-Gap" type="Spatial"]

[node name="Grass" type="MeshInstance" parent="."]
transform = Transform( 1, 0, 0, 0, 1, 0, 0, 0, 0.3, 0, 0, -17.5196 )
mesh = SubResource( 1 )
material/0 = SubResource( 2 )

[node name="StaticBody" type="StaticBody" parent="Grass"]
editor/display_folded = true
collision_layer = 1280

[node name="CollisionShape" type="CollisionShape" parent="Grass/StaticBody"]
shape = SubResource( 3 )

[node name="Grass2" type="MeshInstance" parent="."]
transform = Transform( 1, 0, 0, 0, 1, 0, 0, 0, 0.497, 0, 0, 12.7042 )
mesh = SubResource( 1 )
material/0 = SubResource( 2 )

[node name="StaticBody" type="StaticBody" parent="Grass2"]
editor/display_folded = true
collision_layer = 1280

[node name="CollisionShape" type="CollisionShape" parent="Grass2/StaticBody"]
shape = SubResource( 3 )

[node name="Grass3" type="MeshInstance" parent="."]
transform = Transform( 0.512, 0, 0, 0, 1, 0, 0, 0, 0.249, 12.2399, 0, -4.73234 )
mesh = SubResource( 1 )
material/0 = SubResource( 2 )

[node name="StaticBody" type="StaticBody" parent="Grass3"]
editor/display_folded = true
collision_layer = 1280

[node name="CollisionShape" type="CollisionShape" parent="Grass3/StaticBody"]
shape = SubResource( 3 )

[node name="Obstacles" type="Spatial" parent="."]
editor/display_folded = true

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
transform = Transform( 4.51521, 0, 0, 0, 2.97506, 0, 0, 0, 3.55341, 16.5723, 2.42098, -1.89553 )
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
editor/display_folded = true

[node name="Road_1" type="MeshInstance" parent="Roads"]
editor/display_folded = true
transform = Transform( 6.162, 0, 0, 0, 1, 0, 0, 0, 19.5404, -20.8167, 0.358764, 15.1624 )
mesh = SubResource( 7 )
material/0 = SubResource( 8 )

[node name="StaticBody" type="StaticBody" parent="Roads/Road_1"]
collision_layer = 768

[node name="CollisionShape" type="CollisionShape" parent="Roads/Road_1/StaticBody"]
shape = SubResource( 9 )

[node name="Road_2" type="MeshInstance" parent="Roads"]
editor/display_folded = true
transform = Transform( -1.59484, 0, 19.7229, 0, 1, 0, -5.95203, 0, -5.28475, -13.2908, 0.358764, 5.75345 )
mesh = SubResource( 7 )
material/0 = SubResource( 8 )

[node name="StaticBody" type="StaticBody" parent="Roads/Road_2"]
collision_layer = 768

[node name="CollisionShape" type="CollisionShape" parent="Roads/Road_2/StaticBody"]
shape = SubResource( 9 )

[node name="Road_5" type="MeshInstance" parent="Roads"]
editor/display_folded = true
transform = Transform( -2.6935e-007, 0, 8.83415, 0, 1, 0, -6.162, 0, -3.86153e-007, 0.0514565, 0.358764, 3.22394 )
mesh = SubResource( 7 )
material/0 = SubResource( 8 )

[node name="StaticBody" type="StaticBody" parent="Roads/Road_5"]
collision_layer = 768

[node name="CollisionShape" type="CollisionShape" parent="Roads/Road_5/StaticBody"]
shape = SubResource( 9 )

[node name="Road_6" type="MeshInstance" parent="Roads"]
editor/display_folded = true
transform = Transform( 3.53438, 0, 16.7261, 0, 1, 0, -5.04762, 0, 11.7117, -2.79204, 0.358764, -16.755 )
mesh = SubResource( 7 )
material/0 = SubResource( 8 )

[node name="StaticBody" type="StaticBody" parent="Roads/Road_6"]
collision_layer = 768

[node name="CollisionShape" type="CollisionShape" parent="Roads/Road_6/StaticBody"]
shape = SubResource( 9 )

[node name="Road_7" type="MeshInstance" parent="Roads"]
editor/display_folded = true
transform = Transform( 0, 0, 15.568, 0, 1, 0, -6.162, 0, -9.53674e-007, -17.2814, 0.358764, -22.0921 )
mesh = SubResource( 7 )
material/0 = SubResource( 8 )

[node name="StaticBody" type="StaticBody" parent="Roads/Road_7"]
collision_layer = 768

[node name="CollisionShape" type="CollisionShape" parent="Roads/Road_7/StaticBody"]
shape = SubResource( 9 )

[node name="Road_3" type="MeshInstance" parent="Roads"]
editor/display_folded = true
transform = Transform( 6.162, 0, -7.8134e-008, 0, 1, 0, 2.40731e-008, 0, 20, 4.31256, 0.358764, -3.71169 )
mesh = SubResource( 7 )
material/0 = SubResource( 8 )

[node name="StaticBody" type="StaticBody" parent="Roads/Road_3"]
collision_layer = 768

[node name="CollisionShape" type="CollisionShape" parent="Roads/Road_3/StaticBody"]
shape = SubResource( 9 )
     [gd_scene load_steps=10 format=2]

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
             extends Node

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
			if !child.is_tracking():
				child.start_tracking(target)
	else:
		for child in get_node("Seekers").get_children():
			child.stop_tracking()

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
       extends Spatial

export (int) var unwalkableMask = 7
export (Vector2) var gridWorldSize
export (float) var nodeRadius = 1
export (bool) var blurrWeights = false
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

func request_path(requester_path : NodePath, startPos : Vector3, targetPos : Vector3, callback : FuncRef, unique_id : int):
	path_finding_manager.request_path(PathRequest.new(requester_path, startPos, targetPos, callback, unique_id))

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
	var request_queue : Object
	var pathfinding : Object
	
	var path_request_thread : Thread
	var path_request_mutex : Mutex
	
	func _init(_pathfinding : Object):
		request_queue = PathRequestQueue.new()
		self.pathfinding = _pathfinding

	func request_path(path_request : PathRequest):
		if path_request_thread == null:
			path_request_thread = Thread.new()
			path_request_mutex = Mutex.new()
		path_request_mutex.lock()
		request_queue.append(path_request)
		path_request_mutex.unlock()
		if request_queue.size() == 1:
			call_deferred('path_data_defered')
        
	func path_data_defered():
		var error = path_request_thread.start(self, 'path_data_execute', request_queue.front())
		if error != 0:
			print(error)
	    
	func path_data_execute(args):
		# Don't calculate or pass if requester is gone/dead
		if pathfinding.get_tree().get_root().has_node(args.requester_path) == null:
			return
		
		var new_path_args = pathfinding.find_path(args.pathStart, args.pathEnd)
		call_deferred('path_data_clean_up')
		return [args.callback, new_path_args, args.requester_path]
	    
	func path_data_clean_up():
		var args = path_request_thread.wait_to_finish()
		args[0].call_func(args[1])
		request_queue.pop_front()
		
		if request_queue.size() > 0:
			# Start the next task.
			call_deferred('path_data_defered')
		elif request_queue.size() == 0:
			path_request_thread = null
			path_request_mutex = null


class PathRequestQueue:
	var path_request_queue : Array = []

	func append(request : PathRequest):
		var index = find(request)
		if index > 0:
			replace(index, request)
			return
		path_request_queue.append(request)
	
	func find(request : PathRequest):
		for i in range(size()-1, -1, -1):
			if path_request_queue[i].unique_id == request.unique_id:
				if path_request_queue[i].is_processing:
					return -1
				return i
		return -1
	
	func replace(old_index : int, new_request : PathRequest):
		path_request_queue[old_index] = new_request
	
	func size():
		return path_request_queue.size()
	
	func pop_front():
		path_request_queue.pop_front()
	
	func front():
		return path_request_queue.front()


class PathRequest:
	var requester_path : NodePath
	var pathStart : Vector3
	var pathEnd : Vector3
	var callback : FuncRef
	var unique_id : int
	var is_processing : bool = false

	func _init(_requester_path : NodePath, _start : Vector3, _end : Vector3, _callback : FuncRef, _unique_id : int):
		self.requester_path = _requester_path
		self.pathStart = _start
		self.pathEnd = _end
		self.callback = _callback
		self.unique_id = _unique_id


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
				else:
					walkable = false
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
				penalties_horizontal_pass[0][y] += grid[sampleX][y].movement_penalty
			
			for x in range(1, gridSizeX):
				var removeIndex : int = int(clamp(x - kernel_extents - 1, 0, gridSizeX))
				var addIndex : int = int(clamp(x + kernel_extents, 0, gridSizeX - 1))
				penalties_horizontal_pass[x][y] = penalties_horizontal_pass[x-1][y]  - grid[removeIndex][y].movement_penalty + grid[addIndex][y].movement_penalty
	
		for x in range(gridSizeX):
			for y in range(-kernel_extents, kernel_extents + 1 + 1):
				var sampleY : int = int(clamp(y, 0, kernel_extents))
				penalties_vertical_pass[x][0] += penalties_horizontal_pass[x][sampleY]
			
			var blurred_penalty : int = int(round(penalties_vertical_pass[x][0]  / float(kernel_size * kernel_size)))
			grid[x][0].movement_penalty = blurred_penalty
			
			for y in range(1, gridSizeY):
				var removeIndex : int = int(clamp(y - kernel_extents - 1, 0, gridSizeY))
				var addIndex : int = int(clamp(y + kernel_extents, 0, gridSizeY - 1))
			
				penalties_vertical_pass[x][y] = penalties_vertical_pass[x][y-1]  - penalties_horizontal_pass[x][removeIndex] + penalties_horizontal_pass[x][addIndex]
				blurred_penalty = int(round(penalties_vertical_pass[x][y]  / float(kernel_size * kernel_size)))
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
	var lookPoints : PoolVector3Array = []
	var turnBoundaries : Array = []
	var finishLineIndex : int
	var slowDownIndex : int
	
	func _init(waypoints : PoolVector3Array, start_pos : Vector3, _draw_path : Array, turn_dist : float, stopping_dist : float):
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
#		items.replace(currentItemCount, heap_item)
		currentItemCount += 1
		sort_up(heap_item)
	
	func remove_first() -> Object:
		var firstItem : Heap_Item = items[0]
#		var firstItem : Heap_Item = items.get_item(0)
		currentItemCount-= 1
		items[0] = items[currentItemCount]
#		items.replace(0, items.get_item(currentItemCount))
		items[0].heapIndex = 0
#		items.get_item(0).heapIndex = 0
#		sort_down(items.get_item(0))
		sort_down(items[0])
		
		# warning-ignore:return_value_discarded
		heap_item_dict.erase(firstItem.unique_id)
		return firstItem.item
	
	func find(item : Object) -> Heap_Item:
#		var found_item = items.find(item)
#		if found_item:
#			return found_item
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
		return items[item.heapIndex].item == item
#		return items.get_item(item.heapIndex).item == item
	
	func sort_down(item : Heap_Item):
		while(true):
			var childIndexLeft : int = (item.heapIndex * 2) + 1
			var childIndexRight : int = (item.heapIndex * 2) + 2
			var swapIndex : int = 0
			if childIndexLeft < size():
				swapIndex = childIndexLeft
				if childIndexRight < size():
					if items[childIndexLeft].compare_to(items[childIndexRight]) < 0:
#					if items.get_item(childIndexLeft).compare_to(items.get_item(childIndexRight)) < 0:
						swapIndex = childIndexRight
				
				if item.compare_to(items[swapIndex]) < 0:
#				if item.compare_to(items.get_item(swapIndex)) < 0:
					swap(item, items[swapIndex])
#					swap(item, items.get_item(swapIndex))
				else:
					return
			else:
				return
			
	func sort_up(item : Heap_Item):
		var parentIndex : int = int((item.heapIndex-1)/2.0)
		while (true):
			if parentIndex > 0 and item.compare_to(items[parentIndex]) > 0:
#			if parentIndex > 0 and item.compare_to(items.get_item(parentIndex)) > 0:
				swap(item, items[parentIndex])
#				swap(item, items.get_item(parentIndex))
			else:
				break
			parentIndex = int((item.heapIndex-1)/2.0)

	func swap(itemA : Heap_Item, itemB : Heap_Item):
		items[itemA.heapIndex] = itemB
		items[itemB.heapIndex] = itemA
#		items.replace(itemA.heapIndex, itemB)
#		items.replace(itemB.heapIndex, itemA)
		var itemAIndex : int = itemA.heapIndex
		itemA.heapIndex =  itemB.heapIndex
		itemB.heapIndex = itemAIndex
	
	
	class Heap_Array:
		var items : Array
		
		func resize(new_size : int) -> void:
			items.resize(new_size)
		
		func size() -> int:
			return items.size()
		
		func find(item : Object) -> Heap_Item:
			for x in items:
				if x.unique_id == item.unique_id:
					return x
			return null
		
		func replace(index : int, new_item : Heap_Item) -> void:
			print("replace at " + str(index) + "\t" + str(new_item))
			items[index] = new_item
		
		func get_item(index : int) -> Heap_Item:
			return items[index]
	
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

        extends Control

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
         ECFG      _global_script_classes             _global_script_class_icons             application/config/name         AStar Implementation   application/run/main_scene(         res://AStar Implementation.tscn !   display/window/size/always_on_top            display/window/dpi/allow_hidpi            layer_names/3d_physics/layer_8      
   unwalkable     layer_names/3d_physics/layer_9         walkable   layer_names/3d_physics/layer_10         floor      layer_names/3d_physics/layer_11         grass   )   rendering/environment/default_environment          res://default_env.tres       GDPC