shader_type canvas_item;

// Parametri personalizzabili dall'ispettore di Godot
uniform vec3 grid_color : source_color = vec3(0.708, 0.0, 1.0);
uniform vec3 background_color : source_color = vec3(0.0, 0.0, 0.0);
uniform float speed : hint_range(0.0, 2.0) = 0.35;
uniform float grid_size : hint_range(0.01, 1.0) = 0.3;
uniform float player_position:hint_range(0.0,1.0);

float grid(vec2 uv, float time) {
    // Definizione dello spessore delle linee in base alla prospettiva
    vec2 size = vec2(uv.y, uv.y * uv.y * 0.2) * 0.01;
    
    // Movimento sull'asse Y (verticale)
    uv.y += time * speed;
    
    // Creazione del pattern ripetuto
    vec2 grid_uv = abs(fract(uv / grid_size) - player_position);
    
    // Disegno delle linee con smoothstep per antialiasing
    vec2 lines = smoothstep(size, vec2(0.0), grid_uv);
    return clamp(lines.x + lines.y, 0.0, 1.0);
}

void fragment() {
    // Usiamo UV di Godot (da 0.0 a 1.0) e lo rimappiamo
    // per avere il centro in basso e gestire la prospettiva
    vec2 uv = UV;
    vec3 col = background_color;
    
    // Creiamo l'orizzonte (tagliamo a metà schermo)
    if (uv.y > 0.0) {
        // Proiezione prospettica "finta"
        // Più ci avviciniamo all'orizzonte, più le coordinate si stringono
        float perspective = 1.0 / (uv.y - 0.0);
        vec2 grid_coords = vec2((uv.x - 0.5) * perspective, perspective);
        
        float grid_val = grid(grid_coords, TIME);
        
        // Applichiamo il colore della griglia con un leggero bagliore
        col = mix(background_color, grid_color, grid_val);
        
        // Effetto nebbia verso l'orizzonte
        float fog = smoothstep(0.0, 0.5, uv.y);
        col = mix(background_color, col, fog);
    }
    
    COLOR = vec4(col, 1.0);
}