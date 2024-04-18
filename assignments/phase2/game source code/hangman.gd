extends Control

# Preload hangman image assets.
const hangman_0 := preload("res://assets/images/HangmanPole.png")
const hangman_1 := preload("res://assets/images/HangmanPoleWithHead.png")
const hangman_2 := preload("res://assets/images/HangmanPoleWithHeadAndBody.png")
const hangman_3 := preload("res://assets/images/HangmanPoleWithHeadAndBodyAndLeftHand.png")
const hangman_4 := preload("res://assets/images/HangmanPoleWithHeadAndBodyAndBothHands.png")
const hangman_5 := preload("res://assets/images/HangmanPoleWithHeadAndBodyAndBothHandsAndLeftLeg.png")
const hangman_6 := preload("res://assets//images/HangmanPoleWithHangMan.png")


# Initialize game state variables.
var attempt: int = 0
var chars: Array[String] = []
var correct_chars: Array[String] = []
var wrong_chars: Array[String] = []

# Node references setup using 'onready' to ensure they are available after scene is loaded.
@onready var hangpole: TextureRect = $MarginContainer/HBoxContainer/HangPole
@onready var wrong: Label = $MarginContainer/HBoxContainer/VBoxContainer/HBoxContainer/Wrong
@onready var wrong2: Label = $MarginContainer/HBoxContainer/VBoxContainer/HBoxContainer/Wrong2
@onready var wrong3: Label = $MarginContainer/HBoxContainer/VBoxContainer/HBoxContainer/Wrong3
@onready var wrong4: Label = $MarginContainer/HBoxContainer/VBoxContainer/HBoxContainer/Wrong4
@onready var wrong5: Label = $MarginContainer/HBoxContainer/VBoxContainer/HBoxContainer/Wrong5
@onready var wrong6: Label = $MarginContainer/HBoxContainer/VBoxContainer/HBoxContainer/Wrong6
@onready var result_label: Label = $MarginContainer/HBoxContainer/VBoxContainer/Result
@onready var line_edit: LineEdit = $MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer/HBoxContainer2/LineEdit
@onready var guess_word: LineEdit = $MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer/HBoxContainer3/WordGuess
@onready var character_row: HBoxContainer = $MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer/HBoxContainer2
@onready var guess_row: HBoxContainer = $MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer/HBoxContainer3
@onready var attempt_button: Button = $MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer/HBoxContainer2/Attempt
@onready var guess_button: Button = $MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer/HBoxContainer3/Guess

# Called when the node is added to the scene. Initializes the game.
func _ready() -> void:
	randomize()
	start_game()

# Process method checks for UI input events.
func _process(delta: float) -> void:
	#update_hangman_status()
	#update_wrong_chars()
	#update_result()
	
	if Input.is_action_just_pressed("ui_accept") and get_viewport().gui_get_focus_owner() == line_edit:
		attempt_button.emit_signal("pressed")
	
	if Input.is_action_just_pressed("ui_accept") and get_viewport().gui_get_focus_owner() == guess_word:
		guess_button.emit_signal("pressed")

# Updates displayed result based on correct guesses.
func update_result() -> void:
	var result = ""
	for c in WordList.chosen_word:
		if c == " ":
			result += " "
		else:
			result += "_"
	for target in correct_chars:
		for index in range(WordList.chosen_word.length()):
			if target == WordList.chosen_word[index]:
				result[index] = target
	result_label.text = result

# Updates the display for wrong guesses.
func update_wrong_chars() -> void:
	match wrong_chars.size():
		0:
			wrong.text = ""
			wrong2.text = ""
			wrong3.text = ""
			wrong4.text = ""
			wrong5.text = ""
			wrong6.text = ""
		1:
			wrong.text = wrong_chars[0]
			wrong2.text = ""
			wrong3.text = ""
			wrong4.text = ""
			wrong5.text = ""
			wrong6.text = ""
		2:
			wrong.text = wrong_chars[0]
			wrong2.text = wrong_chars[1]
			wrong3.text = ""
			wrong4.text = ""
			wrong5.text = ""
			wrong6.text = ""
		3:
			wrong.text = wrong_chars[0]
			wrong2.text = wrong_chars[1]
			wrong3.text = wrong_chars[2]
			wrong4.text = ""
			wrong5.text = ""
			wrong6.text = ""
		4:
			wrong.text = wrong_chars[0]
			wrong2.text = wrong_chars[1]
			wrong3.text = wrong_chars[2]
			wrong4.text = wrong_chars[3]
			wrong5.text = ""
			wrong6.text = ""
		5:
			wrong.text = wrong_chars[0]
			wrong2.text = wrong_chars[1]
			wrong3.text = wrong_chars[2]
			wrong4.text = wrong_chars[3]
			wrong5.text = wrong_chars[4]
			wrong6.text = ""
		_:
			wrong.text = wrong_chars[0]
			wrong2.text = wrong_chars[1]
			wrong3.text = wrong_chars[2]
			wrong4.text = wrong_chars[3]
			wrong5.text = wrong_chars[4]
			wrong6.text = wrong_chars[5]

# Updates the hangman image based on the number of incorrect guesses.
func update_hangman_status() -> void:
	match attempt:
		0:
			hangpole.texture = hangman_0
		1:
			hangpole.texture = hangman_1
		2:
			hangpole.texture = hangman_2
		3:
			hangpole.texture = hangman_3
		4:
			hangpole.texture = hangman_4
		5:
			hangpole.texture = hangman_5
		_:
			hangpole.texture = hangman_6

# Initializes or resets the game state.
func start_game() -> void:
	if WordList.words.size() < 1:
		WordList.chosen_word = "PLACEHOLDER"
	else:
		WordList.set_chosen_word()
	attempt = 0
	chars = get_chars()
	correct_chars = []
	wrong_chars = []
	if " " in chars:
		var index = chars.find(" ")
		chars.remove_at(index)
	wrong.text = ""
	wrong2.text = ""
	wrong3.text = ""
	wrong4.text = ""
	wrong5.text = ""
	wrong6.text = ""
	guess_word.max_length = WordList.chosen_word.length()
	guess_row.show()
	character_row.show()
	update_hangman_status()
	update_wrong_chars()
	update_result()

# Retrieves unique characters from the chosen word.
func get_chars() -> Array[String]:
	var char_list: Array[String] = []
	for c in WordList.chosen_word:
		if !char_list.has(c):
			char_list.append(c)
	return char_list

# Handles user input for character guesses.
func _on_attempt_pressed() -> void:
	var attempted_character = line_edit.text.to_upper()
	if attempted_character in chars:
		correct_chars.append(attempted_character)
		var index = chars.find(attempted_character)
		chars.remove_at(index)
	elif attempted_character in correct_chars or attempted_character in wrong_chars:
		return
	else:
		wrong_chars.append(attempted_character)
		attempt += 1
	line_edit.text = ""
	update_hangman_status()
	update_wrong_chars()
	update_result()
	_check_win_or_lose_condition()

# Handles user input for word guesses.
func _on_guess_pressed() -> void:
	if guess_word.text.to_upper() == WordList.chosen_word.to_upper():
		correct_chars = chars
		chars.clear()
	else:
		attempt += 1
	update_hangman_status()
	update_wrong_chars()
	update_result()
	_check_win_or_lose_condition()

# Checks if the game has been won or lost.
func _check_win_or_lose_condition() -> void:
	if chars.size() == 0:
		result_label.text = "You Win!\nThe correct word was: " + WordList.chosen_word
		guess_row.hide()
		character_row.hide()
	if attempt == 6:
		result_label.text = "You were hanged!\nThe correct word was: " + WordList.chosen_word
		guess_row.hide()
		character_row.hide()

# Restarts the game.
func _on_restart_pressed() -> void:
	start_game()

# Changes scene back to the main menu.
func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/mainMenu.tscn")
