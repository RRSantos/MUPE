extends Node2D



onready var botaoBob = $Controles/botaoBobEsponja
onready var botaoPatrick = $Controles/botaoPatrick
onready var botaoMostrarPanel = $Controles/botaoEsconderMostrarPanel
onready var panelPrincipal = $ContainerDialogo/PanelContainer
onready var imagemPatrick = $ContainerDialogo/PanelContainer/HBoxContainer/ImagemEsquerda
onready var imagemBob = $ContainerDialogo/PanelContainer/HBoxContainer/ImagemDireita
onready var texto = $ContainerDialogo/PanelContainer/HBoxContainer/MargemTexto/VBoxContainer/Texto
onready var botaoMaisTexto = $ContainerDialogo/PanelContainer/HBoxContainer/MargemTexto/VBoxContainer/MaisTexto




func _ready():
	botaoBob.connect("pressed", self, "_falaBob")
	botaoPatrick.connect("pressed", self, "_falaPatrick")
	botaoMostrarPanel.connect("pressed", self, "_mostrar_esconder_panel")
	botaoMaisTexto.connect("pressed", self, "_continuar_texto")
	panelPrincipal.hide()
	texto.connect("more_text_to_display", self, "_moreTextToDisplay")
	botaoMaisTexto.hide()

func _falaBob():
	imagemPatrick.hide()
	imagemBob.show()
	panelPrincipal.show()
	texto.show_animated_text("Olá, Patrick!\n\nTudo bem com você?")
	
func _moreTextToDisplay():
	print("Existe mais texto a ser escrito em tela!")	
	botaoMaisTexto.show()
	
	
func _falaPatrick():
	imagemPatrick.show()
	imagemBob.hide()
	panelPrincipal.show()
	texto.show_animated_text("Oi, Bob esponja.\n\nEstá tudo bem, sim! Obrigado por perguntar.\n\nEu não sei o que você está pensando agora, mas que tal a gente caçar águas vivas?\n\nDa última vez que caçamos, lembro que eu fiquei todo queimado e foi muito divertido, não foi?\n\n\nHa Ha Ha Ha Ha! Com certeza foi...")	
	
func _mostrar_esconder_panel():
	panelPrincipal.visible = !panelPrincipal.visible	

func _continuar_texto():
	texto.continue_animated_text()
	botaoMaisTexto.hide()

