extends Control

var slides = [
	"Di sebuah pulau yang dahulu indah, hiduplah seorang pemuda yang menjalani kehidupan sederhana. Hutan lebat, pepohonan hijau, dan sungai jernih membuat pulau itu nyaman dihuni.",
	"Namun, kebakaran hutan secara besar-besaran mulai menghancurkan semuanya. Asap tebal menyelimuti langit, udara tercemar, membuat pulau tersebut kini tak layak lagi untuk dihuni.",
	"Pemuda itu harus segera pergi sebelum seluruh wilayah terbakar oleh api. Satu-satunya jalan keluar adalah dengan memasuki portal misterius di ujung pulau.",
	"Namun api ternyata telah membakar portal. Ia pun harus mencari cara agar portal tersebut tak lagi terbakar oleh api.",
	"Satu satunya hal yang bisa ia lakukan adalah mencari air untuk memadamkan api tersebut.",
	"Tetapi hal ini tidaklah semudah itu, karena akan selalu ada rintangan yang akan dihadapinya sepanjang perjalanan yang di tempuhnya."
]

var slide_index = 0
var teks_penuh = ""
var indeks_karakter = 0
var menunggu = false
 
func _ready() -> void:
	$btn_lewat.connect("pressed", Callable(self, "_on_lewat_pressed"))
	$timer_ketik.connect("timeout", Callable(self, "_on_timer_timeout"))
	_mulai_slide()
 
func _mulai_slide() -> void:
	if slide_index >= slides.size():
		get_tree().change_scene_to_file("res://scene/last_escape.tscn")
		return
	
	teks_penuh = slides[slide_index]
	indeks_karakter = 0
	$lbl_teks.text = ""
	menunggu = false
	$timer_ketik.wait_time = 0.1
	$timer_ketik.start()
 
func _on_timer_timeout() -> void:
	if menunggu:
		# Setelah jeda, lanjut ke slide berikutnya
		menunggu = false
		slide_index += 1
		_mulai_slide()
	elif indeks_karakter < teks_penuh.length():
		# Masih mengetik karakter per karakter
		$lbl_teks.text += teks_penuh[indeks_karakter]
		indeks_karakter += 1
		$timer_ketik.start()
	else:
		# Selesai mengetik, tunggu 2 detik sebelum slide berikutnya
		menunggu = true
		$timer_ketik.wait_time = 2.0
		$timer_ketik.start()
 
func _on_lewat_pressed() -> void:
	get_tree().change_scene_to_file("res://scene/last_escape.tscn")
