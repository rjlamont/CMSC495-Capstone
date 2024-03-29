extends Node2D


# Define variables
var words = ["hangman", "apple", "banana", "orange"]  # Example word list
var word = ""
var guessed_letters = []
var attempts_left = 6

func _ready():
	start_game()

func start_game():
	# Select a random word from the word list
	word = words[randi() % words.size()]
	print("Word to guess:", word)

	# Initialize guessed letters
	guessed_letters.clear()
	for i in range(word.length()):
		guessed_letters.append("_")

	update_display()

func update_display():
	$WordLabel.text = "Word: " + guessed_letters.join(" ")
	$AttemptsLabel.text = "Attempts left: " + str(attempts_left)

func guess_letter(letter):
	if word.find(letter) == -1:
		attempts_left -= 1
		# Update hangman figure (not implemented in this example)
	else:
		for i in range(word.length()):
			if word[i] == letter:
				guessed_letters[i] = letter

	update_display()
	check_game_state()

func check_game_state():
	if attempts_left <= 0:
		print("You lose! The word was:", word)
		restart_game()
	elif guessed_letters.join("") == word:
		print("You win!")
		restart_game()

func restart_game():
	# Reset variables and start a new game
	start_game()

func _input(event):
	if event is InputEventKey and event.pressed:
		var key = event.scancode
		if key >= KEY_A and key <= KEY_Z:
			var letter = String(char(key))  # Convert scancode to character
			if not guessed_letters.contains(letter):
				guess_letter(letter)
