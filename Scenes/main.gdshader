 shader_type canvas_item;

void fragment() {
    COLOR = texture(TEXTURE, UV);
    COLOR.a = clamp(COLOR.a, 0.0, 1.0);
}