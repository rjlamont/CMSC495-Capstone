extends Node

# Variable to hold the location of the dictionary file where words are stored.
var default_dictionary_location: String = "user://dictionary.txt"

# Function to open the dictionary file for reading. 
func open_dictionary() -> FileAccess:
	# Opens the dictionary file in read-only mode.
	return FileAccess.open(default_dictionary_location, FileAccess.READ)
	
# Function to save the word list to the dictionary file.
func save_dictionary() -> void:
	var file = FileAccess.open(default_dictionary_location, FileAccess.WRITE)
	var string = ""
	for word in WordList.words:
		string += word
		string += "\n"
	file.store_string(string)
