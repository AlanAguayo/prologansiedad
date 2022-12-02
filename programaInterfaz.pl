%Librerias
:- use_module(library(pce)).
:- use_module(library(pce_util)).
:- pce_image_directory('./images').

%Recursos
resource(principal, image, image('principal.jpg')).
resource(indiceBajo, image, image('indiceBajo.jpg')).
resource(indiceModerado, image, image('indiceModerado.jpg')).
resource(advertencia, image, image('advertencia.jpg')).
resource(cesarea, image, image('cesarea.jpg')).

%Respuestas posibles
respuestaP1(0).
respuestaP1(1).
respuestaP1(2).
respuestaP1(3).
respuestaP2(si).
respuestaP2(no).

%Preguntas de la primera parte
preguntaP1('torpe_o_entumecido',X) :- respuestaP1(X).
preguntaP1('acalorado',X) :- respuestaP1(X).
preguntaP1('temblor_en_las_piernas',X) :- respuestaP1(X).
preguntaP1('incapaz_de_relajarse',X) :- respuestaP1(X).
preguntaP1('temor_a_que_ocurra_lo_peor',X) :- respuestaP1(X).
preguntaP1('mareos',X) :- respuestaP1(X).
preguntaP1('latidos_del_corazon_fuertes_o_acelerados',X) :- respuestaP1(X).
preguntaP1('inestable',X) :- respuestaP1(X).
preguntaP1('atemorizado_asustado',X) :- respuestaP1(X).
preguntaP1('nervioso',X) :- respuestaP1(X).
preguntaP1('sensacion_de_bloqueo',X) :- respuestaP1(X).
preguntaP1('temblor_en_las_manos',X) :- respuestaP1(X).
preguntaP1('inquieto_inseguro',X) :- respuestaP1(X).
preguntaP1('miedo_a_perder_el_control',X) :- respuestaP1(X).
preguntaP1('sensacion_de_ahogo',X) :- respuestaP1(X).
preguntaP1('temor_a_morir',X) :- respuestaP1(X).
preguntaP1('miedo',X) :- respuestaP1(X).
preguntaP1('problemas_digestion',X) :- respuestaP1(X).
preguntaP1('desvanecimientos',X) :- respuestaP1(X).
preguntaP1('rubor_facial',X) :- respuestaP1(X).
preguntaP1('sudores_frios_o_calientes',X) :- respuestaP1(X).

%Preguntas de la segunda parte
preguntaP2('dolor_en_el_pecho',X) :- respuestaP2(X).
preguntaP2('miedo_a_la_muerte',X) :- respuestaP2(X).
preguntaP2('escalofrios_o_enrojecimiento',X) :- respuestaP2(X).
preguntaP2('temblores_o_sacudidas',X) :- respuestaP2(X).
preguntaP2('nauseas',X) :- respuestaP2(X).
preguntaP2('sofocos',X) :- respuestaP2(X).
preguntaP2('sensacion_de_peligro',X) :- respuestaP2(X).
preguntaP2('pesadillas',X) :- respuestaP2(X).
preguntaP2('recuerdos_traumaticos',X) :- respuestaP2(X).
preguntaP2('mareos_o_desmayos',X) :- respuestaP2(X).
preguntaP2('falta_de_aliento_o_presion_en_la_garganta',X) :- respuestaP2(X).
preguntaP2('entumecimiento_u_hormigueo',X) :- respuestaP2(X).
preguntaP2('impotencia',X) :- respuestaP2(X).
preguntaP2('malestar_estomacal',X) :- respuestaP2(X).
preguntaP2('taquicardia_o_palpitaciones',X) :- respuestaP2(X).
preguntaP2('postura_rigida_y_voz_baja',X) :- respuestaP2(X).
preguntaP2('dificultad_de_contacto_visual',X) :- respuestaP2(X).
preguntaP2('sudoracion_excesiva',X) :- respuestaP2(X).
preguntaP2('movimientos_nerviosos',X) :- respuestaP2(X).
preguntaP2('irritable',X) :- respuestaP2(X).
preguntaP2('problemas_de_concentracion',X) :- respuestaP2(X).
preguntaP2('insomnio',X) :- respuestaP2(X).
preguntaP2('perdida_o_aumento_de_peso',X) :- respuestaP2(X).
preguntaP2('mala_memoria',X) :- respuestaP2(X).
preguntaP2('dolor_de_cabeza',X) :- respuestaP2(X).
preguntaP2('cansancio',X) :- respuestaP2(X).

%Ventana
comenzar() :-
    abrir_conexion,
    new(Ventana, dialog('Sistema Experto Ansiedad')),
    send(Ventana, size, size(900,600)),
    send(Ventana, append, new(TxtTitulo, text('Sistema Experto para detectar el indice de ansiedad y si existe algun transtorno de ansiedad'))),
    send(TxtTitulo, font, bold),
    send(TxtTitulo, alignment, center),
    send(TxtTitulo, colour, '#00299B'),
    send(Ventana, append, new(TxtSubtitulo, text('Sistema experto que ayuda a los psicologos en definir si una persona tiene niveles graves de ansiedad y si por este puede desarrollar un transtorno.'))),
    send(TxtSubtitulo, alignment, center),
    send(Ventana, append, new(TxtEquipo, text('Equipo JAL.'))),
    send(TxtEquipo, alignment, center),
    send(TxtEquipo, colour, '#0042FB'),
    send(TxtSubtitulo, alignment, center),
    send(Ventana, append, new(TxtPaciente, text('Ingrese los datos del paciente'))),
    send(TxtPaciente, alignment, center),
    new(Nombre, text_item(nombre)),
    new(Apellido, text_item(apellidos)),
    send(Ventana, append, new(BtnDiagnostico, button(realizar_diagnostico, and(message(@prolog, diagnostico_indice, Nombre?selection, Apellido?selection, Ventana))))),
    send(Ventana, append, Nombre),
    send(Ventana, append, Apellido),
    new(Figura, figure),
    new(Bitmap, bitmap(resource(principal), @on)),
    send(Bitmap, name, 1),
    send(Figura, display, Bitmap),
    send(Figura, status, 1),
    send(Ventana, display, Figura, point(250, 200)),
    send(Ventana, append, new(TxtTInformacion, text('\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n
    INFORMACION SOBRE LA ANSIEDAD.
    \n\n\n\n\n\n\n\n\n\n'))),
    send(TxtTInformacion, font, bold),
    send(TxtTInformacion, alignment, center),
    send(Ventana, append, new(TxtCInformacion, text('\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n
    La ansiedad es una emocion normal. Es la forma en que su cerebro reacciona al estres y lo alerta de un peligro potencial que se avecina.
    
    Es normal que la ansiedad se presente cuando estamos en situaciones que provocan estres como trabajo.
    
    Pero los trastornos de ansiedad son diferentes. Son un grupo de enfermedades mentales que causan ansiedad y miedo constantes y abrumadores. 
    La ansiedad excesiva puede hacer que evite el trabajo, la escuela, las reuniones familiares y otras situaciones sociales que pueden 
    desencadenar o empeorar sus sintomas.
    
    Con tratamiento, muchas personas con trastornos de ansiedad pueden controlar sus sentimientos.\n '))),
    send(TxtCInformacion, alignment, center),
    send(BtnDiagnostico, open),
    send(Ventana,open).

%Ventana diagnostico del indice
diagnostico_indice(Nombre, Apellido, VentanaD) :-
    new(Ventana, dialog('Diagnostico indice de ansiedad')),
    send(Ventana, size, size(440,630)),
    send_list(Ventana, append, [
        new(P1, menu(torpe_o_entumecido)),
        new(P2, menu(acalorado)),
        new(P3, menu(temblor_en_las_piernas)),
        new(P4, menu(incapaz_de_relajarse)),
        new(P5, menu(temor_a_que_ocurra_lo_peor)),
        new(P6, menu(mareos)),
        new(P7, menu(latidos_del_corazon_fuertes_o_acelerados)),
        new(P8, menu(inestable)),
        new(P9, menu(atemorizado_asustado)),
        new(P10, menu(nervioso)),
        new(P11, menu(sensacion_de_bloqueo)),
        new(P12, menu(temblor_en_las_manos)),
        new(P13, menu(inquieto_inseguro)),
        new(P14, menu(miedo_a_perder_el_control)),
        new(P15, menu(sensacion_de_ahogo)),
        new(P16, menu(temor_a_morir)),
        new(P17, menu(miedo)),
        new(P18, menu(problemas_digestion)),
        new(P19, menu(desvanecimientos)),
        new(P20, menu(rubor_facial)),
        new(P21, menu(sudores_frios_o_calientes))]),
    send_list(P1, append, [0, 1, 2, 3]),
    send_list(P2, append, [0, 1, 2, 3]),
    send_list(P3, append, [0, 1, 2, 3]),
    send_list(P4, append, [0, 1, 2, 3]),
    send_list(P5, append, [0, 1, 2, 3]),
    send_list(P6, append, [0, 1, 2, 3]),
    send_list(P7, append, [0, 1, 2, 3]),
    send_list(P8, append, [0, 1, 2, 3]),
    send_list(P9, append, [0, 1, 2, 3]),
    send_list(P10, append, [0, 1, 2, 3]),
    send_list(P11, append, [0, 1, 2, 3]),
    send_list(P12, append, [0, 1, 2, 3]),
    send_list(P13, append, [0, 1, 2, 3]),
    send_list(P14, append, [0, 1, 2, 3]),
    send_list(P15, append, [0, 1, 2, 3]),
    send_list(P16, append, [0, 1, 2, 3]),
    send_list(P17, append, [0, 1, 2, 3]),
    send_list(P18, append, [0, 1, 2, 3]),
    send_list(P19, append, [0, 1, 2, 3]),
    send_list(P20, append, [0, 1, 2, 3]),
    send_list(P21, append, [0, 1, 2, 3]),
    send(Ventana, append, new(BtnEnviar, button(resultados, and(message(@prolog, preguntasP1, P1?selection, P2?selection, P3?selection, P4?selection, P5?selection, P6?selection, P7?selection, P8?selection, P9?selection, P10?selection, P11?selection, P12?selection, P13?selection, P14?selection, P15?selection, P16?selection, P17?selection, P18?selection, P19?selection, P20?selection, P21?selection, Nombre, Apellido,Ventana))))),
    send(BtnEnviar, open),
    send(VentanaD, destroy).

%Ventana indice de ansiedad bajo
indice_bajo(VentanaD) :-
    new(Ventana, dialog('Indice de ansiedad')),
    send(Ventana, size, size(770,310)),
    send(Ventana, append, new(TxtTexto, text('El indice de ansiedad es: '))),
    send(TxtTexto, font, bold),
    send(TxtTexto, alignment, center),
    send(Ventana, append, new(TxtIndice, text('Bajo'))),
    send(TxtIndice, font, bold),
    send(TxtIndice, alignment, center),
    send(TxtIndice, colour, '#0042FB'),
    send(Ventana, append, new(TxtRecomendacion, text('Es un indice de ansiedad muy bajo, lo recomendable es solo esperar a que este sentimiento desaparesca durante la semana.'))),
    send(TxtRecomendacion, alignment, center),
    send(Ventana,append,new(BtnRegresar, button(regresar, and(message(@prolog, comenzar), and(message(@prolog, cerrar_advertencia, Ventana)))))),
    send(BtnRegresar, open),
    new(Figura, figure),
    new(Bitmap, bitmap(resource(indiceBajo), @on)),
    send(Bitmap, name, 1),
    send(Figura, display, Bitmap),
    send(Figura, status, 1),
    send(Ventana, display, Figura, point(220, 110)),
    send(Ventana, open),
    send(VentanaD, destroy).

%Ventana indice de ansiedad moderada
indice_moderado(VentanaD) :-
    new(Ventana, dialog('Indice de ansiedad')),
    send(Ventana, size, size(330,320)),
    send(Ventana, append, new(TxtTexto, text('El indice de ansiedad es: '))),
    send(TxtTexto, font, bold),
    send(TxtTexto, alignment, center),
    send(Ventana, append, new(TxtIndice, text('Moderada'))),
    send(TxtIndice, font, bold),
    send(TxtIndice, alignment, center),
    send(TxtIndice, colour, '#0042FB'),
    send(Ventana, append, new(TxtRecomendacion, text('Se recomienda esperar instrucciones de un psicologo.'))),
    send(TxtRecomendacion, alignment, center),
    send(Ventana,append,new(BtnRegresar, button(regresar, and(message(@prolog, comenzar), and(message(@prolog, cerrar_advertencia, Ventana)))))),
    send(BtnRegresar, open),
    new(Figura, figure),
    new(Bitmap, bitmap(resource(indiceModerado), @on)),
    send(Bitmap, name, 1),
    send(Figura, display, Bitmap),
    send(Figura, status, 1),
    send(Ventana, display, Figura, point(50, 110)),
    send(Ventana, open),
    send(VentanaD, destroy).

%Ventana indice de ansiedad severas
indice_severo(Nombre, Apellido,VentanaD) :-
    new(Ventana, dialog('Indice de ansiedad')),
    send(Ventana, size, size(370,350)),
    send(Ventana, append, new(TxtTexto, text('El indice de ansiedad es: '))),
    send(TxtTexto, font, bold),
    send(TxtTexto, alignment, center),
    send(Ventana, append, new(TxtIndice, text('Severa'))),
    send(TxtIndice, font, bold),
    send(TxtIndice, alignment, center),
    send(TxtIndice, colour, '#0042FB'),
    send(Ventana, append, new(TxtRecomendacion, text('Contesta las siguientes preguntas para encontrar algun tipo de transtorno'))),
    send(TxtRecomendacion, alignment, center),
    send_list(Ventana, append, [
    new(P1, menu(dolor_en_el_pecho)),
    new(P2, menu(miedo_a_la_muerte)),
    new(P3, menu(escalofrios_o_enrojecimiento)),
    new(P4, menu(temblores_o_sacudidas)),
    new(P5, menu(nauseas)),
    new(P6, menu(sofocos)),
    new(P7, menu(sensacion_de_peligro)),
    new(P8, menu(pesadillas)),
    new(P9, menu(recuerdos_traumaticos)),
    new(P10, menu(mareos_o_desmayos)),
    new(P11, menu(falta_de_aliento_o_presion_en_la_garganta)),
    new(P12, menu(entumecimiento_u_hormigueo)),
    new(P13, menu(impotencia)),
    new(P14, menu(malestar_estomacal)),
    new(P15, menu(taquicardia_o_palpitaciones)),
    new(P16, menu(postura_rigida_y_voz_baja)),
    new(P17, menu(dificultad_de_contacto_visual)),
    new(P18, menu(sudoracion_excesiva)),
    new(P19, menu(movimientos_nerviosos)),
    new(P20, menu(irritable)),
    new(P21, menu(problemas_de_concentracion)),
    new(P22, menu(insomnio)),
    new(P23, menu(perdida_o_aumento_de_peso)),
    new(P24, menu(mala_memoria)),
    new(P25, menu(dolor_de_cabeza)),
    new(P26, menu(cansancio))]),
send_list(P1, append, ['SI','NO']),
send_list(P2, append, ['SI','NO']),
send_list(P3, append, ['SI','NO']),
send_list(P4, append, ['SI','NO']),
send_list(P5, append, ['SI','NO']),
send_list(P6, append, ['SI','NO']),
send_list(P7, append, ['SI','NO']),
send_list(P8, append, ['SI','NO']),
send_list(P9, append, ['SI','NO']),
send_list(P10, append, ['SI','NO']),
send_list(P11, append, ['SI','NO']),
send_list(P12, append, ['SI','NO']),
send_list(P13, append, ['SI','NO']),
send_list(P14, append, ['SI','NO']),
send_list(P15, append, ['SI','NO']),
send_list(P16, append, ['SI','NO']),
send_list(P17, append, ['SI','NO']),
send_list(P18, append, ['SI','NO']),
send_list(P19, append, ['SI','NO']),
send_list(P20, append, ['SI','NO']),
send_list(P21, append, ['SI','NO']),
send_list(P22, append, ['SI','NO']),
send_list(P23, append, ['SI','NO']),
send_list(P24, append, ['SI','NO']),
send_list(P25, append, ['SI','NO']),
send_list(P26, append, ['SI','NO']),
send(Ventana, append, 
    new(_BtnEnviar, button(encontrar_transtorno, 
        and(message(@prolog, preguntasP2, P1?selection, P2?selection, P3?selection, P4?selection, P5?selection, P6?selection, P7?selection, P8?selection, P9?selection,
        P10?selection, P11?selection, P12?selection, P13?selection, P14?selection, P15?selection, P16?selection, P17?selection, P18?selection, P19?selection, 
        P20?selection, P21?selection,P22?selection,P23?selection,P24?selection,P25?selection,P26?selection, Nombre, Apellido,Ventana))))),
    send(Ventana, open),
    send(VentanaD, destroy).

diagnostico_general(Diag,VentanaD):-
    new(Ventana, dialog('Diagnostico de ansiedad')),
    send(Ventana, size, size(370,350)),
    send(Ventana, append, new(TxtTexto, text('El diagnostico de ansiedad es: '))),
    send(TxtTexto, font, bold),
    send(TxtTexto, alignment, center),
    send(Ventana, append, new(TxtIndice, text(Diag))),
    send(TxtIndice, font, bold),
    send(TxtIndice, alignment, center),
    send(TxtIndice, colour, '#0042FB'),
    send(Ventana,append,new(_BtnRegresar, button(regresar, and(message(@prolog, comenzar), and(message(@prolog, cerrar_advertencia, Ventana)))))),
    send(Ventana, open),
    send(VentanaD, destroy).

%verificacion de preguntas del indice de ansiedad
preguntasP1(P1, P2, P3, P4, P5, P6, P7, P8, P9, P10, P11, P12, P13, P14, P15, P16, P17, P18, P19, P20, P21,Nombre, Apellido,VentanaD):-
    P1 + P2 + P3 + P4 + P5 + P6 + P7 + P8 + P9 + P10 + P11 + P12 + P13 + P14 + P15 + P16 + P17 + P18 + P19 + P20 + P21<22,
    ingresar_registro(Nombre, Apellido, bajo),
    indice_bajo(VentanaD).
preguntasP1(P1, P2, P3, P4, P5, P6, P7, P8, P9, P10, P11, P12, P13, P14, P15, P16, P17, P18, P19, P20, P21,Nombre, Apellido,VentanaD):-
    P1 + P2 + P3 + P4 + P5 + P6 + P7 + P8 + P9 + P10 + P11 + P12 + P13 + P14 + P15 + P16 + P17 + P18 + P19 + P20 + P21<36,
    ingresar_registro(Nombre, Apellido, moderado),
    indice_moderado(VentanaD).
preguntasP1(P1, P2, P3, P4, P5, P6, P7, P8, P9, P10, P11, P12, P13, P14, P15, P16, P17, P18, P19, P20, P21,Nombre, Apellido,VentanaD):-
    P1 + P2 + P3 + P4 + P5 + P6 + P7 + P8 + P9 + P10 + P11 + P12 + P13 + P14 + P15 + P16 + P17 + P18 + P19 + P20 + P21>35,
    ingresar_registro(Nombre, Apellido, severo),
    indice_severo(Nombre, Apellido,VentanaD).

%verificacion de preguntas del transtorno de ansiedad
preguntasP2(P1, P2, P3, P4, P5, P6, P7, P8, P9, P10, P11, P12, P13, P14, P15, P16, P17, P18, P19, P20, P21,P22,P23,P24,P25,P26,Nombre, Apellido,VentanaD):-
    (P1 == 'SI',
     P2 == 'SI',
     P3 == 'SI',
     P4 == 'SI',
     P5 == 'SI',
     P6 == 'NO',
     P7 == 'NO',
     P8 == 'NO',
     P9 == 'NO',
     P10 == 'SI',
     P11 == 'SI',
     P12 == 'SI',
     P13 == 'NO',
     P14 == 'SI',
     P15 == 'SI',
     P16 == 'NO',
     P17 == 'NO',
     P18 == 'SI',
     P19 == 'NO',
     P20 == 'NO',
     P21 == 'NO',
     P22 == 'NO',
     P23 == 'NO',
     P24 == 'NO',
     P25 == 'NO',
     P26 == 'NO'
     ),
    ingresar_registro_diag(Nombre, Apellido,severo,agarofobia),
    diagnostico_general('Agarofobia',VentanaD).
preguntasP2(P1, P2, P3, P4, P5, P6, P7, P8, P9, P10, P11, P12, P13, P14, P15, P16, P17, P18, P19, P20, P21,P22,P23,P24,P25,P26,Nombre, Apellido,VentanaD):-
    (P1 == 'NO',
     P2 == 'SI',
     P3 == 'SI',
     P4 == 'SI',
     P5 == 'SI',
     P6 == 'SI',
     P7 == 'SI',
     P8 == 'NO',
     P9 == 'NO',
     P10 == 'SI',
     P11 == 'SI',
     P12 == 'SI',
     P13 == 'NO',
     P14 == 'NO',
     P15 == 'SI',
     P16 == 'NO',
     P17 == 'NO',
     P18 == 'SI',
     P19 == 'NO',
     P20 == 'NO',
     P21 == 'NO',
     P22 == 'NO',
     P23 == 'NO',
     P24 == 'NO',
     P25 == 'NO',
     P26 == 'NO'
     ),
    ingresar_registro_diag(Nombre, Apellido,severo,ataques_de_panico),
    diagnostico_general('Ataques de panico',VentanaD).
preguntasP2(P1, P2, P3, P4, P5, P6, P7, P8, P9, P10, P11, P12, P13, P14, P15, P16, P17, P18, P19, P20, P21,P22,P23,P24,P25,P26,Nombre, Apellido,VentanaD):-
    (P1 == 'NO',
     P2 == 'NO',
     P3 == 'NO',
     P4 == 'NO',
     P5 == 'NO',
     P6 == 'NO',
     P7 == 'NO',
     P8 == 'SI',
     P9 == 'SI',
     P10 == 'NO',
     P11 == 'NO',
     P12 == 'NO',
     P13 == 'NO',
     P14 == 'NO',
     P15 == 'NO',
     P16 == 'NO',
     P17 == 'NO',
     P18 == 'NO',
     P19 == 'NO',
     P20 == 'NO',
     P21 == 'NO',
     P22 == 'NO',
     P23 == 'NO',
     P24 == 'NO',
     P25 == 'NO',
     P26 == 'NO'
     ),
    ingresar_registro_diag(Nombre, Apellido,severo,estres_posttraumatico),
    diagnostico_general('Estres posttraumatico',VentanaD).
preguntasP2(P1, P2, P3, P4, P5, P6, P7, P8, P9, P10, P11, P12, P13, P14, P15, P16, P17, P18, P19, P20, P21,P22,P23,P24,P25,P26,Nombre, Apellido,VentanaD):-
    (P1 == 'NO',
     P2 == 'NO',
     P3 == 'NO',
     P4 == 'NO',
     P5 == 'SI',
     P6 == 'NO',
     P7 == 'SI',
     P8 == 'NO',
     P9 == 'NO',
     P10 == 'SI',
     P11 == 'SI',
     P12 == 'NO',
     P13 == 'SI',
     P14 == 'NO',
     P15 == 'SI',
     P16 == 'NO',
     P17 == 'NO',
     P18 == 'SI',
     P19 == 'NO',
     P20 == 'NO',
     P21 == 'NO',
     P22 == 'NO',
     P23 == 'NO',
     P24 == 'NO',
     P25 == 'NO',
     P26 == 'NO'
     ),
    ingresar_registro_diag(Nombre, Apellido,severo,fobia_especifica),
    diagnostico_general('Fobia especifica',VentanaD).
preguntasP2(P1, P2, P3, P4, P5, P6, P7, P8, P9, P10, P11, P12, P13, P14, P15, P16, P17, P18, P19, P20, P21,P22,P23,P24,P25,P26,Nombre, Apellido,VentanaD):-
    (P1 == 'NO',
     P2 == 'NO',
     P3 == 'NO',
     P4 == 'NO',
     P5 == 'NO',
     P6 == 'NO',
     P7 == 'NO',
     P8 == 'NO',
     P9 == 'NO',
     P10 == 'NO',
     P11 == 'NO',
     P12 == 'NO',
     P13 == 'NO',
     P14 == 'SI',
     P15 == 'SI',
     P16 == 'SI',
     P17 == 'SI',
     P18 == 'SI',
     P19 == 'NO',
     P20 == 'NO',
     P21 == 'NO',
     P22 == 'NO',
     P23 == 'NO',
     P24 == 'NO',
     P25 == 'NO',
     P26 == 'NO'
     ),
    ingresar_registro_diag(Nombre, Apellido,severo,fobia_social),
    diagnostico_general('Fobia Social',VentanaD).
preguntasP2(P1, P2, P3, P4, P5, P6, P7, P8, P9, P10, P11, P12, P13, P14, P15, P16, P17, P18, P19, P20, P21,P22,P23,P24,P25,P26,Nombre, Apellido,VentanaD):-
    (P1 == 'NO',
     P2 == 'NO',
     P3 == 'NO',
     P4 == 'NO',
     P5 == 'NO',
     P6 == 'NO',
     P7 == 'NO',
     P8 == 'NO',
     P9 == 'NO',
     P10 == 'SI',
     P11 == 'SI',
     P12 == 'NO',
     P13 == 'NO',
     P14 == 'SI',
     P15 == 'NO',
     P16 == 'NO',
     P17 == 'NO',
     P18 == 'SI',
     P19 == 'SI',
     P20 == 'SI',
     P21 == 'SI',
     P22 == 'SI',
     P23 == 'NO',
     P24 == 'NO',
     P25 == 'SI',
     P26 == 'SI'
     ),
    ingresar_registro_diag(Nombre, Apellido,severo,ansiedad_generalizada),
    diagnostico_general('Fobia Social',VentanaD).
preguntasP2(P1, P2, P3, P4, P5, P6, P7, P8, P9, P10, P11, P12, P13, P14, P15, P16, P17, P18, P19, P20, P21,P22,P23,P24,P25,P26,Nombre, Apellido,VentanaD):-
    (P1 == 'NO',
     P2 == 'NO',
     P3 == 'NO',
     P4 == 'NO',
     P5 == 'NO',
     P6 == 'NO',
     P7 == 'NO',
     P8 == 'NO',
     P9 == 'NO',
     P10 == 'NO',
     P11 == 'NO',
     P12 == 'NO',
     P13 == 'NO',
     P14 == 'SI',
     P15 == 'NO',
     P16 == 'SI',
     P17 == 'NO',
     P18 == 'NO',
     P19 == 'NO',
     P20 == 'NO',
     P21 == 'SI',
     P22 == 'SI',
     P23 == 'SI',
     P24 == 'SI',
     P25 == 'SI',
     P26 == 'SI'
     ),
    ingresar_registro_diag(Nombre, Apellido,severo,estres_agusto),
    diagnostico_general('Estres agudo',VentanaD).
preguntasP2(P1, P2, P3, P4, P5, P6, P7, P8, P9, P10, P11, P12, P13, P14, P15, P16, P17, P18, P19, P20, P21,P22,P23,P24,P25,P26,_Nombre, _Apellido,_VentanaD):-
    (P1 == 'NO';
     P2 == 'NO';
     P3 == 'NO';
     P4 == 'NO';
     P5 == 'NO';
     P6 == 'NO';
     P7 == 'NO';
     P8 == 'NO';
     P9 == 'NO';
     P10 == 'NO';
     P11 == 'NO';
     P12 == 'NO';
     P13 == 'NO';
     P14 == 'NO';
     P15 == 'NO';
     P16 == 'NO';
     P17 == 'NO';
     P18 == 'NO';
     P19 == 'NO';
     P20 == 'NO';
     P21 == 'NO';
     P22 == 'NO';
     P23 == 'NO';
     P24 == 'NO';
     P25 == 'NO';
     P26 == 'NO';
     P1 == 'SI';
     P2 == 'SI';
     P3 == 'SI';
     P4 == 'SI';
     P5 == 'SI';
     P6 == 'SI';
     P7 == 'SI';
     P8 == 'SI';
     P9 == 'SI';
     P10 == 'SI';
     P11 == 'SI';
     P12 == 'SI';
     P13 == 'SI';
     P14 == 'SI';
     P15 == 'SI';
     P16 == 'SI';
     P17 == 'SI';
     P18 == 'SI';
     P19 == 'SI';
     P20 == 'SI';
     P21 == 'SI';
     P22 == 'SI';
     P23 == 'SI';
     P24 == 'SI';
     P25 == 'SI';
     P26 == 'SI'
     ),
    sin_opcion().
%no hay opciones
sin_opcion() :-
    new(Ventana, dialog('Ansiedad')),
    send(Ventana, size, size(230,190)),
    send(Ventana, append, text('No se encontraron resultados')),
    send(Ventana,append,new(BtnRegresar, button(regresar, and(message(@prolog, cerrar_advertencia, Ventana))))),
    send(BtnRegresar, open),
    new(Figura, figure),
    new(Bitmap, bitmap(resource(advertencia), @on)),
    send(Bitmap, name, 1),
    send(Figura, display, Bitmap),
    send(Figura, status, 1),
    send(Ventana, display, Figura, point(40, 70)),
    send(Ventana, open).

%cerrar ventanas de advertencia
cerrar_advertencia(VentanaD):-
        send(VentanaD, destroy).

%Parte base de datos
abrir_conexion:-
    odbc_connect('MSProlog',_,[user(root), password(''), alias(prolog), open(once)]).

cerrar_conexion :-
    odbc_disconnect('prolog').

ingresar_registro(Nombre,Apellido,Indice) :-
    abrir_conexion,
    preparar('INSERT INTO paciente (nombre, apellidos, indice, fecha_diagnostico) VALUES (?,?,?,now())', [varchar,varchar,varchar],_, [Nombre,Apellido,Indice]),
    cerrar_conexion.

ingresar_registro_diag(Nombre,Apellido,Indice,Diag) :-
    abrir_conexion,
    preparar('INSERT INTO paciente (nombre, apellidos, indice, fecha_diagnostico,transtorno) VALUES (?,?,?,now(),?)', [varchar,varchar,varchar,varchar],_, [Nombre,Apellido,Indice,Diag]),
    cerrar_conexion.

obtener_conexion(Connection) :-
    odbc_connect('MSProlog', Connection, [user(root), password(''), alias(prolog), open(once)]).

preparar(SQL,Type,Row,Values) :-
    obtener_conexion(Connection),
    odbc_prepare(Connection, SQL, Type, Statement),
    odbc_execute(Statement, Values, Row).

consultar_registro(F) :-
    odbc_query('prolog', 'SELECT * FROM paciente order by id DESC limit 1', F).
