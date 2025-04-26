precision mediump float;
varying vec2 v_texcoord;
uniform sampler2D tex;

float rand(vec2 co) {
    return fract(sin(dot(co, vec2(12.9898, 78.233))) * 43758.5453);
}

void main() {
    vec4 color = texture2D(tex, v_texcoord);
    float gray = (color.r + color.g + color.b) / 3.0;
    float binary = gray > 0.4 ? 1.0 : 0.0;

    // Scanline effect
    float scanline = sin(v_texcoord.y * 800.0) * 0.1;
    float green = binary + scanline;

    green = clamp(green, 0.0, 1.0);
    vec3 finalColor = vec3(0.0, green, 0.0);
    gl_FragColor = vec4(finalColor, color.a);
}
