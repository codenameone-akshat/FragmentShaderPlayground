#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;  // Canvas size (width,height)
uniform vec2 u_mouse;       // mouse position in screen pixels
uniform float u_time;       // Time in seconds since load

// #define LINE
// #define CURVE
// #define STEP
#define SMOOTHSTEP
// #define PLOT_FUNC_EXAMPLE
// #define SINE

#ifdef LINE

float plot(vec2 st)
{
    return smoothstep(0.01, 0.0, abs(st.y - st.x));
}

void main()
{
    vec2 st = gl_FragCoord.xy/u_resolution;
    
    vec3 color = vec3(st.x); // b&w gradient towards x linear distribution
    
    float plt = plot(st); // line plot
    
    vec3 lineColor = vec3(0.0, 1.0, 0.0);

    color = color*(1.0 - plt);

    // color the line
    color += plt*lineColor;

    gl_FragColor = vec4(color, 1.0);
}

#endif

#ifdef CURVE

float plot(vec2 st, float pct)
{
    return smoothstep(pct - 0.05, pct, st.y) - smoothstep(pct, pct + 0.05, st.y);
}

void main()
{
    vec2 st = gl_FragCoord.xy/u_resolution;
    
    float func = pow(st.x,3.0);

    vec3 color = vec3(func); // b&w gradient towards x linear distribution
    
    float plt = plot(st, func); // line plot
    
    vec3 lineColor = vec3(0.0, 1.0, 0.0);

    color = color*(1.0 - plt);

    // color the line
    color += plt*lineColor;

    gl_FragColor = vec4(color, 1.0);
}

#endif

#ifdef STEP

float plot(vec2 st, float pct)
{
    return smoothstep(pct - 0.05, pct, st.y) - smoothstep(pct, pct + 0.05, st.y);
}

void main()
{
    vec2 st = gl_FragCoord.xy/u_resolution;
    
    float func = step(0.5,st.x); // will return 1 in case value is over 0.5

    vec3 color = vec3(func); // b&w gradient towards x linear distribution
    
    float plt = plot(st, func); // line plot
    
    vec3 lineColor = vec3(0.0, 1.0, 0.0);

    color = color*(1.0 - plt);

    // color the line
    color += plt*lineColor;

    gl_FragColor = vec4(color, 1.0);
}

#endif


#ifdef SMOOTHSTEP

float plot(vec2 st, float pct)
{
    return smoothstep(pct - 0.01, pct, st.y) - smoothstep(pct, pct + 0.01, st.y);
}

void main()
{
    vec2 st = gl_FragCoord.xy/u_resolution;
    
    float func = smoothstep(0.1, 0.9, st.x); // will smoothly return 1-ish in for values between .1 and .9

    vec3 color = vec3(func); // b&w gradient towards x linear distribution
    
    float plt = plot(st, func); // line plot
    
    vec3 lineColor = vec3(0.0, 1.0, 0.0);

    color = color*(1.0 - plt);

    // color the line
    color += plt*lineColor;

    gl_FragColor = vec4(color, 1.0);
}

#endif

#ifdef PLOT_FUNC_EXAMPLE

float plot(vec2 st)
{
    //     green from 0.2 to 0.5      green from 0.5 to 0.8
    return smoothstep(0.2,0.5,st.x) - smoothstep(0.5,0.8,st.x);
}

void main()
{
    vec2 st = gl_FragCoord.xy/u_resolution;
    
    vec3 color = vec3(st.x); // b&w gradient towards x linear distribution
    
    float plt = plot(st); // line plot
    
    vec3 lineColor = vec3(0.0, 1.0, 0.0);

    color = color*(1.0 - plt);

    // color the line
    color += plt*lineColor;

    gl_FragColor = vec4(color, 1.0);
}

#endif

#ifdef SINE

float plot(vec2 st, float pct)
{
    return smoothstep(pct - 0.01, pct, st.y) - smoothstep(pct, pct + 0.01, st.y);
}

void main()
{
    vec2 st = gl_FragCoord.xy/u_resolution;
    
    float func = abs(sin(3.14*st.x));

    vec3 color = vec3(func); // b&w gradient towards x linear distribution
    
    float plt = plot(st, func); // line plot
    
    vec3 lineColor = vec3(0.0, 1.0, 0.0);

    color = color*(1.0 - plt);

    // color the line
    color += plt*lineColor;

    gl_FragColor = vec4(color, 1.0);
}

#endif