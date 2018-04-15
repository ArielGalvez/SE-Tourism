(import java.util.*)
(defglobal ?*VENTANA* = (fetch VENTANA))

(deffacts hechos_iniciales
    (Tarea ES iniciada)
)

(defrule reglaInicial
    (Tarea ES iniciada)
    =>
    (assert(Elija_rango_de_semana)
)
)
;;;;;;;;;;;;;; INICIO REGLAS BASE DEL CONOCIMIENTO ;;;;;;;;;;;

(defrule regla1
    (Elija_rango_de_semana)
    =>
   (?*VENTANA* setMemoriaTrabajo " 
    ===== nueva consulta =====
Sistema : Elija rango de semana:")

    (bind ?pregunta "Entre que rango de la semana se encuentra?")
    (bind ?opciones (new ArrayList))
    ;;;;;;;;;;;;;;;; Aqui elejimos los diferentes problemas a tratar
    (?opciones add  "Entre semana")
    (?opciones add  "Fin de semana")
    ; Aquie esta la respuesta obtenida y nos muestra el cuadro de informacion
    (bind ?respuesta (?*VENTANA* preguntar ?pregunta 0 0 ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))
    
    ;Aqui la opcion seleccionada de la interface preguntas
    (if (eq ?respuesta "Entre semana")
         then (assert(Lunes)))
    (if (eq ?respuesta "Fin de semana")
             then (assert(Sabado)))
)

;;;;;;;;;;;;;;;;  REGLAS DE BASE  ;;;;;;;;;;;;;;;;;;;;;
(defrule regla2
    (Lunes)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : Entre que dia de la semana se encuentra?")

    (bind ?pregunta "Entre que dia de la semana se encuentra?")
    (bind ?opciones (new ArrayList))
    (?opciones add  "Lunes")
    (?opciones add  "Martes")
    (?opciones add  "Miercoles")
    (?opciones add  "Jueves")
    (?opciones add  "Viernes")

    (bind ?respuesta (?*VENTANA* preguntar ?pregunta 0 0 ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))

    (if (eq ?respuesta "Lunes")
            then (assert(Semana_Lunes) ))
    (if (eq ?respuesta "Martes")	
            then (assert(Semana_Martes) ))
    (if (eq ?respuesta "Miercoles")
            then (assert(Semana_Miercoles) ))
    (if (eq ?respuesta "Jueves")
            then (assert(semana_Jueves) ))
    (if (eq ?respuesta "Viernes")
            then (assert(semana_viernes) ))        
)
(defrule regla3
    (Semana_Lunes)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : En su visita dese comprar algun recuerdo")
   
    (bind ?pregunta "En su visita dese comprar algun recuerdo?")
    (bind ?opciones (new ArrayList))
    (?opciones add  "SI")
    (?opciones add  "NO")

    (bind ?respuesta (?*VENTANA* preguntar ?pregunta 0 0 ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))

    (if (eq ?respuesta "SI")
            then (assert(Semana_Lunes_si) ))
    (if (eq ?respuesta "NO")
            then (assert(Semana_Lunes_no) ))
)
(defrule regla4
    (Semana_Martes)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : En su visita dese comprar algun recuerdo")
    (bind ?pregunta "En su visita dese comprar algun recuerdo?")
    (bind ?opciones (new ArrayList))
    (?opciones add  "SI")
    (?opciones add  "NO")

    (bind ?respuesta (?*VENTANA* preguntar ?pregunta 0 0 ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))

    (if (eq ?respuesta "SI")
            then (assert(Semana_Martes_si) ))
    (if (eq ?respuesta "NO")
            then (assert(Semana_Martes_no) ))
)

(defrule regla5
    (Semana_Miercoles)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : En su visita dese comprar algun recuerdo")
    (bind ?pregunta "En su visita dese comprar algun recuerdo?")
    (bind ?opciones (new ArrayList))
    (?opciones add  "SI")
    (?opciones add  "NO")

    (bind ?respuesta (?*VENTANA* preguntar ?pregunta 0 0 ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))

    (if (eq ?respuesta "SI")
            then (assert(Semana_Miercoles_si) ))
    (if (eq ?respuesta "NO")
            then (assert(Semana_Miercoles_no) ))
)

(defrule regla6
    (semana_Jueves)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : En su visita dese comprar algun recuerdo")
    (bind ?pregunta "En su visita dese comprar algun recuerdo?")
    (bind ?opciones (new ArrayList))
    (?opciones add  "SI")
    (?opciones add  "NO")

    (bind ?respuesta (?*VENTANA* preguntar ?pregunta 0 0 ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))

    (if (eq ?respuesta "SI")
            then (assert(semana_Jueves_si) ))
    (if (eq ?respuesta "NO")
            then (assert(semana_Jueves_no) ))
)
(defrule regla7
    (semana_viernes)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : En su visita dese comprar algun recuerdo")
    (bind ?pregunta "En su visita dese comprar algun recuerdo?")
    (bind ?opciones (new ArrayList))
    (?opciones add  "SI")
    (?opciones add  "NO")

    (bind ?respuesta (?*VENTANA* preguntar ?pregunta 0 0 ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))

    (if (eq ?respuesta "SI")
            then (assert(semana_viernes_si) ))
    (if (eq ?respuesta "NO")
            then (assert(semana_viernes_no) ))
)


(defrule regla8
    (Semana_Lunes_si)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : Entre que turno del dia se encuentra")
    (bind ?pregunta "Entre que turno del dia se encuentra?")
    (bind ?opciones (new ArrayList))
    (?opciones add  "mañana")
    (?opciones add  "tarde")
    (?opciones add  "noche")

    (bind ?respuesta (?*VENTANA* preguntar ?pregunta 0 0 ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))

    (if (eq ?respuesta "mañana")
            then (assert(Semana_Lunes_si_mañana) ))
    (if (eq ?respuesta "tarde")
            then (assert(Semana_Lunes_si_tarde) ))
    (if (eq ?respuesta "noche")
            then (assert(Semana_Lunes_si_noche) ))        
 )


(defrule regla9
    (Semana_Lunes_no)
    =>
     (?*VENTANA* setMemoriaTrabajo "Sistema : Entre que turno del dia se encuentra")
    (bind ?pregunta "Entre que turno del dia se encuentra?")
    (bind ?opciones (new ArrayList))
    (?opciones add  "mañana")
    (?opciones add  "tarde")
    (?opciones add  "noche")

    (bind ?respuesta (?*VENTANA* preguntar ?pregunta 0 0 ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))

    (if (eq ?respuesta "mañana")
            then (assert(Semana_Lunes_no_mañana) ))
    (if (eq ?respuesta "tarde")
            then (assert(Semana_Lunes_no_tarde) ))
    (if (eq ?respuesta "noche")
            then (assert(Semana_Lunes_no_noche) ))        
 )

(defrule regla10
    (Semana_Martes_si)
    =>
     (?*VENTANA* setMemoriaTrabajo "Sistema : Entre que turno del dia se encuentra")
    (bind ?pregunta "Entre que turno del dia se encuentra?")
    (bind ?opciones (new ArrayList))
    (?opciones add  "mañana")
    (?opciones add  "tarde")
    (?opciones add  "noche")

    (bind ?respuesta (?*VENTANA* preguntar ?pregunta 0 0 ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))

    (if (eq ?respuesta "mañana")
            then (assert(Semana_Martes_si_mañana) ))
    (if (eq ?respuesta "tarde")
            then (assert(Semana_Martes_si_tarde) ))
    (if (eq ?respuesta "noche")
            then (assert(Semana_Martes_si_noche) ))        
 )

(defrule regla11
    (Semana_Martes_no)
    =>
 (?*VENTANA* setMemoriaTrabajo "Sistema : Entre que turno del dia se encuentra")
    (bind ?pregunta "Entre que turno del dia se encuentra?")
    (bind ?opciones (new ArrayList))
    (?opciones add  "mañana")
    (?opciones add  "tarde")
    (?opciones add  "noche")

    (bind ?respuesta (?*VENTANA* preguntar ?pregunta 0 0 ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))

    (if (eq ?respuesta "mañana")
            then (assert(Semana_Martes_no_mañana) ))
    (if (eq ?respuesta "tarde")
            then (assert(Semana_Martes_no_tarde) ))
    (if (eq ?respuesta "noche")
            then (assert(Semana_Martes_no_noche) ))        
 )    


(defrule regla12
    (Semana_Miercoles_si)
    =>
  (?*VENTANA* setMemoriaTrabajo "Sistema : Entre que turno del dia se encuentra")
    (bind ?pregunta "Entre que turno del dia se encuentra?")
    (bind ?opciones (new ArrayList))
    (?opciones add  "mañana")
    (?opciones add  "tarde")
    (?opciones add  "noche")

    (bind ?respuesta (?*VENTANA* preguntar ?pregunta 0 0 ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))

    (if (eq ?respuesta "mañana")
            then (assert(Semana_Miercoles_si_mañana) ))
    (if (eq ?respuesta "tarde")
            then (assert(Semana_Miercoles_si_tarde) ))
    (if (eq ?respuesta "noche")
            then (assert(Semana_Miercoles_si_noche) ))        
 )   

(defrule regla13
    (Semana_Miercoles_no)
    =>
 (?*VENTANA* setMemoriaTrabajo "Sistema : Entre que turno del dia se encuentra")
    (bind ?pregunta "Entre que turno del dia se encuentra?")
    (bind ?opciones (new ArrayList))
    (?opciones add  "mañana")
    (?opciones add  "tarde")
    (?opciones add  "noche")

    (bind ?respuesta (?*VENTANA* preguntar ?pregunta 0 0 ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))

    (if (eq ?respuesta "mañana")
            then (assert(Semana_Miercoles_no_mañana) ))
    (if (eq ?respuesta "tarde")
            then (assert(Semana_Miercoles_no_tarde) ))
    (if (eq ?respuesta "noche")
            then (assert(Semana_Miercoles_no_noche) ))        
 ) 


(defrule regla14
    (semana_Jueves_si)
    =>
 (?*VENTANA* setMemoriaTrabajo "Sistema : Entre que turno del dia se encuentra")
    (bind ?pregunta "Entre que turno del dia se encuentra?")
    (bind ?opciones (new ArrayList))
    (?opciones add  "mañana")
    (?opciones add  "tarde")
    (?opciones add  "noche")

    (bind ?respuesta (?*VENTANA* preguntar ?pregunta 0 0 ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))

    (if (eq ?respuesta "mañana")
            then (assert(Semana_Jueves_si_mañana) ))
    (if (eq ?respuesta "tarde")
            then (assert(Semana_Jueves_si_tarde) ))
    (if (eq ?respuesta "noche")
            then (assert(Semana_Jueves_si_noche) ))        
 ) 

(defrule regla15
    (semana_Jueves_no)
    =>
 (?*VENTANA* setMemoriaTrabajo "Sistema : Entre que turno del dia se encuentra")
    (bind ?pregunta "Entre que turno del dia se encuentra?")
    (bind ?opciones (new ArrayList))
    (?opciones add  "mañana")
    (?opciones add  "tarde")
    (?opciones add  "noche")

    (bind ?respuesta (?*VENTANA* preguntar ?pregunta 0 0 ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))

    (if (eq ?respuesta "mañana")
            then (assert(Semana_Jueves_no_mañana) ))
    (if (eq ?respuesta "tarde")
            then (assert(Semana_Jueves_no_tarde) ))
    (if (eq ?respuesta "noche")
            then (assert(Semana_Jueves_no_noche) ))        
 )
(defrule regla16
    (semana_viernes_si)
    =>
 (?*VENTANA* setMemoriaTrabajo "Sistema : Entre que turno del dia se encuentra")
    (bind ?pregunta "Entre que turno del dia se encuentra?")
    (bind ?opciones (new ArrayList))
    (?opciones add  "mañana")
    (?opciones add  "tarde")
    (?opciones add  "noche")

    (bind ?respuesta (?*VENTANA* preguntar ?pregunta 0 0 ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))

    (if (eq ?respuesta "mañana")
            then (assert(Semana_Viernes_si_mañana) ))
    (if (eq ?respuesta "tarde")
            then (assert(Semana_Viernes_si_tarde) ))
    (if (eq ?respuesta "noche")
            then (assert(Semana_Viernes_si_noche) ))        
 )    


(defrule regla17
    (semana_viernes_no)
    =>
 (?*VENTANA* setMemoriaTrabajo "Sistema : Entre que turno del dia se encuentra")
    (bind ?pregunta "Entre que turno del dia se encuentra?")
    (bind ?opciones (new ArrayList))
    (?opciones add  "mañana")
    (?opciones add  "tarde")
    (?opciones add  "noche")

    (bind ?respuesta (?*VENTANA* preguntar ?pregunta 0 0 ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))

    (if (eq ?respuesta "mañana")
            then (assert(Semana_Viernes_no_mañana) ))
    (if (eq ?respuesta "tarde")
            then (assert(Semana_Viernes_no_tarde) ))
    (if (eq ?respuesta "noche")
            then (assert(Semana_Viernes_no_noche) ))        
 ) 

(defrule regla200
    (Semana_Lunes_si_mañana)
    =>
 (?*VENTANA* setMemoriaTrabajo "Sistema : En su día cotidiano a que le gustaria salir")
    (bind ?pregunta "En su día cotidiano a que le gustaria salir?")
    (bind ?opciones (new ArrayList))
    (?opciones add  "Mercado Cancha")
    (?opciones add  "Plazas")
    (?opciones add  "Museos")
    (bind ?respuesta (?*VENTANA* preguntar ?pregunta 0 0 ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))

    (if (eq ?respuesta "Mercado Cancha")
            then (assert(Lunes_si_mañana_Cancha) ))
    (if (eq ?respuesta "Plazas")
            then (assert(Lunes_si_mañana_Plazas) ))         
    (if (eq ?respuesta "Museos")
            then (assert(Lunes_si_mañana_Museos) ))        
) 

(defrule regla201
    (Semana_Lunes_si_tarde)
    =>
 (?*VENTANA* setMemoriaTrabajo "Sistema : En su día cotidiano a que le gustaria salir")
    (bind ?pregunta "En su día cotidiano a que le gustaria salir?")
    (bind ?opciones (new ArrayList))
    (?opciones add  "Mercado Cancha")
    (?opciones add  "Plazas")
    (?opciones add  "Museos")
    (bind ?respuesta (?*VENTANA* preguntar ?pregunta 0 0 ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))

    (if (eq ?respuesta "Mercado Cancha")
            then (assert(Lunes_si_tarde_Cancha) ))
    (if (eq ?respuesta "Plazas")
            then (assert(Lunes_si_tarde_Plazas) ))         
    (if (eq ?respuesta "Museos")
            then (assert(Lunes_si_tarde_Museos) ))        
) 

(defrule regla202
    (Semana_Lunes_si_noche)
    =>
 (?*VENTANA* setMemoriaTrabajo "Sistema : En su día cotidiano a que le gustaria salir")
    (bind ?pregunta "En su día cotidiano a que le gustaria salir?")
    (bind ?opciones (new ArrayList))
    (?opciones add  "Mercado Cancha")
    (bind ?respuesta (?*VENTANA* preguntar ?pregunta 0 0 ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))

    (if (eq ?respuesta "Mercado Cancha")
            then (assert(Lunes_si_noche_Cancha) ))             
)

(defrule regla203
    (Semana_Lunes_no_mañana)
    =>
 (?*VENTANA* setMemoriaTrabajo "Sistema : En su día cotidiano a que le gustaria salir")
    (bind ?pregunta "En su día cotidiano a que le gustaria salir?")
    (bind ?opciones (new ArrayList))
    (?opciones add  "Parques")
    (?opciones add  "Monumentos")
    (?opciones add  "Plazuelas")
    (?opciones add  "Cines")
    (?opciones add  "Teatros")
    (bind ?respuesta (?*VENTANA* preguntar ?pregunta 0 0 ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))

    (if (eq ?respuesta "Parques")
            then (assert(Lunes_no_mañana_Parques) ))
    (if (eq ?respuesta "Monumentos")
            then (assert(Lunes_no_mañana_Monumentos) ))        
    (if (eq ?respuesta "Plazuelas")
            then (assert(Lunes_no_mañana_Plazuelas) )) 
    (if (eq ?respuesta "Cines")
            then (assert(Lunes_no_mañana_Cines) ))
    (if (eq ?respuesta "Teatros")
            then (assert(Lunes_no_mañana_Teatros) ))        
)

(defrule regla204
    (Semana_Lunes_no_tarde)
    =>
 (?*VENTANA* setMemoriaTrabajo "Sistema : En su día cotidiano a que le gustaria salir")
    (bind ?pregunta "En su día cotidiano a que le gustaria salir?")
    (bind ?opciones (new ArrayList))
    (?opciones add  "Parques")
    (?opciones add  "Monumentos")
    (?opciones add  "Plazuelas")
    (?opciones add  "Teatros")
    (bind ?respuesta (?*VENTANA* preguntar ?pregunta 0 0 ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))

    (if (eq ?respuesta "Parques")
            then (assert(Lunes_no_tarde_Parques) ))
    (if (eq ?respuesta "Monumentos")
            then (assert(Lunes_no_tarde_Monumentos) ))        
    (if (eq ?respuesta "Plazuelas")
            then (assert(Lunes_no_tarde_Plazuelas) )) 
    (if (eq ?respuesta "Teatros")
            then (assert(Lunes_no_tarde_Teatros) ))        
)

(defrule regla205
    (Semana_Lunes_no_noche)
    =>
 (?*VENTANA* setMemoriaTrabajo "Sistema : En su día cotidiano a que le gustaria salir con seguridad por la noche")
    (bind ?pregunta "En su día cotidiano a que le gustaria salir con seguridad por la noche?")
    (bind ?opciones (new ArrayList))
    (?opciones add  "Cines")
    (?opciones add  "Monumentos")
    (?opciones add  "Teatros")
    (?opciones add  "Plazas")
    (bind ?respuesta (?*VENTANA* preguntar ?pregunta 0 0 ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))

    (if (eq ?respuesta "Cines")
            then (assert(Lunes_no_noche_Cines) ))
    (if (eq ?respuesta "Monumentos")
            then (assert(Lunes_no_noche_Monumentos) ))         
    (if (eq ?respuesta "Teatros")
            then (assert(Lunes_no_noche_Teatros) ))        
    (if (eq ?respuesta "Plazas")
            then (assert(Lunes_no_noche_Plazas) ))        
)

(defrule regla206
    (Semana_Martes_si_mañana)
    =>
 (?*VENTANA* setMemoriaTrabajo "Sistema : En su día cotidiano a que le gustaria salir")
    (bind ?pregunta "En su día cotidiano a que le gustaria salir?")
    (bind ?opciones (new ArrayList))
    (?opciones add  "Mercado Cancha")
    (?opciones add  "Plazas")
    (?opciones add  "Museos")
    (bind ?respuesta (?*VENTANA* preguntar ?pregunta 0 0 ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))

    (if (eq ?respuesta "Mercado Cancha")
            then (assert(Martes_si_mañana_Cancha) ))
    (if (eq ?respuesta "Plazas")
            then (assert(Martes_si_mañana_Plazas) ))         
    (if (eq ?respuesta "Museos")
            then (assert(Martes_si_mañana_Museos) ))        
)

(defrule regla207
    (Semana_Martes_si_tarde)
    =>
 (?*VENTANA* setMemoriaTrabajo "Sistema : En su día cotidiano a que le gustaria salir")
    (bind ?pregunta "En su día cotidiano a que le gustaria salir?")
    (bind ?opciones (new ArrayList))
    (?opciones add  "Mercado Cancha")
    (?opciones add  "Plazas")
    (?opciones add  "Museos")
    (bind ?respuesta (?*VENTANA* preguntar ?pregunta 0 0 ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))

    (if (eq ?respuesta "Mercado Cancha")
            then (assert(Martes_si_tarde_Cancha) ))
    (if (eq ?respuesta "Plazas")
            then (assert(Martes_si_tarde_Plazas) ))        
    (if (eq ?respuesta "Museos")
            then (assert(Martes_si_tarde_Museos) ))        
)
(defrule regla208
    (Semana_Martes_si_noche)
    =>
 (?*VENTANA* setMemoriaTrabajo "Sistema : En su día cotidiano a que le gustaria salir")
    (bind ?pregunta "En su día cotidiano a que le gustaria salir?")
    (bind ?opciones (new ArrayList))
    (?opciones add  "Mercado Cancha")
    (bind ?respuesta (?*VENTANA* preguntar ?pregunta 0 0 ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))

    (if (eq ?respuesta "Mercado Cancha")
            then (assert(Martes_si_noche_Cancha) ))                 
)

(defrule regla209
    (Semana_Martes_no_mañana)
    =>
 (?*VENTANA* setMemoriaTrabajo "Sistema : En su día cotidiano a que lugar le gustaria salir")
    (bind ?pregunta "En su día cotidiano a que le gustaria salir?")
    (bind ?opciones (new ArrayList))
    (?opciones add  "Parques")
    (?opciones add  "Monumentos")
    (?opciones add  "Plazuelas")
    (?opciones add  "Cines")
    (?opciones add  "Teatros")
    (bind ?respuesta (?*VENTANA* preguntar ?pregunta 0 0 ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))

    (if (eq ?respuesta "Parques")
            then (assert(Martes_no_mañana_Parques) ))
    (if (eq ?respuesta "Monumentos")
            then (assert(Martes_no_mañana_Monumentos) ))        
    (if (eq ?respuesta "Plazuelas")
            then (assert(Martes_no_mañana_Plazuelas) )) 
    (if (eq ?respuesta "Cines")
            then (assert(Martes_no_mañana_Cines) ))        
     (if (eq ?respuesta "Teatros")
            then (assert(Martes_no_mañana_Teatros) ))        
)

(defrule regla210
    (Semana_Martes_no_tarde)
    =>
 (?*VENTANA* setMemoriaTrabajo "Sistema : En su día cotidiano a que lugar le gustaria salir")
    (bind ?pregunta "En su día cotidiano a que le gustaria salir?")
    (bind ?opciones (new ArrayList))
    (?opciones add  "Parques")
    (?opciones add  "Monumentos")
    (?opciones add  "Plazuelas")
    (?opciones add  "Teatros")
    (bind ?respuesta (?*VENTANA* preguntar ?pregunta 0 0 ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))

    (if (eq ?respuesta "Parques")
            then (assert(Martes_no_tarde_Parques) ))
    (if (eq ?respuesta "Monumentos")
            then (assert(Martes_no_tarde_Monumentos) ))        
    (if (eq ?respuesta "Plazuelas")
            then (assert(Martes_no_tarde_Plazuelas) )) 
    (if (eq ?respuesta "Teatros")
            then (assert(Martes_no_tarde_Teatros) ))        
)
(defrule regla211
    (Semana_Martes_no_noche)
    =>
 (?*VENTANA* setMemoriaTrabajo "Sistema : En su día cotidiano a que lugar le gustaria salir con seguridad por la noche")
    (bind ?pregunta "En su día cotidiano a que lugar le gustaria salir con seguridad por la noche?")
    (bind ?opciones (new ArrayList))
    (?opciones add  "Parques")
    (?opciones add  "Monumentos")
    (?opciones add  "Teatros")
    (?opciones add  "Cines")
    (?opciones add  "Plazas")
    (bind ?respuesta (?*VENTANA* preguntar ?pregunta 0 0 ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))

    (if (eq ?respuesta "Parques")
            then (assert(Martes_no_noche_Parques) ))
    (if (eq ?respuesta "Monumentos")
            then (assert(Martes_no_noche_Monumentos) ))         
    (if (eq ?respuesta "Teatros")
            then (assert(Martes_no_noche_Teatros) ))
    (if (eq ?respuesta "Cines")
            then (assert(Martes_no_noche_Cines) ))        
    (if (eq ?respuesta "Plazas")
            then (assert(Martes_no_noche_Plazas) ))        
)


(defrule regla212
    (Semana_Miercoles_si_mañana)
    =>
 (?*VENTANA* setMemoriaTrabajo "Sistema : En su día cotidiano a que lugar le gustaria salir")
    (bind ?pregunta "En su día cotidiano a que le gustaria salir?")
    (bind ?opciones (new ArrayList))
    (?opciones add  "Mercado Cancha")
    (?opciones add  "Plazas")
    (?opciones add  "Museos")
    (bind ?respuesta (?*VENTANA* preguntar ?pregunta 0 0 ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))

    (if (eq ?respuesta "Mercado Cancha")
            then (assert(Miercoles_si_mañana_Cancha) ))
    (if (eq ?respuesta "Plazas")
            then (assert(Miercoles_si_mañana_Plazas) ))         
    (if (eq ?respuesta "Museos")
            then (assert(Miercoles_si_mañana_Museos) ))        
)
(defrule regla213
 (Semana_Miercoles_si_tarde)
    =>
 (?*VENTANA* setMemoriaTrabajo "Sistema : En su día cotidiano a que le gustaria salir")
    (bind ?pregunta "En su día cotidiano a que le gustaria salir?")
    (bind ?opciones (new ArrayList))
    (?opciones add  "Mercado Cancha")
    (?opciones add  "Plazas")
    (?opciones add  "Museos")
    (bind ?respuesta (?*VENTANA* preguntar ?pregunta 0 0 ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))

    (if (eq ?respuesta "Mercado Cancha")
            then (assert(Miercoles_si_tarde_Cancha) ))
    (if (eq ?respuesta "Plazas")
            then (assert(Miercoles_si_tarde_Plazas) ))        
    (if (eq ?respuesta "Museos")
            then (assert(Miercoles_si_tarde_Museos) ))        
)

(defrule regla214
    (Semana_Miercoles_si_noche)
    =>
 (?*VENTANA* setMemoriaTrabajo "Sistema : En su día cotidiano a que le gustaria salir")
    (bind ?pregunta "En su día cotidiano a que le gustaria salir?")
    (bind ?opciones (new ArrayList))
    (?opciones add  "Mercado Cancha")
    (bind ?respuesta (?*VENTANA* preguntar ?pregunta 0 0 ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))

    (if (eq ?respuesta "Mercado Cancha")
            then (assert(Miercoles_si_noche_Cancha) ))                 
)

(defrule regla215
    (Semana_Miercoles_no_mañana)
    =>
 (?*VENTANA* setMemoriaTrabajo "Sistema : En su día cotidiano a que lugar le gustaria salir")
    (bind ?pregunta "En su día cotidiano a que le gustaria salir?")
    (bind ?opciones (new ArrayList))
    (?opciones add  "Parques")
    (?opciones add  "Monumentos")
    (?opciones add  "Plazuelas")
    (?opciones add  "Cines")
    (?opciones add  "Teatros")
    (bind ?respuesta (?*VENTANA* preguntar ?pregunta 0 0 ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))

    (if (eq ?respuesta "Parques")
            then (assert(Miercoles_no_mañana_Parques) ))
    (if (eq ?respuesta "Monumentos")
            then (assert(Miercoles_no_mañana_Monumentos) ))        
    (if (eq ?respuesta "Plazuelas")
            then (assert(Miercoles_no_mañana_Plazuelas) )) 
    (if (eq ?respuesta "Cines")
            then (assert(Miercoles_no_mañana_Cines) ))        
    (if (eq ?respuesta "Teatros")
            then (assert(Miercoles_no_mañana_Teatros) ))        
)
(defrule regla216
    (Semana_Miercoles_no_tarde)
    =>
 (?*VENTANA* setMemoriaTrabajo "Sistema : En su día cotidiano a que lugar le gustaria salir")
    (bind ?pregunta "En su día cotidiano a que le gustaria salir?")
    (bind ?opciones (new ArrayList))
    (?opciones add  "Parques")
    (?opciones add  "Monumentos")
    (?opciones add  "Plazuelas")
    (?opciones add  "Cines")
    (?opciones add  "Teatros")
    (bind ?respuesta (?*VENTANA* preguntar ?pregunta 0 0 ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))

    (if (eq ?respuesta "Parques")
            then (assert(Miercoles_no_tarde_Parques) ))
    (if (eq ?respuesta "Monumentos")
            then (assert(Martes_no_tarde_Monumentos) ))        
    (if (eq ?respuesta "Plazuelas")
            then (assert(Miercoles_no_tarde_Plazuelas) )) 
    (if (eq ?respuesta "Cines")
            then (assert(Miercoles_no_tarde_Cines) ))        
    (if (eq ?respuesta "Teatros")
            then (assert(Miercoles_no_tarde_Teatros) ))        
)

(defrule regla217
    (Semana_Miercoles_no_noche)
    =>
 (?*VENTANA* setMemoriaTrabajo "Sistema : En su día cotidiano a que lugar le gustaria salir con seguridad por la noche")
    (bind ?pregunta "En su día cotidiano a que lugar le gustaria salir con seguridad por la noche?")
    (bind ?opciones (new ArrayList))
    (?opciones add  "Parques")
    (?opciones add  "Monumentos")
    (?opciones add  "Teatros")
    (?opciones add  "Cines")
    (?opciones add  "Plazas")
    (bind ?respuesta (?*VENTANA* preguntar ?pregunta 0 0 ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))

    (if (eq ?respuesta "Parques")
            then (assert(Miercoles_no_noche_Parques) ))
    (if (eq ?respuesta "Monumentos")
            then (assert(Miercoles_no_noche_Monumentos) ))         
    (if (eq ?respuesta "Teatros")
            then (assert(Miercoles_no_noche_Teatros) ))
    (if (eq ?respuesta "Cines")
            then (assert(Miercoles_no_noche_Cines) ))        
    (if (eq ?respuesta "Plazas")
            then (assert(Miercoles_no_noche_Plazas) ))        
)



;;;;;;;;;;;;;;;;;;;;;; REGLAS DE FIN DE SEMANA ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defrule regla18
    (Sabado)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : Entre que dia de descanso se ecuntra?")

    (bind ?pregunta "Entre que dia de descanso se encuentra?")
    (bind ?opciones (new ArrayList))
    (?opciones add  "Sabado")
    (?opciones add  "Domingo")
    
    (bind ?respuesta (?*VENTANA* preguntar ?pregunta 0 0 ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))

    (if (eq ?respuesta "Sabado")
            then (assert(fin_de_semana_sabado) ))
    (if (eq ?respuesta "Domingo")
            then (assert(fin_de_semana_domingo) ))
)
(defrule regla19
    (fin_de_semana_sabado)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : En su visita dese comprar algun recuerdo")
    (bind ?pregunta "En su visita dese comprar algun recuerdo?")
    (bind ?opciones (new ArrayList))
    (?opciones add  "SI")
    (?opciones add  "NO")

    (bind ?respuesta (?*VENTANA* preguntar ?pregunta 0 0 ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))

    (if (eq ?respuesta "SI")
            then (assert(sabado_si) ))
    (if (eq ?respuesta "NO")
            then (assert(sabado_no) ))
)
(defrule regla20
    (fin_de_semana_domingo)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : En su visita dese comprar algun recuerdo")
    (bind ?pregunta "En su visita dese comprar algun recuerdo?")
    (bind ?opciones (new ArrayList))
    (?opciones add  "SI")
    (?opciones add  "NO")

    (bind ?respuesta (?*VENTANA* preguntar ?pregunta 0 0 ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))

    (if (eq ?respuesta "SI")
            then (assert(domingo_si) ))
    (if (eq ?respuesta "NO")
            then (assert(domingo_no) ))
)

(defrule regla21
    (sabado_si)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : Entre que turno de su buen descanso se encuentra")
    (bind ?pregunta "Entre que turno de su buen descanso se encuentra?")
    (bind ?opciones (new ArrayList))
    (?opciones add  "Mañana")
    (?opciones add  "Tarde")
    (?opciones add  "Noche")

    (bind ?respuesta (?*VENTANA* preguntar ?pregunta 0 0 ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))

    (if (eq ?respuesta "Mañana")
            then (assert(sabado_mañana_si) ))
    (if (eq ?respuesta "Tarde")
            then (assert(sabado_tarde_si) ))
    (if (eq ?respuesta "Noche")
            then (assert(sabado_noche_si) ))        
)

(defrule regla100
    (sabado_mañana_si)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : Entre que turno de su buen descanso se encuentra")
    (bind ?pregunta "Entre que turno de su buen descanso se encuentra?")
    (bind ?opciones (new ArrayList))
    (?opciones add  "Mercado cancha")
    (?opciones add  "Plazas")
    (?opciones add  "Museos")

    (bind ?respuesta (?*VENTANA* preguntar ?pregunta 0 0 ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))

    (if (eq ?respuesta "Mercado cancha")
            then (assert(sabado_cancha_si) ))
    (if (eq ?respuesta "Plazas")
            then (assert(sabado_plazas_si) ))
    (if (eq ?respuesta "Museos")
            then (assert(sabado_museos_si) ))                
)

(defrule regla101
    (sabado_plazas_si)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : Entre que turno de su buen descanso se encuentra")
    (bind ?pregunta "Entre que turno de su buen descanso se encuentra?")
    (bind ?opciones (new ArrayList))
        (?opciones add  "14 de Septiembre")
        (?opciones add  "Colón")
        (?opciones add  "de las Banderas")
        (?opciones add  "Barba de Padilla")
        (?opciones add  "de la Recoleta")
        (?opciones add  "Cobija")
        (?opciones add  "Corazonistas")
    (bind ?respuesta (?*VENTANA* preguntar ?pregunta 0 0 ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))
    
    
    (if (eq ?respuesta "14 de Septiembre")
           then (?*VENTANA* setImagenResp "14_de_septiembre.JPG" )
       (?*VENTANA* setMemoriaTrabajo "Sistema : La conclusion final
       
    ===== FIN CONSULTA DE PLAZAS =====")   
    )
    (if (eq ?respuesta "Colón")
           then (?*VENTANA* setImagenResp "colon.JPG" )
       (?*VENTANA* setMemoriaTrabajo "Sistema : La conclusion final
       
    ===== FIN CONSULTA DE PLAZAS =====")   
    )
    (if (eq ?respuesta "de las Banderas")
           then (?*VENTANA* setImagenResp "banderas.JPG" )
       (?*VENTANA* setMemoriaTrabajo "Sistema : La conclusion final
       
    ===== FIN CONSULTA DE PLAZAS =====")   
    )
   (if (eq ?respuesta "Barba de Padilla")
           then (?*VENTANA* setImagenResp "padilla.JPG" )
       (?*VENTANA* setMemoriaTrabajo "Sistema : La conclusion final
       
    ===== FIN CONSULTA DE PLAZAS =====")   
    )                 
(if (eq ?respuesta "de la Recoleta")
           then (?*VENTANA* setImagenResp "recoleta.JPG" )
       (?*VENTANA* setMemoriaTrabajo "Sistema : La conclusion final
       
    ===== FIN CONSULTA DE PLAZAS =====")   
    )
(if (eq ?respuesta "Cobija")
           then (?*VENTANA* setImagenResp "cobija.JPG" )
       (?*VENTANA* setMemoriaTrabajo "Sistema : La conclusion final
       
    ===== FIN CONSULTA DE PLAZAS =====")   
    )
(if (eq ?respuesta "Corazonistas")
           then (?*VENTANA* setImagenResp "corazonistas.JPG" )
       (?*VENTANA* setMemoriaTrabajo "Sistema : La conclusion final
       
    ===== FIN CONSULTA DE PLAZAS =====")   
    )
)

(defrule regla102
    (sabado_cancha_si)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : los fines de semana la Cancha hay mucho mas cosas y mas gente")
    (bind ?pregunta "los fines de semana la Cancha hay mucho mas cosas y mas gente")
    (bind ?opciones (new ArrayList))
        (?opciones add  "Mercado Fidel Aranibar")
        (?opciones add  "Mercado Cancha")
        
    (bind ?respuesta (?*VENTANA* preguntar ?pregunta 0 0 ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))
    
    
    (if (eq ?respuesta "Mercado Fidel Aranibar")
           then (?*VENTANA* setImagenResp "cancha.JPG")
       (?*VENTANA* setMemoriaTrabajo "Sistema : La conclusion final
          ===== FIN CONSULTA DE PLAZAS =====")   
    )
    (if (eq ?respuesta "Mercado Cancha")
           then (?*VENTANA* setImagenResp "mercado_cancha.JPG")
       (?*VENTANA* setMemoriaTrabajo "Sistema : La conclusion final
          ===== FIN CONSULTA DE PLAZAS =====")   
    )   
)


(defrule regla22
    (sabado_no)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : Entre que turno de su buen descanso se encuentra")
    (bind ?pregunta "Entre que turno de su buen descanso se encuentra?")
    (bind ?opciones (new ArrayList))
    (?opciones add  "Mañana")
    (?opciones add  "Tarde")
    (?opciones add  "Noche")

    (bind ?respuesta (?*VENTANA* preguntar ?pregunta 0 0 ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))

    (if (eq ?respuesta "Mañana")
            then (assert(sabado_mañana_no) ))
    (if (eq ?respuesta "Tarde")
            then (assert(sabado_tarde_no) ))
    (if (eq ?respuesta "Noche")
            then (assert(sabado_noche_no) ))        
)

(defrule regla23
    (domingo_si)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : Entre que turno de su buen descanso se encuentra")
    (bind ?pregunta "Entre que turno de su buen descanso se encuentra?")
    (bind ?opciones (new ArrayList))
    (?opciones add  "Mañana")
    (?opciones add  "Tarde")
    (?opciones add  "Noche")

    (bind ?respuesta (?*VENTANA* preguntar ?pregunta 0 0 ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))

    (if (eq ?respuesta "Mañana")
            then (assert(domingo_mañana_si) ))
    (if (eq ?respuesta "Tarde")
            then (assert(domingo_tarde_si) ))
    (if (eq ?respuesta "Noche")
            then (assert(domingo_noche_si) ))        
)

(defrule regla24
    (domingo_no)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : Entre que turno de su buen descanso se encuentra")
    (bind ?pregunta "Entre que turno de su buen descanso se encuentra?")
    (bind ?opciones (new ArrayList))
    (?opciones add  "Mañana")
    (?opciones add  "Tarde")
    (?opciones add  "Noche")

    (bind ?respuesta (?*VENTANA* preguntar ?pregunta 0 0 ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))

    (if (eq ?respuesta "Mañana")
            then (assert(domingo_mañana_no) ))
    (if (eq ?respuesta "Tarde")
            then (assert(domingo_tarde_no) ))
    (if (eq ?respuesta "Noche")
            then (assert(domingo_noche_no) ))        
)

(defrule regla
    (domingo_si)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : Tiene la organización capacidad para obligar a")
    (?*VENTANA* setMemoriaTrabajo "                 otros, sean delincuentes o no? (intimidación)")
    (bind ?pregunta "Tiene la organización capacidad para obligar a
otros, sean delincuentes o no? (intimidación)")
    (bind ?opciones (new ArrayList))
    (?opciones add  "SI")
    (?opciones add  "NO")

    (bind ?respuesta (?*VENTANA* preguntar ?pregunta 0 0 ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))

    (if (eq ?respuesta "SI")
           then (?*VENTANA* setImagenResp "lavado.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema : La conclusion
1. Evitar el riesgo sobre el servicio ofrecido
2. Dar recomendaciones sobre este servicio a los clientes
3. Recomendaciones para las empresas que ofrezcan servicio de seguridad de billetes
    ===== FIN CONSULTA DE CRIMEN ORGANIZADO =====")   
    )

    (if (eq ?respuesta "NO")
           then (?*VENTANA* setImagenResp "lavado.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema : La conclusion
1. Dar recomendaciones sobre los riesgos de distribución
2. Dar recomendaciones sobre los canales de distribución
3. Evitar riesgos en los mercados
    ===== FIN CONSULTA DE CRIMEN ORGANIZADO =====")   
    )
)

(defrule regla
    (Lavado_baja_no)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : Tiene la organización capacidad para obligar a")
    (?*VENTANA* setMemoriaTrabajo "                 otros, sean delincuentes o no? (intimidación)")
    (bind ?pregunta "Tiene la organización capacidad para obligar a
otros, sean delincuentes o no? (intimidación)")
    (bind ?opciones (new ArrayList))
    (?opciones add  "SI")
    (?opciones add  "NO")

    (bind ?respuesta (?*VENTANA* preguntar ?pregunta 0 0 ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))
    
    (if (eq ?respuesta "SI")
           then (?*VENTANA* setImagenResp "lavado.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema : La conclusion final
1. Dar recomendaciones para evitar recibir recursos ilicitos por medio 
    de cuentas por cobrar
2. Dar recomendaciones para la financiación de clientes, al momento 
    d retirar dinero
3. Contrarrestar el riesgo de operaciones de comercio exterior
    ===== FIN CONSULTA DE CRIMEN ORGANIZADO =====")   
    )

    (if (eq ?respuesta "NO")
           then (?*VENTANA* setImagenResp "lavado.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema : La conclusion final
1. Mejorar la politica de manejo de divisas
2. Luchar contra el lavado de activos; financiamiento del terrorismo 
    y financiamiento de la proliferación
3. Aplicar medidas preventivas para el sector financiero y otros 
    sectores designados
4. Establecer poderes y responsabilidades (por ejemplo. autoridades 
    investigativas, de orden publico y de supervisión) y otras 
    medidas institucionales
    ===== FIN CONSULTA DE CRIMEN ORGANIZADO =====")   
    )
)

(defrule regla
    (Lavado_media_si)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : Tiene la organización capacidad para obligar a")
    (?*VENTANA* setMemoriaTrabajo "                 otros, sean delincuentes o no? (intimidación)")
    (bind ?pregunta "Tiene la organización capacidad para obligar a
otros, sean delincuentes o no? (intimidación)")
    (bind ?opciones (new ArrayList))
    (?opciones add  "SI")
    (?opciones add  "NO")

    (bind ?respuesta (?*VENTANA* preguntar ?pregunta 0 0 ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))

    (if (eq ?respuesta "SI")
           then (?*VENTANA* setImagenResp "lavado.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema : La conclusion final
1. Mejorar la transparencia y la disponibilidad de la información de 
    titularidad de beneficio de las personas y estructuras juridicas
2. Debe prohibirse a las instituciones financieras que mantengan 
    cuentas anónimas o cuentas con nombres obviamente ficticios.
3. Identificar al cliente y verificar la identidad del cliente 
    utilizando documentos, datos o información confiable, de fuentes independientes.
    ===== FIN CONSULTA DE CRIMEN ORGANIZADO =====")  
    )

    (if (eq ?respuesta "NO")
           then (?*VENTANA* setImagenResp "lavado.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema : La conclusion final
1. Aplicar medidas preventivas para el sector financiero y otros 
    sectores designados
2. Dar recomendaciones para la financiación de clientes, al 
    momento d retirar dinero
3. Contrarrestar el riesgo de operaciones de comercio exterior
    ===== FIN CONSULTA DE CRIMEN ORGANIZADO =====")   
    )
)

(defrule regla
    (Lavado_media_no)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : Tiene la organización capacidad para obligar a")
    (?*VENTANA* setMemoriaTrabajo "                 otros, sean delincuentes o no? (intimidación)")
    (bind ?pregunta "Tiene la organización capacidad para obligar a
otros, sean delincuentes o no? (intimidación)")
    (bind ?opciones (new ArrayList))
    (?opciones add  "SI")
    (?opciones add  "NO")

    (bind ?respuesta (?*VENTANA* preguntar ?pregunta 0 0 ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))
    
    (if (eq ?respuesta "SI")
           then (?*VENTANA* setImagenResp "lavado.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema : La conclusion final
1. Asegurar que el lavado de activos y el financiamiento del 
    terrorismo sean delitos extraditables
2. Establecer poderes y responsabilidades (por ejemplo. 
    autoridades investigativas, de orden publico y de supervisión) 
    y otras medidas institucionales
3. Evitar el riesgo sobre el servicio ofrecido
    ===== FIN CONSULTA DE CRIMEN ORGANIZADO =====")   
    )

    (if (eq ?respuesta "NO")
           then (?*VENTANA* setImagenResp "lavado.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema : La conclusion final
1. Prohibir a las instituciones financieras el establecimiento 
    de sucursales u oficinas representativas en el pais en 
    cuestión o tomar en consideración el hecho de que la 
    sucursal u oficina representativa estaria en un pais 
    que no cuenta con adecuados sistemas
2. Exigir a las instituciones financieras que revisen y enmienden, 
    o si es necesario terminen, las relaciones corresponsales con 
    instituciones financieras en el pais dado
3. Exigir requisitos de auditoria externa mas profundos para los 
    grupos financieros con respecto a cualquiera de sus sucursales 
    y filiales ubicadas en el pais en cuestión
    ===== FIN CONSULTA DE CRIMEN ORGANIZADO =====")   
    )
)

(defrule regla
    (Lavado_alta_si)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : Tiene la organización capacidad para obligar a")
    (?*VENTANA* setMemoriaTrabajo "                 otros, sean delincuentes o no? (intimidación)")
    (bind ?pregunta "Tiene la organización capacidad para obligar a
otros, sean delincuentes o no? (intimidación)")
    (bind ?opciones (new ArrayList))
    (?opciones add  "SI")
    (?opciones add  "NO")

    (bind ?respuesta (?*VENTANA* preguntar ?pregunta 0 0 ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))

    (if (eq ?respuesta "SI")
           then (?*VENTANA* setImagenResp "lavado.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema : La conclusion final
1. Limitar las relaciones comerciales o transacciones financieras 
    con el pais identificado o personas identificadas en esa nación
2. Exigir requisitos de auditoria externa mas profundos para 
    los grupos financieros con respecto a cualquiera de sus sucursales 
    y filiales ubicadas en el pais en cuestión.
3. Mejorar la transparencia y la disponibilidad de la información de
     titularidad de beneficio de las personas y estructuras juridicas
    ===== FIN CONSULTA DE CRIMEN ORGANIZADO =====")   
    )

    (if (eq ?respuesta "NO")
           then (?*VENTANA* setImagenResp "lavado.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema : La conclusion final
1. Dar recomendaciones para la financiación de clientes, al 
    momento d retirar dinero
2. Aplicar medidas preventivas para el sector financiero y 
    otros sectores designados
3. Exigir requisitos de auditoria externa mas profundos para 
    los grupos financieros con respecto a cualquiera de sus 
    sucursales y filiales ubicadas en el pais en cuestión.
    ===== FIN CONSULTA DE CRIMEN ORGANIZADO =====")   
    )
)

(defrule regla
    (Lavado_alta_no)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : Tiene la organización capacidad para obligar a")
    (?*VENTANA* setMemoriaTrabajo "                 otros, sean delincuentes o no? (intimidación)")
    (bind ?pregunta "Tiene la organización capacidad para obligar a
otros, sean delincuentes o no? (intimidación)")
    (bind ?opciones (new ArrayList))
    (?opciones add  "SI")
    (?opciones add  "NO")

    (bind ?respuesta (?*VENTANA* preguntar ?pregunta 0 0 ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))
    
    (if (eq ?respuesta "SI")
           then (?*VENTANA* setImagenResp "lavado.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema : La conclusion final
1. Identificar el alcance de las redes criminales y/o la escala de 
    la criminalidad
2. Identificar y rastrear activos del crimen, fondos terroristas u 
    otros activos que estan sujetos, o pudieran estar sujetos, a decomiso
3. Desarrollar evidencia que pueda ser utilizada en procesos penales
4. mejorar la transparencia y la disponibilidad de la información de 
    titularidad de beneficio de las personas y estructuras juridicas
    ===== FIN CONSULTA DE CRIMEN ORGANIZADO =====")   
    )

    (if (eq ?respuesta "NO")
           then (?*VENTANA* setImagenResp "lavado.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema : La conclusion final
1. Prohibir a las instituciones financieras el establecimiento de 
    sucursales u oficinas representativas en el pais en cuestión 
    o tomar en consideración el hecho de que la sucursal u oficina 
    representativa estaria en un pais que no cuenta con adecuados sistemas
2. Debe prohibirse a las instituciones financieras que mantengan 
    cuentas anónimas o cuentas con nombres obviamente ficticios.
3. Aplicar medidas preventivas para el sector financiero y otros 
    sectores designados
    ===== FIN CONSULTA DE CRIMEN ORGANIZADO =====")   
    )
)

;;;;;;;;;;;;;;;;;;;;;; REGLAS DE CONTRABANDO ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defrule regla
    (Contrabando)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : De que tipo de crimen estamos hablando?")

    (bind ?pregunta "De que tipo de crimen estamos hablando?")
    (bind ?opciones (new ArrayList))
    (?opciones add  "Contrabando leve")
    (?opciones add  "Contrabando medio")
    (?opciones add  "Contrabando alto")

    (bind ?respuesta (?*VENTANA* preguntar ?pregunta 0 0 ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))

    (if (eq ?respuesta "Contrabando leve")
            then (assert(Contrabando_baja) ))
    (if (eq ?respuesta "Contrabando medio")
            then (assert(Contrabando_media) ))
    (if (eq ?respuesta "Contrabando alto")
            then (assert(Contrabando_alta) ))
)
(defrule regla
    (Contrabando_baja)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : En su visita dese comprar algun recuerdo")
    (?*VENTANA* setMemoriaTrabajo "                 solamente desea pasarla bien ?")
    (bind ?pregunta "En su visita dese comprar algun recuerdo
solamente desea pasarla bien ?")
    (bind ?opciones (new ArrayList))
    (?opciones add  "SI")
    (?opciones add  "NO")

    (bind ?respuesta (?*VENTANA* preguntar ?pregunta 0 0 ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))

    (if (eq ?respuesta "SI")
            then (assert(Contrabando_baja_si) ))
    (if (eq ?respuesta "NO")
            then (assert(Contrabando_baja_no) ))
)
(defrule regla
    (Contrabando_media)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : En su visita dese comprar algun recuerdo")
    (?*VENTANA* setMemoriaTrabajo "                 solamente desea pasarla bien ?")
    (bind ?pregunta "En su visita dese comprar algun recuerdo
solamente desea pasarla bien ?")
    (bind ?opciones (new ArrayList))
    (?opciones add  "SI")
    (?opciones add  "NO")

    (bind ?respuesta (?*VENTANA* preguntar ?pregunta 0 0 ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))

    (if (eq ?respuesta "SI")
            then (assert(Contrabando_media_si) ))
    (if (eq ?respuesta "NO")
            then (assert(Contrabando_media_no) ))
)

(defrule regla25
    (Contrabando_alta)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : En su visita dese comprar algun recuerdo")
    (?*VENTANA* setMemoriaTrabajo "                 solamente desea pasarla bien ?")
    (bind ?pregunta "En su visita dese comprar algun recuerdo
solamente desea pasarla bien ?")
    (bind ?opciones (new ArrayList))
    (?opciones add  "SI")
    (?opciones add  "NO")

    (bind ?respuesta (?*VENTANA* preguntar ?pregunta 0 0 ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))

    (if (eq ?respuesta "SI")
            then (assert(Contrabando_alta_si) ))
    (if (eq ?respuesta "NO")
            then (assert(Contrabando_alta_no) ))
)

(defrule regla26
    (Contrabando_baja_si)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : Tiene la organización capacidad para obligar a")
    (?*VENTANA* setMemoriaTrabajo "                 otros, sean delincuentes o no? (intimidación)")
    (bind ?pregunta "Tiene la organización capacidad para obligar a
otros, sean delincuentes o no? (intimidación)")
    (bind ?opciones (new ArrayList))
    (?opciones add  "SI")
    (?opciones add  "NO")

    (bind ?respuesta (?*VENTANA* preguntar ?pregunta 0 0 ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))

    (if (eq ?respuesta "SI")
           then (?*VENTANA* setImagenResp "contrabando.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema : La conclusion final
1. Evitar que personas inescrupulosas se dediquen a ese tipo de acto criminal.
2. Dar incentivos a personas ajenas para dar apoyo a militares en 
    cuestión a seguridad
3. Tener mas control en los puestos fronterizos por los militares
4. Incrementar los patrullajes en la zona de la frontera
    ===== FIN CONSULTA DE CRIMEN ORGANIZADO =====")   
    )

    (if (eq ?respuesta "NO")
           then (?*VENTANA* setImagenResp "contrabando.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema : La conclusion final
1. Realizar un control minucioso a la mercaderia que ingresa a Bolivia
2. Control en la aduana del pais de exportación, asi como el pais 
    de importación
3. Mas control en la aduana
    ===== FIN CONSULTA DE CRIMEN ORGANIZADO =====")   
    )
)

(defrule regla27
    (Contrabando_baja_no)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : Tiene la organización capacidad para obligar a")
    (?*VENTANA* setMemoriaTrabajo "                 otros, sean delincuentes o no? (intimidación)")
    (bind ?pregunta "Tiene la organización capacidad para obligar a
otros, sean delincuentes o no? (intimidación)")
    (bind ?opciones (new ArrayList))
    (?opciones add  "SI")
    (?opciones add  "NO")

    (bind ?respuesta (?*VENTANA* preguntar ?pregunta 0 0 ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))
    
    (if (eq ?respuesta "SI")
           then (?*VENTANA* setImagenResp "contrabando.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema : La conclusion final
1. Turnos mas rigurosos de control
2. Verificación con animales como perros para el control
3. Importaciones correctas y sin demoras
    ===== FIN CONSULTA DE CRIMEN ORGANIZADO =====")   
    )

    (if (eq ?respuesta "NO")
           then (?*VENTANA* setImagenResp "contrabando.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema : La conclusion final
1. Compra y venta de productos nacionales
2. Fomentar la calidad de productos de la mano de obra de Bolivia
3. Precios acordes a la oferta y demanda de nuestro pais en cuanto 
    a los productos nacionales contra los productos extranjeros
    ===== FIN CONSULTA DE CRIMEN ORGANIZADO =====")   
    )
)

(defrule regla28
    (Contrabando_media_si)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : Tiene la organización capacidad para obligar a")
    (?*VENTANA* setMemoriaTrabajo "                 otros, sean delincuentes o no? (intimidación)")
    (bind ?pregunta "Tiene la organización capacidad para obligar a
otros, sean delincuentes o no? (intimidación)")
    (bind ?opciones (new ArrayList))
    (?opciones add  "SI")
    (?opciones add  "NO")

    (bind ?respuesta (?*VENTANA* preguntar ?pregunta 0 0 ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))

    (if (eq ?respuesta "SI")
           then (?*VENTANA* setImagenResp "contrabando.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema : La conclusion final
1. Implementar con materiales e insumos de armas a los militares 
    para contrarrestar a los grandes contrabandeares
2. Implementar de luces infrarrojos en las fronteras y detectar 
    los camiones de contrabando
3. Dar un inventario de los camiones que salen con mercaderia 
    de la aduana extranjera
4. Tener controles en distintos puntos de la carretera
    ===== FIN CONSULTA DE CRIMEN ORGANIZADO =====")  
    )

    (if (eq ?respuesta "NO")
           then (?*VENTANA* setImagenResp "contrabando.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema : La conclusion final
1. Que los militares tengan turnos de control en puestos fronterizos
2. Instalación de camaras en lugares fundamentales
3. Que las camaras estan conectados a un servidor
    ===== FIN CONSULTA DE CRIMEN ORGANIZADO =====")   
    )
)

(defrule regla29
    (Contrabando_media_no)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : Tiene la organización capacidad para obligar a")
    (?*VENTANA* setMemoriaTrabajo "                 otros, sean delincuentes o no? (intimidación)")
    (bind ?pregunta "Tiene la organización capacidad para obligar a
otros, sean delincuentes o no? (intimidación)")
    (bind ?opciones (new ArrayList))
    (?opciones add  "SI")
    (?opciones add  "NO")

    (bind ?respuesta (?*VENTANA* preguntar ?pregunta 0 0 ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))
    
    (if (eq ?respuesta "SI")
           then (?*VENTANA* setImagenResp "lavado.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema : La conclusion
1. Concientizar a la población y proponer un incentivo para 
    denunciar este crimen
2. Elaborar un plan tanto educativo como militar para la 
    captura de estos criminales
3. Dotación de armamiento y perros q detectan lugares o 
    cosas similares
    ===== FIN CONSULTA DE CRIMEN ORGANIZADO =====")   
    )

    (if (eq ?respuesta "NO")
           then (?*VENTANA* setImagenResp "contrabando.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema : La conclusion
1. Tener una bdd de los criminales y asi a ser seguimiento 
    a las familias q ue tienen sus datos reconocidos.
2. Actualizar las tecnologias de comunicación y dotar de 
    mejor implementación de comunicación(radios, brujulas , etc)
    ===== FIN CONSULTA DE CRIMEN ORGANIZADO =====")   
    )
)

(defrule regla30
    (Contrabando_alta_si)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : Tiene la organización capacidad para obligar a")
    (?*VENTANA* setMemoriaTrabajo "                 otros, sean delincuentes o no? (intimidación)")
    (bind ?pregunta "Tiene la organización capacidad para obligar a
otros, sean delincuentes o no? (intimidación)")
    (bind ?opciones (new ArrayList))
    (?opciones add  "SI")
    (?opciones add  "NO")

    (bind ?respuesta (?*VENTANA* preguntar ?pregunta 0 0 ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))

    (if (eq ?respuesta "SI")
           then (?*VENTANA* setImagenResp "contrabando.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema : La conclusion final
1. Realizar acuerdos entre paises para contrarrestar el contrabando
2. Medidas de seguridad mas acordes al tipo de frontera 
3. Militares y policias trabajar en conjunto
    ===== FIN CONSULTA DE CRIMEN ORGANIZADO =====")   
    )

    (if (eq ?respuesta "NO")
           then (?*VENTANA* setImagenResp "contrabando.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema : La conclusion final
1. Las personas esten mas comprometidas con el pais y asi poder 
    denunciar este acto crimina listico
2. Inversión del estado para el enfoque de matar el crimen 
    organizado de raiz
3. Mejorar la administracion entre empresas y asi poder 
    contrarrestar el crimen y mejorar los productos q se nos piden
    ===== FIN CONSULTA DE CRIMEN ORGANIZADO =====")   
    )
)

(defrule regla31
    (Contrabando_alta_no)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : Tiene la organización capacidad para obligar a")
    (?*VENTANA* setMemoriaTrabajo "                 otros, sean delincuentes o no? (intimidación)")
    (bind ?pregunta "Tiene la organización capacidad para obligar a
otros, sean delincuentes o no? (intimidación)")
    (bind ?opciones (new ArrayList))
    (?opciones add  "SI")
    (?opciones add  "NO")

    (bind ?respuesta (?*VENTANA* preguntar ?pregunta 0 0 ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))
    
    (if (eq ?respuesta "SI")
           then (?*VENTANA* setImagenResp "contrabando.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema : La conclusion final
1. Mejorar la producción y mediar los precios de los productos 
    con los precios de productos del exterior
2. Brindar información acerca de nuestro pais y de las cosas 
    que producen el crimen del contrabando
3. Equipamiento de punta a los militares ..para mejorar sus 
    destrezas y aptitudes en la lucha contra el contrabando
    ===== FIN CONSULTA DE CRIMEN ORGANIZADO =====")   
    )

    (if (eq ?respuesta "NO")
           then (?*VENTANA* setImagenResp "contrabando.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema : La conclusion final revisar
1. Mejorar la producción y mediar los precios de los productos 
    con los precios de productos del exterior
2. Brindar información acerca de nuestro pais y de las cosas 
    que producen el crimen del contrabando
3. Equipamiento de punta a los militares ..para mejorar sus 
    destrezas y aptitudes en la lucha contra el contrabando
    ===== FIN CONSULTA DE CRIMEN ORGANIZADO =====")   
    )
)




