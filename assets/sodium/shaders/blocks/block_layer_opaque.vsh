#version 330 core
#define VSH
#define BLOCK
#define SODIUM

#import <sodium:include/chunk_matrices.glsl>
#import <sodium:include/chunk_vertex.glsl>
#import <sodium:include/bindings.glsl>

#import <minecraft:include/light.glsl>
#import <minecraft:include/fog.glsl>

#import <minecraft:include/render/block.vsh.glsl>
#import <sodium:include/chunk_material.glsl>

uniform vec3 u_RegionOffset;

uvec3 _get_relative_chunk_coord(uint pos) {
    // Packing scheme is defined by LocalSectionIndex
    return uvec3(pos) >> uvec3(5u, 0u, 2u) & uvec3(7u, 3u, 7u);
}

vec3 _get_draw_translation(uint pos) {
    return _get_relative_chunk_coord(pos) * vec3(16.0);
}

void main() {
    _vert_init();

    vec3 translation = u_RegionOffset + _get_draw_translation(_draw_id);

    internal_MipBias = _material_mip_bias(_material_params);
    internal_ChunkOffset = translation;

#ifdef DISCARD
    internal_AlphaCutoff = _material_alpha_cutoff(_material_params);
#endif

    vertex();
}
