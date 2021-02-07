extends PopupPanel

func _ready() -> void:
    Firebase.Auth.connect("signup_succeeded", self, "on_login_succeeded")
    Firebase.Auth.connect("login_succeeded", self, "on_login_succeeded")
    Firebase.Auth.connect("login_failed", self, "on_login_failed")

func on_login_succeeded(auth_token) -> void:
    hide()

func on_login_failed(error_code, message):
    print("error code: " + str(error_code))
    print("message: " + str(message))
