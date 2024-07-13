#version 330 core
#define FSH
#define BLOCK
#define SODIUM

#import <sodium:include/chunk_matrices.glsl>
#import <sodium:include/template.glsl>

#import <minecraft:include/fog.glsl>

#import <minecraft:include/render/block.fsh.glsl>

void main() {
    fragment();
}