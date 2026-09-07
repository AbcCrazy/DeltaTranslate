extends Control
@onready var english_text_edit: TextEdit = $HBoxContainer/EnglishTextEdit
@onready var translated_text_edit: TextEdit = $HBoxContainer/TranslatedTextEdit
@onready var translation_mode: OptionButton = %TranslationMode
var selected_mode = null
var translate_flowery = {
	"move": "jarona",
	"moving": "jaronaing",
	"mo-orange": "ja-orange",
	"mo-kidding": "ja-kidding",
	"ralsei": "raly",
	"asgore": "gorey",
	"human": "my human",
	"king": "my king",
	"sus": "sustingus",
	"here i come": "here i come sanfrandisco",
	"wind": "mysterious wind",
	"suck it up": "suckle it up",
	"i think i found": "i think i found a glue",
	"grown like a": "grown like a turnip"
}

func _on_english_text_edit_text_changed() -> void:
	update_translation_side()

func update_translation_side():
	match translation_mode.selected:
		0:
			selected_mode = null
		1:
			selected_mode = translate_flowery
	var translated_text = english_text_edit.text
	if selected_mode == null:
		translated_text_edit.text = english_text_edit.text
		return
	for item in selected_mode:
		translated_text = translated_text.replace(str(item).to_upper(), str(translate_flowery[item]).to_upper())
		translated_text = translated_text.replace(str(item).to_lower(), str(translate_flowery[item]).to_lower())
		translated_text = translated_text.replace(str(item).capitalize(), str(translate_flowery[item]).capitalize())
	translated_text_edit.text = translated_text


func _on_translation_mode_item_selected(_index: int) -> void:
	update_translation_side()
	pass # Replace with function body.
