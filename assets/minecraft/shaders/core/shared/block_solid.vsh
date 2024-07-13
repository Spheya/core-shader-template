#version 150
#define VSH
#define BLOCK
#define VANILLA
#define SOLID

#moj_import <bindings.glsl>
#moj_import <render/block_header.vsh.glsl>
#moj_import <render/block.vsh.glsl>

void main() {
    vertex();
}