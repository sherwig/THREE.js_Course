varying vec2 vUv;
uniform float uTime;

#define PI 3.1415926535897932384626433832795

float random(vec2 st)
{
  return fract(sin(dot(st.xy, vec2(12.9898,78.233))) * 43758.5453123);
}

vec2 rotate(vec2 uv, float rotation, vec2 mid)
{
    return vec2(
      cos(rotation) * (uv.x - mid.x) + sin(rotation) * (uv.y - mid.y) + mid.x,
      cos(rotation) * (uv.y - mid.y) - sin(rotation) * (uv.x - mid.x) + mid.y
    );
}

vec4 permute(vec4 x)
{
    return mod(((x*34.0)+1.0)*x, 289.0);
}

vec2 fade(vec2 t)
{
    return t*t*t*(t*(t*6.0-15.0)+10.0);
}

float cnoise(vec2 P)
{
    vec4 Pi = floor(P.xyxy) + vec4(0.0, 0.0, 1.0, 1.0);
    vec4 Pf = fract(P.xyxy) - vec4(0.0, 0.0, 1.0, 1.0);
    Pi = mod(Pi, 289.0); // To avoid truncation effects in permutation
    vec4 ix = Pi.xzxz;
    vec4 iy = Pi.yyww;
    vec4 fx = Pf.xzxz;
    vec4 fy = Pf.yyww;
    vec4 i = permute(permute(ix) + iy);
    vec4 gx = 2.0 * fract(i * 0.0243902439) - 1.0; // 1/41 = 0.024...
    vec4 gy = abs(gx) - 0.5;
    vec4 tx = floor(gx + 0.5);
    gx = gx - tx;
    vec2 g00 = vec2(gx.x,gy.x);
    vec2 g10 = vec2(gx.y,gy.y);
    vec2 g01 = vec2(gx.z,gy.z);
    vec2 g11 = vec2(gx.w,gy.w);
    vec4 norm = 1.79284291400159 - 0.85373472095314 * vec4(dot(g00, g00), dot(g01, g01), dot(g10, g10), dot(g11, g11));
    g00 *= norm.x;
    g01 *= norm.y;
    g10 *= norm.z;
    g11 *= norm.w;
    float n00 = dot(g00, vec2(fx.x, fy.x));
    float n10 = dot(g10, vec2(fx.y, fy.y));
    float n01 = dot(g01, vec2(fx.z, fy.z));
    float n11 = dot(g11, vec2(fx.w, fy.w));
    vec2 fade_xy = fade(Pf.xy);
    vec2 n_x = mix(vec2(n00, n01), vec2(n10, n11), fade_xy.x);
    float n_xy = mix(n_x.x, n_x.y, fade_xy.y);
    return 2.3 * n_xy;
}


void main()
{
  // pattern 1
  // gl_FragColor = vec4(vUv.x,vUv.y,1.0, 1.0);

  //Pattern 3
  // float strength = vUv.x;
  // gl_FragColor = vec4(vec3(strength), 1.0);


  //Pattern 4
  // float strength = vUv.y;
  // gl_FragColor = vec4(vec3(strength), 1.0);

  //Pattern 5
  // float strength = 1.0-vUv.y;
  // gl_FragColor = vec4(vec3(strength), 1.0);


  // //Pattern 6
  // float strength = vUv.y*10.0;
  // gl_FragColor = vec4(vec3(strength), 1.0);

  //Pattern 7
  // float strength = mod(vUv.y*10.0,1.0);
  // gl_FragColor = vec4(vec3(strength), 1.0);


  //Pattern 8
  // float strength = mod(vUv.y*10.0,1.0);
  // float strength2 = mod(vUv.x*10.0,1.0);
  //
  // float siner=abs(sin(uTime)*.9);
  // strength=step(siner,strength);
  // strength2=step(siner,strength2);
  //
  // gl_FragColor = vec4(strength,strength2, strength2, 1.0);

  //Pattern 9
  // float strength = mod(vUv.y*10.0,1.0);
  // // float siner=abs(sin(uTime)*.9);
  // strength=step(.9,strength);
  // gl_FragColor = vec4(vec3(strength), 1.0);

  //Pattern 10
  // float strength = mod(vUv.x*10.0,1.0);
  // // float siner=abs(sin(uTime)*.9);
  // strength=step(.9,strength);
  // gl_FragColor = vec4(vec3(strength), 1.0);

  // //Pattern 11
  // float strength=step(.9,mod(vUv.x*10.0*cos(uTime*.3),1.0));
  // strength*=step(.9,mod(vUv.y*10.0*sin(uTime*.3),1.0));
  // gl_FragColor = vec4(strength,strength,strength, 1.0);

  //Pattern 12
  // float strength=step(.5*abs(sin(uTime)),mod(vUv.x*10.0,1.0));
  // strength*=step(.5*abs(cos(uTime)),mod(vUv.y*10.0,1.0));
  // gl_FragColor = vec4(strength,strength,strength, 1.0);

  //Pattern 14
  // float barX=step(.4*abs(cos(uTime)),mod(vUv.x*10.0,1.0));
  // barX*=step(.8,mod(vUv.y*10.0,1.0));
  //
  // float barY=step(.8,mod(vUv.x*10.0,1.0));
  // barY*=step(.4*abs(sin(uTime)),mod(vUv.y*10.0,1.0));
  //
  // float strength=barX+barY;
  // gl_FragColor = vec4(strength,strength,strength, 1.0);


  // //Pattern 15
  // float barX=step(.4*abs(sin(uTime*.3)),mod(vUv.x*10.0,1.0));
  // barX*=step(.8*abs(sin(uTime*.3)),mod(vUv.y*10.0+0.2,1.0));
  //
  // float barY=step(.8*abs(sin(uTime*.3)),mod(vUv.x*10.0+0.2,1.0));
  // barY*=step(.4*abs(sin(uTime*.3)),mod(vUv.y*10.0,1.0));
  //
  // float strength=barX+barY;
  // gl_FragColor = vec4(strength,strength,strength, 1.0);


  // //Pattern 16
  // float barX=step(.4*abs(sin(uTime*.3)),mod(vUv.x*10.0,1.0));
  // barX*=step(.8*abs(sin(uTime*.3)),mod(vUv.y*10.0+0.2,1.0));
  //
  // float barY=step(.8*abs(sin(uTime*.3)),mod(vUv.x*10.0+0.2,1.0));
  // barY*=step(.4*abs(sin(uTime*.3)),mod(vUv.y*10.0,1.0));
  //
  // float strength=barX+barY;
  // gl_FragColor = vec4(strength,strength,strength, 1.0);


  //Pattern 16
  // float strength=abs(vUv.x-0.5*sin(uTime));
  // gl_FragColor = vec4(strength,strength,strength, 1.0);

  //Pattern 17
  // float strength=min(abs(vUv.x-0.5),abs(vUv.y-0.5));
  // gl_FragColor = vec4(strength,strength,strength, 1.0);

  //Pattern 18
  // float strength=max(abs(vUv.x-0.5),abs(vUv.y-0.5));
  // gl_FragColor = vec4(strength,strength,strength, 1.0);

  //Pattern 18
  // float strength=step(.45*abs(sin(uTime*.3)),max(abs(vUv.x-0.5),abs(vUv.y-0.5)));
  // gl_FragColor = vec4(strength,strength,strength, 1.0);

  //Pattern 19
  // float strength=step(.45*abs(sin(uTime*.3)),max(abs(vUv.x-0.5),abs(vUv.y-0.5)));
  // gl_FragColor = vec4(strength,strength,strength, 1.0);


  // //Pattern 20
  // float square1=step(.2*abs(sin(uTime*.2)),max(abs(vUv.x-0.5),abs(vUv.y-0.5)));
  // float square2=1.0-step(.25*abs(sin(uTime)),max(abs(vUv.x-0.5),abs(vUv.y-0.5)));
  // float strength=square1*square2;
  //
  // gl_FragColor = vec4(strength,strength,strength, 1.0);

  // // Pattern 21
  // float strength=floor(vUv.x*10.0)/10.0;
  // gl_FragColor = vec4(strength,strength,strength, 1.0);

  // Pattern 22
  // float strength=floor(vUv.x*10.0)/10.0;
  // strength*=floor(vUv.y*10.0)/10.0*abs(sin(uTime));
  //
  // gl_FragColor = vec4(strength,strength,strength, 1.0);


  // // Pattern 23
  // float strength=random(vUv/100.0*abs(sin(uTime*.03)));
  //
  // gl_FragColor = vec4(strength,strength,strength, 1.0);

  // // Pattern 24
  // vec2 griduv=vec2(
  //   floor(vUv.x*10.0)/10.0,
  //   floor(vUv.y*10.0)/10.0
  //   );
  // float strength=random(griduv*abs(sin(uTime*.0000003)));
  //
  // gl_FragColor = vec4(strength,strength,strength, 1.0);


  // // Pattern 25
  // vec2 griduv=vec2(
  //   floor(vUv.x+vUv.y*cos(uTime*.3)*10.0)/10.0,
  //   floor(vUv.y+vUv.x*sin(uTime*.3)*10.0)/10.0
  //   );
  // float strength=random(griduv);
  //
  // gl_FragColor = vec4(strength,strength,strength, 1.0);


  // // Pattern 26
  // float strength=length(vUv);
  // gl_FragColor = vec4(strength,strength,strength, 1.0);

  // // Pattern 27
  // float strength=distance(vUv,vec2(0.5*cos(uTime)+.5,0.5*sin(uTime)+.5));
  // gl_FragColor = vec4(strength,strength,strength, 1.0);

  // Pattern 28
  // float strength=1.0*abs(sin(uTime))-distance(vUv,vec2(0.5,0.5));
  // gl_FragColor = vec4(strength,strength,strength, 1.0);


  // // Pattern 29
  // float strength=0.1*abs(sin(uTime))/distance(vUv,vec2(0.5,0.5));
  // gl_FragColor = vec4(strength,strength,strength, 1.0);

  // // Pattern 30
  // vec2 light= vec2(vUv.x*0.2+0.4,vUv.y);
  // float strength=0.1*abs(sin(uTime))/distance(light,vec2(0.5,0.5));
  // gl_FragColor = vec4(strength,strength,strength, 1.0);

  // // Pattern 31
  // vec2 light= vec2(vUv.x*0.1+0.45,vUv.y*.5+.25);
  // float lightX=0.015*abs(sin(uTime*.4))/distance(light,vec2(0.5,0.5));
  //
  // vec2 light2= vec2(vUv.y*0.1+0.45,vUv.x*.5+.25);
  // float lightY=0.015*abs(cos(uTime*.4))/distance(light2,vec2(0.5,0.5));
  //
  // float strength=lightX+lightY;
  // gl_FragColor = vec4(strength,strength,strength, 1.0);


  // // Pattern 32
  // vec2 rotated_uv=rotate(vUv,PI*sin(uTime*.2),vec2(0.5,0.5));
  // vec2 light= vec2(rotated_uv.x*0.1+0.45,rotated_uv.y*.5+.25);
  // float lightX=0.015*abs(sin(uTime*.4))/distance(light,vec2(0.5,0.5));
  //
  // vec2 light2= vec2(rotated_uv.y*0.1+0.45,rotated_uv.x*.5+.25);
  // float lightY=0.015*abs(cos(uTime*.4))/distance(light2,vec2(0.5,0.5));
  //
  // float strength=lightX+lightY;
  // gl_FragColor = vec4(strength,strength,strength, 1.0);




  // // Pattern 33
  // vec2 rotated_uv=rotate(vUv,PI*sin(uTime*.2),vec2(0.5,0.5));

  // float strength = step(0.25,distance(vUv,vec2(0.5)));
  // gl_FragColor = vec4(strength,strength,strength, 1.0);



  // // Pattern 34
  // float strength = abs(distance(vUv,vec2(0.5))-0.25);
  // gl_FragColor = vec4(strength,strength,strength, 1.0);

  // // Pattern 35
  // float strength = 1.0-step(0.01,abs(distance(vUv,vec2(0.5))-0.25*abs(sin(uTime*.3))));
  // gl_FragColor = vec4(strength,strength,strength, 1.0);



  // // Pattern 36
  // vec2 waveUv =vec2(
  //   vUv.x,
  //   vUv.y+sin(vUv.x*30.0+cos(uTime*15.0)/10.0)*0.1
  //   );
  // float strength = 1.0-step(0.01,abs(distance(waveUv,vec2(0.5))-0.25*abs(sin(uTime*.3))));
  //
  // gl_FragColor = vec4(strength,strength,strength, 1.0);

  // // Pattern 38
  // vec2 waveUv =vec2(
  //   vUv.x+sin(vUv.y*40.0+cos(uTime*15.0)/30.0)*0.1,
  //   vUv.y+sin(vUv.x*50.0+cos(uTime*15.0)/30.0)*0.1
  //   );
  // float strength = 1.0-step(0.01,abs(distance(waveUv,vec2(0.5))-0.25*abs(sin(uTime*.3))));
  //
  // gl_FragColor = vec4(strength,strength,strength, 1.0);



  // // Pattern 39
  // vec2 waveUv =vec2(
  //   vUv.x+sin(vUv.y*400.0+cos(uTime*15.0)/30.0)*0.1,
  //   vUv.y+sin(vUv.x*600.0+cos(uTime*15.0)/30.0)*0.1
  //   );
  // float strength = 1.0-step(0.01,abs(distance(waveUv,vec2(0.5))-0.25*abs(sin(uTime*.3))));
  //
  // gl_FragColor = vec4(strength,strength*sin(uTime*.4),strength*sin(uTime), 1.0);


  // // Pattern 40
  // float angle = atan(vUv.x*abs(cos(uTime/4.0)),vUv.y*abs(sin(uTime/4.0)));
  // float strength = angle;
  //
  // gl_FragColor = vec4(strength,strength*sin(uTime*.4),strength*sin(uTime), 1.0);

  // // Pattern 41
  // float angle = atan(vUv.x*abs(cos(uTime/4.0))-0.5,vUv.y*abs(sin(uTime/4.0)));
  // float strength = angle;
  //
  // gl_FragColor = vec4(strength,strength*sin(uTime*.4),strength*sin(uTime), 1.0);


  // // // Pattern 42
  // float angle = atan(vUv.x*abs(cos(uTime/4.0))-0.25,vUv.y*abs(sin(uTime/4.0))-0.25);
  // angle/=PI*2.0;
  // angle+=.5;
  // float strength = angle;
  //
  // gl_FragColor = vec4(strength,strength,strength, 1.0);



  // // Pattern 44
  // float angle = atan(vUv.x*abs(cos(uTime/4.0))-PI/12.0,vUv.y*abs(sin(uTime/4.0))-PI/12.0);
  // angle/=PI*2.0;
  // angle+=.5;
  // angle*=50.0*sin(uTime*.2);
  // angle =mod(angle,1.0);
  // float strength = angle;
  //
  // gl_FragColor = vec4(strength,strength,strength, 1.0);

  // // // Pattern 44
  // float angle = atan(vUv.x*abs(cos(uTime/4.0))-PI/12.0,vUv.y*abs(sin(uTime/4.0))-PI/12.0);
  // angle/=PI*2.0;
  // angle+=.5;
  // float strength = sin(angle*100.0);
  //
  // gl_FragColor = vec4(strength,strength,strength, 1.0);


  // // Pattern 45
  // float angle = atan(vUv.x-.5,vUv.y-.5);
  // angle/=PI*2.0;
  // angle+=.5;
  // float sinusoid = sin(angle*100.0);
  //
  // float radius = 0.25+sinusoid*0.1*sin(uTime);
  // float strength = 1.0-step(0.01,abs(distance(vUv,vec2(0.5))-radius));
  //
  // gl_FragColor = vec4(strength,strength,strength, 1.0);



  // // Pattern 46
  // float strength = cnoise(vUv*10.0);
  // gl_FragColor = vec4(strength,strength,strength, 1.0);

  // // Pattern 47
  // float strength = step(0.0,cnoise(vUv*10.0+uTime));
  // gl_FragColor = vec4(strength*sin(uTime*.3),strength,strength*cos(uTime*.4), 1.0);

  // // Pattern 48
  // float strength = abs(sin(uTime))*1.0-abs(cnoise(vUv*10.0));
  // gl_FragColor = vec4(strength,strength,strength, 1.0);

  // // // Pattern 49
  // float strength = sin(cnoise(vUv*10.0)*20.0*uTime );
  // gl_FragColor = vec4(strength,strength,strength, 1.0);

  // with color

  float strength = step(0.9,sin(cnoise(vUv*10.0)*20.0*uTime ));
  // float strength =step(0.9,sin(cnoise(vUv*10.0)*20.0));
  vec3 blackColor = vec3(0.0);
  vec3 uvColor = vec3(vUv,1.0);
  vec3 mixedColor =mix(blackColor,uvColor,strength);

  gl_FragColor = vec4(mixedColor, 1.0);
  // // // Pattern 50
  // float strength = step(0.1,sin(cnoise(vUv*10.0)*20.0*uTime ));
  // gl_FragColor = vec4(strength,strength,strength, 1.0);







}
