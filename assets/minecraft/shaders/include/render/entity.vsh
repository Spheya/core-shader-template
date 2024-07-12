#version 150

#moj_import <light.glsl>
#moj_import <fog.glsl>

in vec3 Position;
in vec4 Color;
in vec2 UV0;
in ivec2 UV1;
in ivec2 UV2;
in vec3 Normal;

uniform sampler2D Sampler1;
uniform sampler2D Sampler2;

uniform mat4 ModelViewMat;
uniform mat4 ProjMat;
uniform int FogShape;

uniform vec3 Light0_Direction;
uniform vec3 Light1_Direction;

out vec3 worldPos;
out vec3 worldNormal;
out vec4 vertexColor;
out vec2 texCoord0;
out vec4 diffuseLightColor;
out vec4 lightMapColor;
out float vertexDistance;

#ifdef OVERLAY
out vec4 overlayColor;
#endif

void main() {
    worldPos = Position;
    worldNormal = Normal;
    vertexColor = Color;
    texCoord0 = UV0;

    diffuseLightColor = minecraft_mix_light(Light0_Direction, Light1_Direction, Normal, vec4(1.0));
    lightMapColor = minecraft_sample_lightmap(Sampler2, UV2);

#ifdef OVERLAY
    overlayColor = texelFetch(Sampler1, UV1, 0);
#endif

    vertexDistance = fog_distance(worldPos, FogShape);
    gl_Position = ProjMat * ModelViewMat * vec4(Position, 1.0);
    worldPos += vec3(ProjMat[3][0], ProjMat[3][1], 0.0); // bobbing
}