out vec3 worldPos;
out vec3 worldNormal;
out vec4 vertexColor;
out vec2 texCoord0;
out vec4 lightMapColor;
out float vertexDistance;

void vertex() {
    worldPos = Position + ChunkOffset;
    worldNormal = Normal;
    vertexColor = Color;
    texCoord0 = UV0;
    lightMapColor = minecraft_sample_lightmap(LightMap_Sampler, UV2);

    vertexDistance = fog_distance(worldPos, FogShape);
    gl_Position = ProjMat * ModelViewMat * vec4(worldPos, 1.0);
    worldPos += vec3(ProjMat[3][0], ProjMat[3][1], 0.0); // bobbing
}