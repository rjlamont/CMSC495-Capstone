extends Node

var default_dictionary_location: String = "user://dictionary.txt"

func dictionary_exists() -> bool:
	return FileAccess.file_exists(default_dictionary_location)

# function to open the dictionary file for reading. 
func open_dictionary() -> FileAccess:
	if FileAccess.file_exists(default_dictionary_location):
		return FileAccess.open(default_dictionary_location, FileAccess.READ)
	else:
		return FileAccess.open(default_dictionary_location, FileAccess.WRITE_READ)

# function to save the word list to the dictionary file.
func save_dictionary() -> void:
	var file = FileAccess.open(default_dictionary_location, FileAccess.WRITE)
	var string = ""
	for word in word_list.words:
		string += word
		string += "\n"
	file.store_string(string)
