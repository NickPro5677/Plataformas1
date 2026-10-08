/// @description Movimiento, salto, gravedad y colisiones

// --- Entrada horizontal (flechas o A/D) ---
var mover = 0;
if (keyboard_check(vk_right) || keyboard_check(ord("D"))) {
    mover += 1;
}
if (keyboard_check(vk_left) || keyboard_check(ord("A"))) {
    mover -= 1;
}
hsp = mover * velocidad;

// --- ¿Estamos en el suelo? (un pixel debajo) ---
var en_suelo = place_meeting(x, y + 1, obj_pared);

// --- Salto solo si estamos en el suelo ---
if ((keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"))) && en_suelo) {
    vsp = fuerza_salto;
}

// --- Aplicar gravedad ---
vsp = vsp + grv;

// --- Colisión horizontal (paso a paso, pixel a pixel) ---
if (place_meeting(x + hsp, y, obj_pared)) {
    // Avanzamos de a 1 pixel en la dirección de hsp hasta chocar
    while (!place_meeting(x + sign(hsp), y, obj_pared)) {
        x = x + sign(hsp);
    }
    hsp = 0;
}
x = x + hsp;

// --- Colisión vertical ---
if (place_meeting(x, y + vsp, obj_pared)) {
    while (!place_meeting(x, y + sign(vsp), obj_pared)) {
        y = y + sign(vsp);
    }
    vsp = 0;
}
y = y + vsp;

// --- Si caemos fuera de la sala, reaparecemos al inicio ---
if (y > room_height + 64 || x < -64 || x > room_width + 64) {
    x = inicio_x;
    y = inicio_y;
    hsp = 0;
    vsp = 0;
}
