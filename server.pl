:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_json)).
:- use_module(library(http/http_header)).

% Ruta principal: acepta tanto POST como OPTIONS
:- http_handler(root(rutina), handle_rutina, []).

% Base de conocimientos expandida con IMC, objetivos y planes
recomendar(plan(principiante), imc(bajo), perder_grasa, ["No se recomienda perder grasa para personas con bajo peso."]).
recomendar(plan(principiante), imc(bajo), ganar_musculo, ["Flexiones de rodillas (3 series de 8-10 repeticiones)",
                                                       "Sentadillas asistidas con silla (3 series de 10 repeticiones)",
                                                       "Peso muerto con mancuernas ligeras (3 series de 8 repeticiones)"]).
recomendar(plan(principiante), imc(bajo), mejorar_resistencia, ["Caminata rápida (15-20 minutos)",
                                                              "Natación suave (15-20 minutos)",
                                                              "Bicicleta estática a baja intensidad (15 minutos)"]).
recomendar(plan(principiante), imc(bajo), aumentar_flexibilidad, ["Estiramientos básicos de piernas (15-20 segundos cada uno)",
                                                                "Yoga para principiantes (posturas básicas como perro boca abajo)",
                                                                "Estiramientos de brazos y hombros"]).

recomendar(plan(principiante), imc(normal), perder_grasa, ["Jumping jacks suaves (3 series de 30 segundos)",
                                                          "Marcha en el lugar (10 minutos)",
                                                          "Subir y bajar escaleras (5-10 minutos)"]).
recomendar(plan(principiante), imc(normal), ganar_musculo, ["Sentadillas sin peso (3 series de 12 repeticiones)",
                                                           "Flexiones de pared (3 series de 10 repeticiones)",
                                                           "Ejercicios de core básicos (planchas de 20 segundos)"]).
recomendar(plan(principiante), imc(normal), mejorar_resistencia, ["Caminar/trotar alternado (20 minutos)",
                                                                "Ejercicios de cardio de bajo impacto",
                                                                "Natación recreativa (20 minutos)"]).
recomendar(plan(principiante), imc(normal), aumentar_flexibilidad, ["Estiramientos dinámicos (10 minutos)",
                                                                  "Posturas básicas de yoga",
                                                                  "Ejercicios de movilidad articular"]).

recomendar(plan(principiante), imc(sobrepeso), perder_grasa, ["Caminata diaria (20 minutos)",
                                                              "Ejercicios acuáticos (20 minutos)",
                                                              "Bicicleta estática a ritmo moderado (15 minutos)"]).
recomendar(plan(principiante), imc(sobrepeso), ganar_musculo, ["Sentadillas asistidas (3 series de 8 repeticiones)",
                                                              "Ejercicios con bandas elásticas suaves",
                                                              "Press de hombros con peso ligero"]).
recomendar(plan(principiante), imc(sobrepeso), mejorar_resistencia, ["Natación suave (15-20 minutos)",
                                                                    "Caminata en cinta (20 minutos)",
                                                                    "Ejercicios de bajo impacto"]).
recomendar(plan(principiante), imc(sobrepeso), aumentar_flexibilidad, ["Estiramientos sentados",
                                                                     "Yoga adaptado",
                                                                     "Ejercicios de movilidad suaves"]).

recomendar(plan(principiante), imc(obesidad), perder_grasa, ["Caminata corta (10 minutos, 2-3 veces al día)",
                                                             "Ejercicios acuáticos suaves",
                                                             "Movimientos de brazos sentado"]).
recomendar(plan(principiante), imc(obesidad), ganar_musculo, ["Ejercicios sentados con peso corporal",
                                                              "Levantamientos de piernas acostado",
                                                              "Ejercicios isométricos"]).
recomendar(plan(principiante), imc(obesidad), mejorar_resistencia, ["Ejercicios acuáticos (10-15 minutos)",
                                                                   "Caminata muy suave (10 minutos)",
                                                                   "Ejercicios de respiración"]).
recomendar(plan(principiante), imc(obesidad), aumentar_flexibilidad, ["Estiramientos en silla",
                                                                     "Ejercicios de movilidad articular suaves",
                                                                     "Rotaciones controladas de articulaciones"]).

% Plan Intermedio
recomendar(plan(intermedio), imc(bajo), perder_grasa, "No es recomendable enfocarse en perder grasa si se tiene bajo peso.").
recomendar(plan(intermedio), imc(bajo), ganar_musculo, [
    "Flexiones completas (4 series de 12-15 repeticiones)",
    "Press de banca con pesas moderadas (4 series de 10 repeticiones)",
    "Dominadas asistidas (3 series de 8-10 repeticiones)",
    "Peso muerto con barra (4 series de 10 repeticiones)"
]).
recomendar(plan(intermedio), imc(bajo), mejorar_resistencia, [
    "Carrera continua (30 minutos)",
    "HIIT de bajo impacto (intervalos de 30 segundos)",
    "Natación con diferentes estilos (45 minutos)"
]).
recomendar(plan(intermedio), imc(bajo), aumentar_flexibilidad, [
    "Secuencias de yoga flow intermedias",
    "Split progresivo",
    "Ejercicios de movilidad dinámica avanzada"
]).

recomendar(plan(intermedio), imc(normal), perder_grasa, [
    "Circuito de ejercicios (45 segundos trabajo/15 descanso)",
    "Burpees modificados (4 series de 12)",
    "Sprint intervalado (30 segundos sprint/1 minuto jogging)",
    "Salto a la cuerda (intervalos de 2 minutos)"
]).
recomendar(plan(intermedio), imc(normal), ganar_musculo, [
    "Pull-ups con banda elástica (3 series de 8)",
    "Sentadillas con peso (4 series de 12)",
    "Press militar con mancuernas (4 series de 10)",
    "Remo con barra (4 series de 12)"
]).
recomendar(plan(intermedio), imc(normal), mejorar_resistencia, [
    "Entrenamiento intervalado (40 minutos)",
    "Circuitos cardiovasculares (30 minutos)",
    "Ciclismo intenso (45 minutos)"
]).
recomendar(plan(intermedio), imc(normal), aumentar_flexibilidad, [
    "Yoga power flow",
    "Ejercicios de contracción-relajación",
    "Rutinas de movilidad completas"
]).

recomendar(plan(intermedio), imc(sobrepeso), perder_grasa, [
    "Circuitos de cardio (40 minutos)",
    "Elíptica con resistencia (30 minutos)",
    "Boxeo sin impacto (30 minutos)",
    "Natación intensa (30 minutos)"
]).
recomendar(plan(intermedio), imc(sobrepeso), ganar_musculo, [
    "Sentadillas con peso moderado (4 series de 10)",
    "Press de banca inclinado (4 series de 12)",
    "Remo con mancuernas (4 series de 12)",
    "Peso muerto rumano (3 series de 10)"
]).
recomendar(plan(intermedio), imc(sobrepeso), mejorar_resistencia, [
    "Entrenamiento cardiovascular mixto (45 minutos)",
    "Ciclismo intervalado (35 minutos)",
    "Natación con series (40 minutos)"
]).
recomendar(plan(intermedio), imc(sobrepeso), aumentar_flexibilidad, [
    "Yoga flow moderado",
    "Ejercicios de movilidad con resistencia",
    "Estiramientos dinámicos avanzados"
]).

recomendar(plan(intermedio), imc(obesidad), perder_grasa, [
    "Caminata rápida intervalada (30 minutos)",
    "Ejercicios acuáticos con resistencia (30 minutos)",
    "Elíptica con programa intervalado (25 minutos)",
    "Remo estático (20 minutos)"
]).
recomendar(plan(intermedio), imc(obesidad), ganar_musculo, [
    "Ejercicios con bandas de resistencia media",
    "Press de piernas en máquina (4 series de 12)",
    "Extensiones de tríceps (3 series de 12)",
    "Remo sentado en máquina (4 series de 10)"
]).
recomendar(plan(intermedio), imc(obesidad), mejorar_resistencia, [
    "Natación con intervalos (30 minutos)",
    "Bicicleta estática programa mixto (30 minutos)",
    "Caminata en pendiente (25 minutos)"
]).
recomendar(plan(intermedio), imc(obesidad), aumentar_flexibilidad, [
    "Yoga adaptado intermedio",
    "Pilates modificado"
]).

% Plan Avanzado
recomendar(plan(avanzado), imc(bajo), perder_grasa, "No es recomendable enfocarse en perder grasa con bajo peso.").
recomendar(plan(avanzado), imc(bajo), ganar_musculo, [
                                                        "Programa de powerlifting modificado (5x5 con cargas pesadas)",
                                                        "Clean and Press (5 series de 5 repeticiones)",
                                                        "Dominadas con peso adicional (4 series hasta el fallo)",
                                                        "Programa German Volume Training adaptado",
                                                        "Press de banca piramidal (hasta 85-90% 1RM)"
                                                    ]).
recomendar(plan(avanzado), imc(bajo), mejorar_resistencia, [
                                                            "Entrenamiento CrossFit avanzado",
                                                            "HIIT de alto impacto (intervalos 40/20)",
                                                            "Natación competitiva (60-90 minutos)",
                                                            "Cardio con máscara de altitud"
                                                        ]).
recomendar(plan(avanzado), imc(bajo), aumentar_flexibilidad, [
                                                                "Yoga avanzado (Ashtanga)",
                                                                "Contorsión básica",
                                                                "Ejercicios de movilidad olímpica",
                                                                "Split completo en múltiples ángulos"
                                                            ]).

recomendar(plan(avanzado), imc(normal), perder_grasa, [
                                                        "Entrenamiento Tabata múltiple (8 rondas por ejercicio)",
                                                        "Sprint con resistencia (intervalos 30/30)",
                                                        "Circuitos metabólicos complejos",
                                                        "CrossFit WODs avanzados",
                                                        "Boxeo con sparring ligero"
                                                    ]).
recomendar(plan(avanzado), imc(normal), ganar_musculo, [
                                                        "Programa 5/3/1 de Wendler",
                                                        "Sentadillas búlgaras con peso (5 series de 8)",
                                                        "Pull-ups weighted (5 series hasta el fallo)",
                                                        "Series gigantes para hipertrofia",
                                                        "Clean and Jerk técnico"
                                                    ]).
recomendar(plan(avanzado), imc(normal), mejorar_resistencia, [
                                                                "Triatlón training",
                                                                "Carreras de fondo (15-20km)",
                                                                "Ciclismo de montaña avanzado",
                                                                "Natación de aguas abiertas"
                                                            ]).
recomendar(plan(avanzado), imc(normal), aumentar_flexibilidad, [
                                                                "Contorsión intermedia",
                                                                "Calistenia avanzada",
                                                                "Programas de movilidad extrema",
                                                                "Yoga acrobático"
                                                            ]).

recomendar(plan(avanzado), imc(sobrepeso), perder_grasa, [
                                                            "Circuitos HIIT complejos (45/15)",
                                                            "Entrenamiento con kettlebell avanzado",
                                                            "Boxing cardio intenso",
                                                            "Natación de velocidad",
                                                            "Ejercicios pliométricos adaptados"
                                                        ]).
recomendar(plan(avanzado), imc(sobrepeso), ganar_musculo, [
                                                            "Powerlifting adaptado",
                                                            "Press de banca avanzado (periodización)",
                                                            "Programa híbrido fuerza-hipertrofia",
                                                            "Sentadillas profundas con carga",
                                                            "Pull-ups asistidos hasta dominio"
                                                        ]).
recomendar(plan(avanzado), imc(sobrepeso), mejorar_resistencia, [
                                                                    "Entrenamiento militar adaptado",
                                                                    "Circuitos de resistencia avanzados",
                                                                    "Natación con series de velocidad",
                                                                    "Ciclismo de alto rendimiento"
                                                                ]).
recomendar(plan(avanzado), imc(sobrepeso), aumentar_flexibilidad, [
                                                                "Yoga dinámico avanzado",
                                                                "Programas de movilidad específicos",
                                                                "PNF avanzado",
                                                                "Estiramientos balísticos controlados"
                                                            ]).

recomendar(plan(avanzado), imc(obesidad), perder_grasa, [
                                                            "HIIT acuático avanzado",
                                                            "Circuitos metabólicos adaptados",
                                                            "Entrenamiento en elíptica con resistencia alta",
                                                            "Boxeo adaptado intenso",
                                                            "Remo con intervalos de potencia"
                                                        ]).
recomendar(plan(avanzado), imc(obesidad), ganar_musculo, [
                                                            "Entrenamiento de fuerza periodizado",
                                                            "Máquinas de peso con cargas altas",
                                                            "Ejercicios compuestos adaptados",
                                                            "Programa push-pull adaptado",
                                                            "Press de piernas pesado"
                                                        ]).
recomendar(plan(avanzado), imc(obesidad), mejorar_resistencia, [
                                                                    "Natación de resistencia",
                                                                    "Ciclismo de fondo adaptado",
                                                                    "Circuitos cardio avanzados",
                                                                    "Entrenamiento militar modificado"
                                                                ]).
recomendar(plan(avanzado), imc(obesidad), aumentar_flexibilidad, [
                                                                            "Yoga flow intenso adaptado",
                                                                            "Pilates avanzado",
                                                                            "Programas de movilidad específicos",
                                                                            "Estiramientos dinámicos complejos"
                                                                        ]).


% Inicia el servidor en el puerto: start_server(5000).
start_server(Port) :-
    http_server(http_dispatch, [port(Port)]).

% Handler principal que responde tanto a OPTIONS como POST

handle_rutina(Request) :-
    member(method(options), Request), !,
    cors_headers,
    format('Content-type: text/plain~n~n'),
    format('OK').

handle_rutina(Request) :-
    cors_headers,
    http_read_json_dict(Request, DictIn),
    atom_string(PlanAtom, DictIn.plan),  % Asegura que el plan sea un átomo
    atom_string(IMCAtom, DictIn.imc),   % Asegura que IMC sea un átomo
    atom_string(ObjetivoAtom, DictIn.objetivo), % Asegura que objetivo sea un átomo
    (   recomendar(plan(PlanAtom), imc(IMCAtom), ObjetivoAtom, Rutina) ->
        reply_json_dict(_{rutina: Rutina})
    ;   reply_json_dict(_{rutina: ["No se encontró una rutina adecuada."]})
    ).

% Cabeceras necesarias para permitir CORS
cors_headers :-
    format('Access-Control-Allow-Origin: *~n'),
    format('Access-Control-Allow-Methods: POST, OPTIONS~n'),
    format('Access-Control-Allow-Headers: Content-Type~n').


% Inicia el servidor y espera indefinidamente

wait_forever :- repeat, sleep(1), fail.





