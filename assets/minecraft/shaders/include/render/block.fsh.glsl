#version 150

#moj_import <fog.glsl>

uniform sampler2D Sampler0;

uniform vec4 ColorModulator;
uniform float FogStart;
uniform float FogEnd;
uniform vec4 FogColor;

in vec3 worldPos;
in vec3 worldNormal;
in vec4 vertexColor;
in vec2 texCoord0;
in vec4 lightMapColor;
in float vertexDistance;

out vec4 fragColor;

void main() {
    vec4 color = texture(Sampler0, texCoord0);

#ifdef DISCARD
    if (color.a < DISCARD) discard;
#endif

    color *= vertexColor * lightMapColor * ColorModulator;
    fragColor = linear_fog(color, vertexDistance, FogStart, FogEnd, FogColor);
}