extends StaticBody2D

func _ready() -> void:
	shader_type canvas_item;

uniform float max_length = 100.0;
uniform float fade_start = 50.0;
uniform vec2 light_dir = vec2(0.0, 1.0); // direction the light is coming from

void fragment() {
	vec2 uv = UV;
	float dist = dot(uv, light_dir);
	
	float alpha = 1.0;
	if (dist > fade_start) {
		alpha = clamp(1.0 - (dist - fade_start) / (max_length - fade_start), 0.0, 1.0);
	}

	COLOR = texture(TEXTURE, uv) * vec4(0.0, 0.0, 0.0, alpha);
}
