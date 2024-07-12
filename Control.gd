extends Control
var local_ip 
var level1 = preload("res://levels/scene/test_level.tscn")
const PORT = 9000

# Called when the node enters the scene tree for the first time.
func _ready():
	$MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer/OpenGameMenu.hide()
	$MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer/StartHosting.hide()
	$MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer/StartJoining.hide()
	$MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer/StartGame.hide()
	$MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer/JoinHost.hide()
	$MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer/Settings.hide()
	$MarginContainer/HBoxContainer/VBoxContainer/Title.show()
	$MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer/Settings.show()
	$MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer/OpenGameMenu.show()
	$MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer/ComputerIP.hide()
	$HTTPRequest.request_completed.connect(_on_request_completed)
	$HTTPRequest.request("https://api.ipify.org")


func _on_open_game_menu_pressed():
	$MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer/OpenGameMenu.hide()
	$MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer/StartHosting.hide()
	$MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer/StartJoining.hide()
	$MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer/StartGame.hide()
	$MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer/JoinHost.hide()
	$MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer/Settings.hide()
	$MarginContainer/HBoxContainer/VBoxContainer/Title.show()
	$MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer/StartHosting.show()
	$MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer/StartJoining.show()


func _on_start_hosting_pressed():
	$MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer/OpenGameMenu.hide()
	$MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer/StartHosting.hide()
	$MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer/StartJoining.hide()
	$MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer/StartGame.hide()
	$MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer/JoinHost.hide()
	$MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer/Settings.hide()
	$MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer/StartGame.show()
	$MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer/ComputerIP.show()


func _on_start_joining_pressed():
	$MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer/OpenGameMenu.hide()
	$MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer/StartHosting.hide()
	$MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer/StartJoining.hide()
	$MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer/StartGame.hide()
	$MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer/JoinHost.hide()
	$MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer/Settings.hide()
	$MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer/JoinHost.show()


func _on_start_game_pressed():
	$MarginContainer/HBoxContainer/VBoxContainer.hide()



func _on_join_host_pressed():
	$MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer/OpenGameMenu.hide()
	$MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer/StartHosting.hide()
	$MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer/StartJoining.hide()
	$MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer/StartGame.hide()
	$MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer/JoinHost.hide()
	$MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer/Settings.hide()



func _on_settings_pressed():
	$MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer/OpenGameMenu.hide()
	$MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer/StartHosting.hide()
	$MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer/StartJoining.hide()
	$MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer/StartGame.hide()
	$MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer/JoinHost.hide()
	$MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer/Settings.hide()

func _on_request_completed(result, response_code, headers, body):
	local_ip = body.get_string_from_utf8()
	$MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer/ComputerIP.text = str("IP " + local_ip)
