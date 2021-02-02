
// precision mediump float;

varying float vRandom;
uniform vec3 uColor;
uniform sampler2D uTexture;
uniform vec2 u_resolution;
uniform float uTime;


// varying float uTime;
varying vec2 vUv;
varying float vElevation;


void main()
{
  vec3 color = vec3(abs(sin(uTime)),abs(cos(uTime)),.8);
  color.rgb*=vElevation*.5+0.8;
  gl_FragColor= vec4(color,1.0);
  // vec4 textureColor =texture2D(uTexture,vUv);
  // textureColor.rgb *= vElevation*2.0+0.5;
  // gl_FragColor=textureColor;
  // vec3 color = vec3(1.0);
  // vec3 color.rgb+= (vRandom,vRandom*.5,1.0)
   // gl_FragColor= vec4(uColor,1.0);
  // gl_FragColor= vec4(color,1.0);

}


// float random2d(vec2 coord){
//   return fract(sin(dot(coord.xy,vec2(12.9898,78.233)))*43578.5453);
// }
//
//
// void main(){
//   vec2 coord =gl_FragCoord.xy*abs(sin(uTime/4.0)*0.012);
//   vec3 color = vec3(0.0);
//   // color.rgb *= vElevation*2.0+0.5;
//
//   coord-=uTime +vec2(sin(coord.y),cos(coord.x));
//
//   float rand1=fract(random2d(floor(coord))+uTime/60.0);
//   float rand2=fract(random2d(floor(coord))+uTime/40.0);
//
//   rand1*=0.4-length(fract(coord));
//   gl_FragColor =vec4(0.0,rand2*rand1*4.0*cos(uTime),rand1*sin(uTime)*4.0,1.0);
//
// }

// void main(){
//
//   vec2 coord =(gl_FragCoord.xy/u_resolution.xy);
//
//   float color=0.0;
//
//   color+=sin(coord.x*12.0*abs(sin(uTime/4.0))+sin(uTime+coord.y*90.0+cos(coord.x*30.0+uTime*2.0)))*0.5;
//   // color+=cos(coord.y*8.0+cos(u_time+coord.x*90.0+sin(coord.y*30.0+u_time*2.0)))*0.5;
//   gl_FragColor =vec4(vec3(color*coord.x+sin(uTime/2.0),color*coord.y+cos(uTime/2.0),color),1.0);
//
// }






// void main(){
//   vec2 coord =(gl_FragCoord.xy/u_resolution.xy);
//
//   vec3 color=vec3(0.0);
//   color.rgb *= vElevation*2.0+0.5;
//   float angle = atan(-coord.y+0.5, coord.x-0.5)*0.1;
//   float len = length(coord-vec2(sin(uTime*0.5),cos(uTime*0.5)));
//
//   color.r+=sin(len*40.0+angle*40.0+uTime);
//   color.b+=cos(len*90.0+angle*60.0-uTime);
//   color.g+=sin(len*50.0+angle*50.0+3.0);
//
//   gl_FragColor =vec4(color,1.0);
//
//
// }
