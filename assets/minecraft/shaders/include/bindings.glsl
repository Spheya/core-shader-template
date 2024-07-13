#define MainTex_Sampler  Sampler0
#define Overlay_Sampler  Sampler1
#define LightMap_Sampler Sampler2

uniform sampler2D MainTex_Sampler;
uniform sampler2D LightMap_Sampler;

uniform mat4 ModelViewMat;
uniform mat4 ProjMat;
uniform vec4 ColorModulator;
uniform float FogStart;
uniform float FogEnd;
uniform vec4 FogColor;
uniform int FogShape;
uniform float GameTime;
uniform vec2 ScreenSize;

#ifdef BLOCK
    uniform vec3 ChunkOffset;
#endif

#ifdef ENTITY
    uniform sampler2D Overlay_Sampler;

    uniform vec3 Light0_Direction;
    uniform vec3 Light1_Direction;
#endif

#ifdef DISCARD
    const float AlphaCutoff = DISCARD;
#else
    const float AlphaCutoff = 0.0;
#endif

const float MipBias = 0.0;

#ifdef VSH
    in vec3 Position;
    in vec4 Color;
    in vec2 UV0;
    in ivec2 UV2;
    in vec3 Normal;

    #ifdef ENTITY
        in ivec2 UV1;
    #endif
#endif