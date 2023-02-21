#pragma header

vec2 uv = openfl_TextureCoordv.xy;
vec2 fragCoord = openfl_TextureCoordv*openfl_TextureSize;
vec2 iResolution = openfl_TextureSize;
uniform float iTime;
#define iChannel0 bitmap
#define texture flixel_texture2D
#define fragColor gl_FragColor
#define time iTime
#define SPEED 8.1

/*
	shader found here: https://www.shadertoy.com/view/WtGGRt
	
	converting to frag done by Tix.
*/

uniform float xSpeed = 0.8;
uniform float ySpeed = 0.0;
uniform float timeMulti = 0.2;

void main()
{
   float time = iTime * timeMulti;
   float c = cos(iTime*SPEED);
	float s = sin(iTime*SPEED);
	
   // no floor makes it squiqqly
   float xCoord = floor(fragCoord.x + time * xSpeed * iResolution.x); // formula responsable for moving the bitmap/camera on the X axis
   float yCoord = floor(fragCoord.y + time * ySpeed * iResolution.y); // formula responsable for moving the bitmap/camera on the Y axis
	
   vec2 coord = vec2(xCoord, yCoord);
   coord = mod(coord, iResolution.xy);
	
	vec2 uv = coord/iResolution.xy;
   // Time varying pixel color
   //vec3 col = 0.5 + 0.5*cos(iTime+uv.xyx+vec3(0,2,4));
   float col = texture(iChannel0, uv).x;


	
	mat4 hueRotation =	
					mat4( 	 0.299,  0.587,  0.114, 0.0,
					    	 0.299,  0.587,  0.114, 0.0,
					    	 0.299,  0.587,  0.114, 0.0,
					   		 0.000,  0.000,  0.000, 1.0) +
		
					mat4(	 0.701, -0.587, -0.114, 0.0,
							-0.299,  0.413, -0.114, 0.0,
							-0.300, -0.588,  0.886, 0.0,
						 	 0.000,  0.000,  0.000, 0.0) * c +
		
					mat4(	 0.168,  0.330, -0.497, 0.0,
							-0.328,  0.035,  0.292, 0.0,
							 1.250, -1.050, -0.203, 0.0,
							 0.000,  0.000,  0.000, 0.0) * s;
	
   vec3 color = vec3(col);


   fragColor = vec4(color,0.0) + texture(iChannel0, uv) * hueRotation;
}