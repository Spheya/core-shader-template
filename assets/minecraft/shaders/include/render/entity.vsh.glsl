#moj_import <light.glsl>
#moj_import <fog.glsl>

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

void vertex() {
    worldPos = Position;
    worldNormal = Normal;
    vertexColor = Color;
    texCoord0 = UV0;

    diffuseLightColor = minecraft_mix_light(Light0_Direction, Light1_Direction, Normal, vec4(1.0));
    lightMapColor = minecraft_sample_lightmap(LightMap_Sampler, UV2);

#ifdef OVERLAY
    overlayColor = texelFetch(Sampler1, UV1, 0);
#endif

    vertexDistance = fog_distance(worldPos, FogShape);
    gl_Position = ProjMat * ModelViewMat * vec4(Position, 1.0);
    worldPos += vec3(ProjMat[3][0], ProjMat[3][1], 0.0); // bobbing
}