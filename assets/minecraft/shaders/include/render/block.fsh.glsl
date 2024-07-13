in vec3 worldPos;
in vec3 worldNormal;
in vec4 vertexColor;
in vec2 texCoord0;
in vec4 lightMapColor;
in float vertexDistance;

out vec4 fragColor;

void fragment() {
    vec4 color = texture(MainTex_Sampler, texCoord0);

#ifdef DISCARD
    if (color.a < AlphaCutoff) discard;
#endif

    color.rgb *= vertexColor.rgb;
    color *= vertexColor.a;
    color *= lightMapColor * ColorModulator;
    fragColor = linear_fog(color, vertexDistance, FogStart, FogEnd, FogColor);
}