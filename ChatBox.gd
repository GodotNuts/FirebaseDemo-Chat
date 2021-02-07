extends TextureRect

func set_item(item):
    $ChatBox/UserName.text = item.Username + " "
    $ChatBox/Text.text = item.Text
