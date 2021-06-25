extends KinematicBody2D

var velocidade = Vector2(0,0)
var rapidez = 100
var resultante = Vector2(0,0)

const VELOCIDADE_MAX = 120
const ACELERACAO = 250
const ATRITO = 500

onready var animacao_jogador = $AnimationPlayer
onready var animacaoArvore = $AnimationTree
onready var animacaoEstado = animacaoArvore.get("parameters/playback")

func _physics_process(delta):
	
	resultante.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	resultante.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	resultante = resultante.normalized()
	
	if resultante != Vector2(0,0):
		animacaoArvore.set("parameters/Correndo/blend_position", resultante)
		animacaoArvore.set("parameters/Parado/blend_position", resultante)
		velocidade = velocidade.move_toward(resultante * VELOCIDADE_MAX, ACELERACAO * delta)
		
		animacaoEstado.travel("Correndo")
		
	else: 
		velocidade = velocidade.move_toward(Vector2.ZERO, ATRITO * delta)
		animacaoEstado.travel("Parado")
				
	move_and_slide(velocidade)	
	
