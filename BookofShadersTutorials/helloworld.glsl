#ifdef GL_ES
precision mediump float;
#endif

uniform float u_time;       // Time in seconds since load

void main()
{
    float sintime = abs(sin(u_time));
    float r_sintime = 1.0 - sintime;
    gl_FragColor = vec4(sintime, 1, r_sintime ,1.0);
}