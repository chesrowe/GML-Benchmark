varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float noise_scroll;
float noise_size = 0.1;

vec2 hash( vec2 x )  // replace this by something better
{
    const vec2 k = vec2( 0.3183099, 0.3678794 );
    x = x*k + k.yx;
    return -1.0 + 2.0*fract( 16.0 * k*fract( x.x*x.y*(x.x+x.y)) );
}

float noise( in vec2 p )
{
    vec2 i = floor( p );
    vec2 f = fract( p );
    vec2 u = f*f*(3.0-2.0*f);

    return mix( mix( dot( hash( i + vec2(0.0,0.0) ), f - vec2(0.0,0.0) ),
                     dot( hash( i + vec2(1.0,0.0) ), f - vec2(1.0,0.0) ), u.x),
                mix( dot( hash( i + vec2(0.0,1.0) ), f - vec2(0.0,1.0) ),
                     dot( hash( i + vec2(1.0,1.0) ), f - vec2(1.0,1.0) ), u.x), u.y);
}


void main()// out vec4 fragColor, in vec2 fragCoord )
{
    vec2 p = v_vTexcoord*noise_size;//fragCoord.xy / iResolution.xy;
    p.x += noise_scroll;
    vec2 uv = p*vec2(512.0/512.0,1.0);//iResolution.x/iResolution.y,1.0);
    float f = 0.0;
   
    //fractal noise (4 octaves)
    uv *= 8.0;
    mat2 m = mat2( 1.6,  1.2, -1.2,  1.6 );
    f  = 0.5000*noise( uv ); uv = m*uv;
    f += 0.2500*noise( uv ); uv = m*uv;
    f += 0.1250*noise( uv ); uv = m*uv;
    f += 0.0625*noise( uv ); uv = m*uv;

    f = 0.5 + 0.5*f;
    gl_FragColor= vec4( f, f, f, 0.7 );
}