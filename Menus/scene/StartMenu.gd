extends Node
var level1 = preload("res://levels/scene/test_level.tscn")
var local_ip 
const PORT = 9000

# Called when the node enters the scene tree for the first time.
func _ready():

	$UI/MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer/OpenGameMenu.hide()
	$UI/MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer/StartHosting.hide()
	$UI/MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer/StartJoining.hide()
	$UI/MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer/StartGame.hide()
	$UI/MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer/JoinHost.hide()
	$UI/MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer/Settings.hide()
	$UI/MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer/Settings.hide()
	$UI/MarginContainer/HBoxContainer/VBoxContainer/Title.show()
	$UI/MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer/Settings.show()
	$UI/MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer/OpenGameMenu.show()
	$UI/MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer/ComputerIP.hide()
	$UI/MarginContainer/HBoxContainer/VBoxContainer/EnterIP.hide()
	$UI/HTTPRequest.request_completed.connect(_on_request_completed)
	$UI/HTTPRequest.request("https://api.ipify.org")


func _on_open_game_menu_pressed():
	$UI/MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer/OpenGameMenu.hide()
	$UI/MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer/StartHosting.hide()
	$UI/MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer/StartJoining.hide()
	$UI/MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer/StartGame.hide()
	$UI/MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer/JoinHost.hide()
	$UI/MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer/Settings.hide()
	$UI/MarginContainer/HBoxContainer/VBoxContainer/Title.show()
	$UI/MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer/StartHosting.show()
	$UI/MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer/StartJoining.show()


func _on_start_hosting_pressed():
	$UI/MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer/OpenGameMenu.hide()
	$UI/MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer/StartHosting.hide()
	$UI/MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer/StartJoining.hide()
	$UI/MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer/StartGame.hide()
	$UI/MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer/JoinHost.hide()
	$UI/MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer/Settings.hide()
	$UI/MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer/StartGame.show()
	$UI/MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer/ComputerIP.show()


func _on_start_joining_pressed():
	$UI/MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer/OpenGameMenu.hide()
	$UI/MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer/StartHosting.hide()
	$UI/MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer/StartJoining.hide()
	$UI/MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer/StartGame.hide()
	$UI/MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer/JoinHost.hide()
	$UI/MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer/Settings.hide()
	$UI/MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer/JoinHost.show()
	$UI/MarginContainer/HBoxContainer/VBoxContainer/EnterIP.show()


func _on_start_game_pressed():
	$UI/MarginContainer/HBoxContainer/VBoxContainer.hide()
	if multiplayer.is_server():
		change_level.call_deferred(load("res://levels/scene/test_level.tscn"))




func _on_join_host_pressed():
	$UI.hide()
	var txt : String = $UI/MarginContainer/HBoxContainer/VBoxContainer/EnterIP.text
	
	if txt == "":
		OS.alert("Need a remote to connect to.")
		return
	var peer = ENetMultiplayerPeer.new()
	peer.create_client(txt, PORT)
	if peer.get_connection_status() == MultiplayerPeer.CONNECTION_DISCONNECTED:
		OS.alert("Failed to start multiplayer client.")
		return
	multiplayer.multiplayer_peer = peer
	



func _on_settings_pressed():
	$UI/MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer/OpenGameMenu.hide()
	$UI/MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer/StartHosting.hide()
	$UI/MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer/StartJoining.hide()
	$UI/MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer/StartGame.hide()
	$UI/MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer/JoinHost.hide()
	$UI/MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer/Settings.hide()

func _on_request_completed(result, response_code, headers, body):
	local_ip = body.get_string_from_utf8()
	$UI/MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer/ComputerIP.text = str("IP " + local_ip)

func change_level(scene: PackedScene):
	# Remove old level if any.
	var level = $WorldNode
	# Add new level.
	level.add_child(scene.instantiate())
