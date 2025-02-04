// From: https://thebookofshaders.com/13/

// Author @patriciogv - 2015
// http://patriciogonzalezvivo.com

uniform float u_Amplitude;
uniform float u_Seed;
uniform float u_Octaves;

uniform vec2 u_PositionOffset;

float random(in vec2 st, in float seed) {
    return fract(sin(dot(st.xy, vec2(12.9898,78.233))) * (43758.5453123 + seed));
}

const vec2 v_10 = vec2(1, 0);
const vec2 v_01 = vec2(0, 1);
const vec2 v_11 = vec2(1, 1);

// Based on Morgan McGuire @morgan3d
// https://www.shadertoy.com/view/4dS3Wd
float noise (in vec2 st, in float seed) {
    vec2 i = floor(st);
    vec2 f = fract(st);

    // Four corners in 2D of a tile
    float a = random(i, seed);
    float b = random(i + v_10, seed);
    float c = random(i + v_01, seed);
    float d = random(i + v_11, seed);

    vec2 u = f * f * (3.0 - 2.0 * f);

    return mix(a, b, u.x) + (c - a)* u.y * (1.0 - u.x) + (d - b) * u.x * u.y;
}

float fractal(in vec2 st, in float seed) {
    float value = 0.0;
    float amplitude = 0.5;
    float frequency = 0.0;
    
    const int octaves = 6;
    
    for (int i = 0; i < octaves; i++) {
        value += amplitude * noise(st, seed);
        st *= 2.0;
        amplitude *= 0.5;
    }
    
    return value;
}

const vec2 scale_factor = vec2(256);

void main() {
    vec2 st = (gl_FragCoord.xy + u_PositionOffset) / scale_factor / u_Octaves;

    vec3 color = vec3(fractal(st * 3.0, u_Seed));

    gl_FragColor = vec4(color * u_Amplitude, 1);
}