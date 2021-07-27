extends Node2D


const BASE_CAMINHO_IMAGENS = "res://images/"
const MAX_PAGINAS = 5
const TODOS_OS_TEXTOS = ["Esse é o texto que será exibido para os jogadores.\n\nOutro parágrafo está sendo criado aqui, sem nenhuma informação melhor.\nPodemos quebrar ainda mais esse texto\n\n\n\nVárias linhas puladas...\n\n\n\nFinal?", 
				"Avançamos para a página 2\n\n\n\n\n Não temos muito texto aqui\n\n\n\n...", 
				"Bom, agora estamos na página 3, sem muitas novidades.\n\n\n\n\nMas continuamos podendo colocar textos",
				"Bem vindo à página 4 do álbum.\n\n\n\nMais texto pode ser exibido aqui, é claro.\n\n\n Final da página...",
				"E, por fim, chegamos à página 5, que não terá muito mais textos.\n\n\nA não ser...\n\n\n\n\n...mais algumas linhas..."]
				
var pagina_atual = 1
var todasImagens = []

onready var btnAvancar = $FundoAlbum/BtnAvancar
onready var btnVoltar = $FundoAlbum/BtnVoltar
onready var texto = $FundoAlbum/Texto
onready var imagemPlaceholder = $FundoAlbum/Imagem

# Called when the node enters the scene tree for the first time.
func _ready():	
	_carregar_imagens()
	btnVoltar.visible = false;
	btnAvancar.connect("pressed", self, "_avancar_pressed")
	btnVoltar.connect("pressed", self, "_voltar_pressed")
	_atualizar_componentes_visiveis()
	
func _carregar_imagens():
	for n in 5:
		var imageUrl = BASE_CAMINHO_IMAGENS + "image_placeholder-" + str(n)+".jpg"
		todasImagens.append(load(imageUrl));
	
func _atualizar_componentes_visiveis():
	btnVoltar.visible = pagina_atual > 1;
	btnAvancar.visible = pagina_atual < MAX_PAGINAS;
	texto.text = TODOS_OS_TEXTOS[pagina_atual-1]
	imagemPlaceholder.set_texture(todasImagens[pagina_atual-1])
	
func _avancar_pressed():
	pagina_atual +=1
	_atualizar_componentes_visiveis()	
	
	
func _voltar_pressed():
	pagina_atual -=1
	_atualizar_componentes_visiveis()

