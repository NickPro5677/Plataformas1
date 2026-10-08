/// @description Inicializa variables del jugador (principiante)

// Velocidad horizontal y vertical (se actualizan cada frame)
hsp = 0;
vsp = 0;

// Gravedad: cuánto cae por frame
grv = 0.5;

// Velocidad de caminar
velocidad = 4;

// Fuerza del salto (negativo = hacia arriba en GameMaker)
fuerza_salto = -10;

// Guardamos la posición inicial para reaparecer si caemos
inicio_x = x;
inicio_y = y;
