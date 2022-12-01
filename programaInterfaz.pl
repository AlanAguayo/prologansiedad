%Librerias
:- use_module(library(pce)).
:- use_module(library(pce_util)).
:- pce_image_directory('./images').

%Recursos
resource(principal, image, image('principal.jpg')).
resource(indiceBajo, image, image('indiceBajo.jpg')).
resource(indiceModerado, image, image('indiceModerado.jpg')).
resource(cesarea, image, image('cesarea.jpg')).
resource(advertencia, image, image('advertencia.jpg')).

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
preguntaP2('sudores_frios_o_calientes',X) :- respuestaP2(X).

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
    ingresar_registro(Nombre, Apellido),
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
    send(Ventana, append, new(BtnEnviar, button(resultados, and(message(@prolog, preguntasP1, P1?selection, P2?selection, P3?selection, P4?selection, P5?selection, P6?selection, P7?selection, P8?selection, P9?selection, P10?selection, P11?selection, P12?selection, P13?selection, P14?selection, P15?selection, P16?selection, P17?selection, P18?selection, P19?selection, P20?selection, P21?selection, Ventana))))),
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
indice_severo(VentanaD) :-
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
    %send_list(Ventana, append, [
    %new(P1, menu(incision_por_despredimiento_de_placenta)),
    %new(P2, menu(no_hay_desprendimiento_de_placenta))]),
    %send_list(P10, append, [si, no]),
    %send_list(P11, append, [si, no]),
    %send(Ventana,append,new(BtnTranstorno, button(tipo_incision, and(message(@prolog, tipo_incision, P10?selection,P11?selection,Ventana))))),
    %send(BtnTranstorno, open),
    new(Figura, figure),
    new(Bitmap, bitmap(resource(cesarea), @on)),
    send(Bitmap, name, 1),
    send(Figura, display, Bitmap),
    send(Figura, status, 1),
    send(Ventana, display, Figura, point(10, 140)),
    send(Ventana, open),
    send(VentanaD, destroy).

%verificacion de preguntas del indice de ansiedad
preguntasP1(P1, P2, P3, P4, P5, P6, P7, P8, P9, P10, P11, P12, P13, P14, P15, P16, P17, P18, P19, P20, P21,VentanaD):-
    P1 + P2 + P3 + P4 + P5 + P6 + P7 + P8 + P9 + P10 + P11 + P12 + P13 + P14 + P15 + P16 + P17 + P18 + P19 + P20 + P21<22,
    indice_bajo(VentanaD).
preguntasP1(P1, P2, P3, P4, P5, P6, P7, P8, P9, P10, P11, P12, P13, P14, P15, P16, P17, P18, P19, P20, P21,VentanaD):-
    P1 + P2 + P3 + P4 + P5 + P6 + P7 + P8 + P9 + P10 + P11 + P12 + P13 + P14 + P15 + P16 + P17 + P18 + P19 + P20 + P21<36,
    indice_moderado(VentanaD).
preguntasP1(P1, P2, P3, P4, P5, P6, P7, P8, P9, P10, P11, P12, P13, P14, P15, P16, P17, P18, P19, P20, P21,VentanaD):-
    P1 + P2 + P3 + P4 + P5 + P6 + P7 + P8 + P9 + P10 + P11 + P12 + P13 + P14 + P15 + P16 + P17 + P18 + P19 + P20 + P21>35,
    indice_severo(VentanaD).

%verificacion de preguntas del transtorno de ansiedad

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

ingresar_registro(Nombre,Apellido) :-
    abrir_conexion,
    preparar('INSERT INTO paciente (nombre, apellidos, fecha_diagnostico) VALUES (?,?,now())', [varchar,varchar],_, [Nombre,Apellido]),
    cerrar_conexion.

obtener_conexion(Connection) :-
    odbc_connect('MSProlog', Connection, [user(root), password(''), alias(prolog), open(once)]).

preparar(SQL,Type,Row,Values) :-
    obtener_conexion(Connection),
    odbc_prepare(Connection, SQL, Type, Statement),
    odbc_execute(Statement, Values, Row).

consultar_registro(F) :-
    odbc_query('prolog', 'SELECT * FROM paciente order by id DESC limit 1', F).
