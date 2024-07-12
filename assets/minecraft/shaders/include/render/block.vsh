#version 150

#moj_import <light.glsl>
#moj_import <fog.glsl>

in vec3 Position;
in vec4 Color;
in vec2 UV0;
in ivec2 UV2;
in vec3 Normal;

uniform sampler2D Sampler2;

uniform mat4 ModelViewMat;
uniform mat4 ProjMat;
uniform vec3 ChunkOffset;
uniform int FogShape;

out vec3 worldPos;
out vec3 worldNormal;
out vec4 vertexColor;
out vec2 texCoord0;
out vec4 lightMapColor;
out float vertexDistance;

void main() {
    worldPos = Position + ChunkOffset;
    worldNormal = Normal;
    vertexColor = Color;
    texCoord0 = UV0;
    lightMapColor = minecraft_sample_lightmap(Sampler2, UV2);

    vertexDistance = fog_distance(worldPos, FogShape);
    gl_Position = ProjMat * ModelViewMat * vec4(worldPos, 1.0);
    worldPos += vec3(ProjMat[3][0], ProjMat[3][1], 0.0); // bobbing
}