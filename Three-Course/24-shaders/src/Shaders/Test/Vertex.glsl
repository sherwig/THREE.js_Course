
// uniform mat4 projectionMatrix;
// uniform mat4 viewMatrix;
// uniform mat4 modelMatrix;
uniform vec2 uFrequency;
uniform float uTime;

// attribute vec3 position;
attribute float aRandom;

// attribute vec2 uv;
varying vec2 vUv;
varying float vElevation;
// varying float uTime;


varying float vRandom;

void main()
{
    vec4 modelPosition = modelMatrix * vec4(position, 1.0);

    //Make a flag
    float elevation =sin(modelPosition.x*uFrequency.x-uTime)*sin(uTime*.5)*3.0;

    elevation+= cos(modelPosition.y*uFrequency.y-uTime)*cos(uTime*.3)*2.0;

    modelPosition.z+= elevation;
    // modelPosition.z+=sin(modelPosition.x*uFrequency.x-uTime)*0.1;
    // modelPosition.z+=sin(modelPosition.y*uFrequency.y-uTime)*0.1;


    //for a bumpy strucute
    // modelPosition.z+=aRandom*.1;
    vec4 viewPosition = viewMatrix * modelPosition;
    vec4 projectedPosition = projectionMatrix * viewPosition;

    gl_Position = projectedPosition;

    vElevation=elevation;
    vUv=uv;

    // vRandom=aRandom;

}
