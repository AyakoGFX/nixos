precision mediump float;
varying vec2 v_texcoord;
uniform sampler2D tex;

float rand(vec2 co) {
    return fract(sin(dot(co, vec2(12.9898, 78.233))) * 43758.5453);
}

void main() {
    vec4 color = texture2D(tex, v_texcoord);

    // Convert to grayscale
    float gray = (color.r + color.g + color.b) / 3.0;

    // Threshold to create a high-contrast "hacker" text look
    float threshold = 0.4;
    float binary = gray > threshold ? 1.0 : 0.0;

    // Add green glow with noise
    float noise = rand(v_texcoord * 100.0) * 0.1; // Smaller noise, higher freq
    float green = binary + noise;

    // Clamp and apply green tint
    green = clamp(green, 0.0, 1.0);
    vec3 finalColor = vec3(0.0, green, 0.0); // Black & green

    gl_FragColor = vec4(finalColor, color.a);
}
