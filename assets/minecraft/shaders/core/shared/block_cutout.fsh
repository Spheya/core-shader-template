#version 150
#define FSH
#define BLOCK
#define VANILLA
#define DISCARD 0.1
#define CUTOUT

#moj_import <bindings.glsl>
#moj_import <render/block.fsh.glsl>

void main() {
    fragment();
}