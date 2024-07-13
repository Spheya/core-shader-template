#version 150
#define FSH
#define ENTITY
#define VANILLA
#define DISCARD 0.1
#define OVERLAY
#define CUTOUT_NO_CULL

#moj_import <bindings.glsl>
#moj_import <render/entity.fsh.glsl>

void main() {
    fragment();
}