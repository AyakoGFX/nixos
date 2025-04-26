precision mediump float;
varying vec2 v_texcoord;
uniform sampler2D tex;
uniform float time;

float rand(vec2 co) {
    return fract(sin(dot(co + time, vec2(12.9898, 78.233))) * 43758.5453);
}

void main() {
    vec4 color = texture2D(tex, v_texcoord);
    float gray = (color.r + color.g + color.b) / 3.0;
    float binary = gray > 0.4 ? 1.0 : 0.0;

    // Flicker effect
    float flicker = 0.05 * sin(time * 20.0 + v_texcoord.y * 100.0);
    float green = binary + flicker;

    green = clamp(green, 0.0, 1.0);
    vec3 finalColor = vec3(0.0, green, 0.0);
    gl_FragColor = vec4(finalColor, color.a);
}
