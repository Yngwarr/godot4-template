shader_type canvas_item;

// adapted from: https://www.shadertoy.com/view/Xltfzj

uniform sampler2D SCREEN_TEXTURE: hint_screen_texture;

uniform float directions = 32.0;
uniform float quality = 8.0;
uniform float size = 10.0;

void fragment() {
    float doublePI = 6.28318530718;
    vec2 resolution = 1.0 / SCREEN_PIXEL_SIZE;

	vec2 radius = size / resolution.xy;
    vec2 uv = FRAGCOORD.xy / resolution.xy;
    vec4 color = texture(SCREEN_TEXTURE, uv);

    for (float d = 0.0; d < doublePI; d += doublePI / directions) {
        for (float i = 1.0 / quality; i <= 1.0; i += 1.0 / quality) {
            color += texture(SCREEN_TEXTURE, uv + vec2(cos(d), sin(d)) * radius * i);
        }
    }
	
	color /= quality * directions;
    COLOR = color;
}
