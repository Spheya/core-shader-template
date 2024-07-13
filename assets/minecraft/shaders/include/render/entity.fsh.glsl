#moj_import <fog.glsl>

in vec3 worldPos;
in vec3 worldNormal;
in vec4 vertexColor;
in vec2 texCoord0;
in vec4 diffuseLightColor;
in vec4 lightMapColor;
in float vertexDistance;

#ifdef OVERLAY
in vec4 overlayColor;
#endif

out vec4 fragColor;

void fragment() {
    vec4 color = texture(MainTex_Sampler, texCoord0);

#ifdef DISCARD
    if (color.a < AlphaCutoff) discard;
#endif

    color *= vertexColor * diffuseLightColor * ColorModulator;
#ifdef OVERLAY
    color.rgb = mix(overlayColor.rgb, color.rgb, overlayColor.a);
#endif
    color *= lightMapColor;

    fragColor = linear_fog(color, vertexDistance, FogStart, FogEnd, FogColor);
}