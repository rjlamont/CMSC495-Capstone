extends Node2D

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

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_button_a_pressed():
	print("A")
	$Letters/VBoxContainer/ButtonA.disabled = true

func _on_button_g_pressed():
	print("G")
	$Letters/VBoxContainer/ButtonG.disabled = true

func _on_button_m_pressed():
	print("M")
	$Letters/VBoxContainer/ButtonM.disabled = true

func _on_button_s_pressed():
	print("S")
	$Letters/VBoxContainer/ButtonS.disabled = true

func _on_button_b_pressed():
	print("B")
	$Letters/VBoxContainer1/ButtonB.disabled = true

func _on_button_h_pressed():
	print("H")
	$Letters/VBoxContainer1/ButtonH.disabled = true

func _on_button_n_pressed():
	print("N")
	$Letters/VBoxContainer1/ButtonN.disabled = true

func _on_button_t_pressed():
	print("T")
	$Letters/VBoxContainer1/ButtonT.disabled = true

func _on_button_c_pressed():
	print("C")
	$Letters/VBoxContainer2/ButtonC.disabled = true

func _on_button_i_pressed():
	print("I")
	$Letters/VBoxContainer2/ButtonI.disabled = true

func _on_button_o_pressed():
	print("O")
	$Letters/VBoxContainer2/ButtonO.disabled = true

func _on_button_u_pressed():
	print("U")
	$Letters/VBoxContainer2/ButtonU.disabled = true

func _on_button_y_pressed():
	print("Y")
	$Letters/VBoxContainer2/ButtonY.disabled = true

func _on_button_d_pressed():
	print("D")
	$Letters/VBoxContainer3/ButtonD.disabled = true

func _on_button_j_pressed():
	print("J")
	$Letters/VBoxContainer3/ButtonJ.disabled = true

func _on_button_p_pressed():
	print("P")
	$Letters/VBoxContainer3/ButtonP.disabled = true

func _on_button_v_pressed():
	print("V")
	$Letters/VBoxContainer3/ButtonV.disabled = true

func _on_button_z_pressed():
	print("Z")
	$Letters/VBoxContainer3/ButtonZ.disabled = true

func _on_button_e_pressed():
	print("E")
	$Letters/VBoxContainer4/ButtonE.disabled = true

func _on_button_k_pressed():
	print("K")
	$Letters/VBoxContainer4/ButtonK.disabled = true

func _on_button_q_pressed():
	print("Q")
	$Letters/VBoxContainer4/ButtonQ.disabled = true

func _on_button_w_pressed():
	print("W")
	$Letters/VBoxContainer4/ButtonW.disabled = true

func _on_button_f_pressed():
	print("F")
	$Letters/VBoxContainer5/ButtonF.disabled = true

func _on_button_l_pressed():
	print("L")
	$Letters/VBoxContainer5/ButtonL.disabled = true

func _on_button_r_pressed():
	print("R")
	$Letters/VBoxContainer5/ButtonR.disabled = true

func _on_button_x_pressed():
	print("X")
	$Letters/VBoxContainer5/ButtonX.disabled = true
