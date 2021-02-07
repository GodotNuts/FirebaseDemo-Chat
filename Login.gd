extends VBoxContainer

func _ready() -> void:
    $Signin.connect("pressed", self, "_on_Login_pressed")
    $Signup.connect("pressed", self, "_on_Signup_pressed")

func _on_Login_pressed():
    var email = $Email.text
    var password = $Password.text
    var username = $Username.text
    if not username or username.empty():
        return
        
    Global.username = username
    if not email or email.empty():
        Firebase.Auth.login_anonymous()
    else:
        Firebase.Auth.login_with_email_and_password(email, password)

func _on_Signup_pressed():
    var email = $Email.text
    var password = $Password.text
    if not email or email.empty():
        return
        
    Firebase.Auth.signup_with_email_and_password(email, password)

