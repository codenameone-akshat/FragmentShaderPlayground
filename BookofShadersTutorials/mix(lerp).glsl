#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;  // Canvas size (width,height)
uniform vec2 u_mouse;       // mouse position in screen pixels
uniform float u_time;       // Time in seconds since load

#define PI 3.14159265359
vec3 colorA = vec3(0.3804, 0.098, 0.7451);
vec3 colorB = vec3(0.8745, 0.4667, 0.0863);

// #define BASIC
#define PLOT

#ifdef BASIC
void main()
{
    float percent = abs(sin(u_time));
    
    vec3 color = mix(colorA, colorB, percent);


    gl_FragColor = vec4(color,1.0);
}
#endif

#ifdef PLOT

float plot (vec2 st, float pct){
  return  smoothstep( pct-0.01, pct, st.y) -
          smoothstep( pct, pct+0.01, st.y);
}

void main()
{
    vec2 st = gl_FragCoord.xy/u_resolution.xy;

    vec3 percent = vec3(st.x);

    vec3 color = mix(colorA, colorB, percent);
    

    // line modifiers
    percent.r = sin(st.x * PI);
    percent.g = pow(st.x, 3.0);
    percent.b = mix(0.0, 1.0, st.x);
    // colors for lines
    vec3 red = vec3(1,0,0);
    vec3 green = vec3(0,1,0);
    vec3 blue = vec3(0,0,1);

    color = mix(color, red, plot(st, percent.r)); // percent.r will return close to 1 where the line plot is
    color = mix(color, green, plot(st, percent.g)); 
    color = mix(color, blue, plot(st, percent.b));


    gl_FragColor = vec4(color,1.0);
}
#endif

