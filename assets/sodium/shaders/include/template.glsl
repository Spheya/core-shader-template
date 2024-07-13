#ifdef USE_FRAGMENT_DISCARD
    #define DISCARD
#endif

#define MainTex_Sampler  u_BlockTex
#define Overlay_Sampler  u_BlockTex
#define LightMap_Sampler u_LightTex

#define ModelViewMat     u_ModelViewMatrix
#define ProjMat          u_ProjectionMatrix
#define FogStart         u_FogStart
#define FogEnd           u_FogEnd
#define FogColor         u_FogColor
#define FogShape         u_FogShape

uniform sampler2D MainTex_Sampler;
uniform sampler2D LightMap_Sampler;

uniform float FogStart;
uniform float FogEnd;
uniform vec4 FogColor;
uniform int FogShape;

const vec4 ColorModulator = vec4(1.0);
const float GameTime = 0.0;
const vec2 ScreenSize = vec2(0.0);

#ifdef DISCARD
    #define AlphaCutoff (internal_AlphaCutoff)
#else
    const float AlphaCutoff = 0.0;
#endif

#define MipBias (internal_MipBias)
#define ChunkOffset (internal_ChunkOffset)

#ifdef VSH

    out float internal_MipBias;
    out vec3 internal_ChunkOffset;

    #define Position _vert_position
    #define Color _vert_color
    #define UV0 _vert_tex_diffuse_coord
    #define UV2 _vert_tex_light_coord
    
    const vec3 Normal = vec3(0.0, 1.0, 0.0);

    #ifdef DISCARD
        out float internal_AlphaCutoff;
    #endif

#endif

#ifdef FSH
    
    in float internal_MipBias;
    in float internal_ChunkOffset;

    #ifdef DISCARD
        in float internal_AlphaCutoff;
    #endif

#endif