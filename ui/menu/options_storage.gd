extends Resource
class_name OptionsStorage

enum Language{
	English,
	Chinese
}

enum Resolution{
	R1920x1080,
	R1152x648
}

enum MSAA{
	M0,
	M2,
	M4,
	M8
}

# Game
var language := Language.English

# Video
var full_screen := true
var msaa := MSAA.M2
var resolution := Resolution.R1920x1080
