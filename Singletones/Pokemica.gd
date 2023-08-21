extends Node

var number = 1
var last_username = ""
var highscore = 1
var highscore_username = ""
var highscore_data = null
var old_highscore_data = null
var pokemons = {
	"1": "Bulbasaur",
	"2": "Ivysaur",
	"3": "Venusaur",
	"4": "Charmander",
	"5": "Charmeleon",
	"6": "Charizard",
	"7": "Squirtle",
	"8": "Wartortle",
	"9": "Blastoise",
	"10": "Caterpie",
	"11": "Metapod",
	"12": "Butterfree",
	"13": "Weedle",
	"14": "Kakuna",
	"15": "Beedrill",
	"16": "Pidgey",
	"17": "Pidgeotto",
	"18": "Pidgeot",
	"19": "Rattata",
	"20": "Raticate",
	"21": "Spearow",
	"22": "Fearow",
	"23": "Ekans",
	"24": "Arbok",
	"25": "Pikachu",
	"26": "Raichu",
	"27": "Sandshrew",
	"28": "Sandslash",
	"29": "Nidoran♀",
	"30": "Nidorina",
	"31": "Nidoqueen",
	"32": "Nidoran♂",
	"33": "Nidorino",
	"34": "Nidoking",
	"35": "Clefairy",
	"36": "Clefable",
	"37": "Vulpix",
	"38": "Ninetales",
	"39": "Jigglypuff",
	"40": "Wigglytuff",
	"41": "Zubat",
	"42": "Golbat",
	"43": "Oddish",
	"44": "Gloom",
	"45": "Vileplume",
	"46": "Paras",
	"47": "Parasect",
	"48": "Venonat",
	"49": "Venomoth",
	"50": "Diglett",
	"51": "Dugtrio",
	"52": "Meowth",
	"53": "Persian",
	"54": "Psyduck",
	"55": "Golduck",
	"56": "Mankey",
	"57": "Primeape",
	"58": "Growlithe",
	"59": "Arcanine",
	"60": "Poliwag",
	"61": "Poliwhirl",
	"62": "Poliwrath",
	"63": "Abra",
	"64": "Kadabra",
	"65": "Alakazam",
	"66": "Machop",
	"67": "Machoke",
	"68": "Machamp",
	"69": "Bellsprout",
	"70": "Weepinbell",
	"71": "Victreebel",
	"72": "Tentacool",
	"73": "Tentacruel",
	"74": "Geodude",
	"75": "Graveler",
	"76": "Golem",
	"77": "Ponyta",
	"78": "Rapidash",
	"79": "Slowpoke",
	"80": "Slowbro",
	"81": "Magnemite",
	"82": "Magneton",
	"83": "Farfetch'd",
	"84": "Doduo",
	"85": "Dodrio",
	"86": "Seel",
	"87": "Dewgong",
	"88": "Grimer",
	"89": "Muk",
	"90": "Shellder",
	"91": "Cloyster",
	"92": "Gastly",
	"93": "Haunter",
	"94": "Gengar",
	"95": "Onix",
	"96": "Drowzee",
	"97": "Hypno",
	"98": "Krabby",
	"99": "Kingler",
	"100": "Voltorb",
	"101": "Electrode",
	"102": "Exeggcute",
	"103": "Exeggutor",
	"104": "Cubone",
	"105": "Marowak",
	"106": "Hitmonlee",
	"107": "Hitmonchan",
	"108": "Lickitung",
	"109": "Koffing",
	"110": "Weezing",
	"111": "Rhyhorn",
	"112": "Rhydon",
	"113": "Chansey",
	"114": "Tangela",
	"115": "Kangaskhan",
	"116": "Horsea",
	"117": "Seadra",
	"118": "Goldeen",
	"119": "Seaking",
	"120": "Staryu",
	"121": "Starmie",
	"122": "Mr. Mime",
	"123": "Scyther",
	"124": "Jynx",
	"125": "Electabuzz",
	"126": "Magmar",
	"127": "Pinsir",
	"128": "Tauros",
	"129": "Magikarp",
	"130": "Gyarados",
	"131": "Lapras",
	"132": "Ditto",
	"133": "Eevee",
	"134": "Vaporeon",
	"135": "Jolteon",
	"136": "Flareon",
	"137": "Porygon",
	"138": "Omanyte",
	"139": "Omastar",
	"140": "Kabuto",
	"141": "Kabutops",
	"142": "Aerodactyl",
	"143": "Snorlax",
	"144": "Articuno",
	"145": "Zapdos",
	"146": "Moltres",
	"147": "Dratini",
	"148": "Dragonair",
	"149": "Dragonite",
	"150": "Mewtwo",
	"151": "Mew"
}
var settings


# Called when the node enters the scene tree for the first time.
func _refreshSettings():
	settings = {
		"minBanTime": $"../Juego/Panel/VBoxContainer/HBoxContainer/minBanTime".value,
		"banTimeMultiplier": $"../Juego/Panel/VBoxContainer/HBoxContainer2/banTimeMulti".value,
		"banPlayerWithCurrentNumber":
		$"../Juego/Panel/VBoxContainer/HBoxContainer3/banPlayerWithCurrentNumber".pressed,
		"allowBanMods": $"../Juego/Panel/VBoxContainer/HBoxContainer6/allowBanMods".pressed,
		"temporalVip": $"../Juego/Panel/VBoxContainer/HBoxContainer7/temporalVip".pressed,
		"allowModsPlay": $"../Juego/Panel/VBoxContainer/HBoxContainer5/allowModsPlay".pressed,
		"banPlayerWithCurrentNumberTime":
		$"../Juego/Panel/VBoxContainer/HBoxContainer4/banPlayerWithCurrentNumberTime".value
	}
#	loadFile()


func _ready():
	$"../TwitchChat".connect("new_message", self, "_get_message")


func _process(delta):
	if $"../TwitchChat".anonimous_connected:
		$"../Juego/Panel/VBoxContainer/HBoxContainer9/connectionStatus".color = Color.gray
		$"../Juego/Panel/VBoxContainer/HBoxContainer8/anonimousConnectionStatus".color = Color.green
	if $"../TwitchChat".auth_connected:
		$"../Juego/Panel/VBoxContainer/HBoxContainer9/connectionStatus".color = Color.green
		$"../Juego/Panel/VBoxContainer/HBoxContainer8/anonimousConnectionStatus".color = Color.gray


func _show_settings():
	#$"../Game/Panel/Sprite".connect()
	pass


func _get_message(data):
#	loadFile()
#	print(data)
#	print(pokemons[str(number)])
#	print($"../Juego/Principal/sprite_actual_pokemon".texture.resource_path)
#	var current_texture = str("res://Assets/Pokemons/", number, ".png")
#	print(current_texture)
#	$"../Juego/Principal/sprite_actual_pokemon".texture = load(current_texture)
#	$"../Juego/Principal/sprite_actual_pokemon".modulate = Color(0, 0, 0, 1)
#
#	number += 1

	if (
		!data.has("msg")
		|| !data.has("cmd")
		|| data.cmd != "PRIVMSG"
		|| !data.has("user-id")
		|| !data.has("username")
		|| !data.has("room-id")
	):
		return
	_refreshSettings()
	$"../Juego/Principal/sprite_actual_pokemon".texture = load("res://Assets/Pokemons/" + str(number) + ".png")
	var punishTime = settings.minBanTime + number * settings.banTimeMultiplier

	#allowBanMods
	var canBeBanned = true
	if data.has("badges") && "moderator" in data.badges:
		if !settings.allowBanMods:
			canBeBanned = false
	var result = str(data.msg)[0]
	if result == '#':
		
		print(str(data.msg).right(1))
		var mensajeLower = str(data.msg).right(1).to_lower()
		var pokemonLower = str(pokemons[str(number)].to_lower())
		#COMENZAR SOLO CON 1
		if number == 1 && mensajeLower != "bulbasaur":
			return
		#banPlayerWithCurrentNumber
		if last_username == data["username"]:
			if settings.banPlayerWithCurrentNumber && canBeBanned:
				$"../TwitchChat"._ban(data, settings.banPlayerWithCurrentNumberTime, "Cheater")
			return
		#allowModeratorsPlay
		if data.has("badges") && "moderator" in data.badges:
			if !settings.allowModsPlay:
				return
		if mensajeLower == pokemonLower:
			#Correcto
			correctAnswer(data)
			number += 1
			$"../Juego/Principal/sprite_actual_pokemon".texture = load("res://Assets/Pokemons/" + str(number) + ".png")
			last_username = data["username"]
		else:
			#Fallo
			number = 1
			last_username = ""
			$"../Juego/Principal/sprite_actual_pokemon".texture = load("res://Assets/Pokemons/" + str(number) + ".png")
			wrongAnswer(data)
			
			if settings.temporalVip:
				if(old_highscore_data &&  data['user-id'] != old_highscore_data['user-id'] ):
					$"../TwitchChat"._unvip(old_highscore_data)
				old_highscore_data = highscore_data
				$"../TwitchChat"._vip(highscore_data)
				
				if canBeBanned:
					$"../TwitchChat"._ban(data,punishTime,"Loser")



#func loadFile():
#	var bbdd = File.new()
#	bbdd.open("res://Assets/bbdd.json", File.READ)
#	var data = parse_json(bbdd.get_as_text())
#	pokemons = data
	
func correctAnswer(data):
	$"../Juego/Principal/Info/last/last_pokemon_box/sprite_last_pokemon".texture = load("res://Assets/Pokemons/" + str(number) + ".png")
	$"../Juego/Principal/Info/last/last_pokemon_box/sprite_last_pokemon".visible = true
	$"../Juego/Principal/Info/last/last_pokemon_data/last_pokemon".text = "#" + str(number) + " " + pokemons[str(number)]
	$"../Juego/Principal/Info/last/last_pokemon_data/last_pokemon".visible = true
	$"../Juego/Principal/Info/last/last_pokemon_data/last_user".text = data["username"]
	$"../Juego/Principal/Info/last/last_pokemon_data/last_user".visible = true
	if number == 1 && highscore == 1:
		$"../Juego/Principal/Info/highScore/highScore_pokemon_box/sprite_highScore".texture = load("res://Assets/Pokemons/" + str(number) + ".png")
		$"../Juego/Principal/Info/highScore/highScore_pokemon_box/sprite_highScore".visible = true
		$"../Juego/Principal/Info/highScore/highScore_pokemon_data/highscore_last_pokemon".text = "#" + str(number) + " " + pokemons[str(number)]
		$"../Juego/Principal/Info/highScore/highScore_pokemon_data/highscore_last_pokemon".visible = true
		$"../Juego/Principal/Info/highScore/highScore_pokemon_data/highscore_last_user".text = data["username"]
		$"../Juego/Principal/Info/highScore/highScore_pokemon_data/highscore_last_user".visible = true
	else:
		if highscore < (number + 1):
			highscore = (number + 1)
			highscore_username = data["username"]
			highscore_data = data
			$"../Juego/Principal/Info/highScore/highScore_pokemon_box/sprite_highScore".texture = load("res://Assets/Pokemons/" + str(number) + ".png")
			$"../Juego/Principal/Info/highScore/highScore_pokemon_data/highscore_last_pokemon".text = "#" + str(number) + " " + pokemons[str(number)]
			$"../Juego/Principal/Info/highScore/highScore_pokemon_data/highscore_last_user".text = highscore_username
	if number == 151:
		number = 0
		$"../Juego/Principal/Info/last/last_pokemon_box/sprite_last_pokemon".visible = false
		$"../Juego/Principal/Info/last/last_pokemon_data/last_pokemon".visible = false
		$"../Juego/Principal/Info/last/last_pokemon_data/last_user".visible = false
		$"../Juego/Principal/shameOn".text = data["username"] + " ha sido el que ha dicho el ultimo de pokemon"
		

func wrongAnswer(data):
	$"../Juego/Principal/Info/last/last_pokemon_box/sprite_last_pokemon".visible = false
	$"../Juego/Principal/Info/last/last_pokemon_data/last_pokemon".visible = false
	$"../Juego/Principal/Info/last/last_pokemon_data/last_user".visible = false
	$"../Juego/Principal/shameOn".text = "Shame on: " + data["username"]
	
	
