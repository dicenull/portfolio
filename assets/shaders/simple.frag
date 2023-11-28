#version 460 core

#include <flutter/runtime_effect.glsl>

precision mediump float;

uniform vec2 resolution;
uniform float amount;
out vec4 fragColor;

vec3 hsv(float h,float s,float v){return ((clamp(abs(fract(h+vec3(0.,.666,.333))*6.-3.)-1.,0.,1.)-1.)*s+1.)*v;}

void main() {
  vec2 coord = FlutterFragCoord().xy;
  vec2 resolution  = resolution.xy;
  vec2 uv = (coord  - 0.5 * resolution.xy) / resolution.y;

  fragColor = vec4(hsv(length(uv * .1) + amount, 1., 1.), .5);
}
