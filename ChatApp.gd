extends Control

var db_ref
var _can_submit = false
onready var submit_text := $ChatControl/VBoxContainer/SubmitText

func _ready() -> void:
    $LoginPopup.popup_centered(Vector2(84, 84))
    if Firebase.Auth.auth == null or !Firebase.Auth.auth.keys().empty():
        get_db_connection(null)
    else:
        Firebase.Auth.connect("login_succeeded", self, "get_db_connection")
        Firebase.Auth.connect("signup_succeeded", self, "get_db_connection")

func get_db_connection(auth) -> void:
    db_ref = Firebase.Database.get_database_reference("OneBitChat/debug/chats", { })
    _can_submit = true
    db_ref.connect("push_failed", self, "_on_push_failed")
    
func _on_SubmitButton_pressed() -> void:
    if not _can_submit:
        return
        
    var text = submit_text.text
    if not text or text.empty():
        return
    
    submit_text.text = ""
    submit_text.editable = false
    db_ref.push({ "Username" : Global.username, "Text" : text })
    submit_text.editable = true

func _on_push_failed(x, y, z):
    printerr("Push failed: " + z)
