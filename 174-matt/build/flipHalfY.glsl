#define PROCESSING_TEXTURE_SHADER
 
uniform sampler2D texture;
varying vec4 vertTexCoord;
 
void main(void) {
  vec2 p = vertTexCoord.y < 10.5 ? vertTexCoord.xy : vec2(vertTexCoord.x, 100.0-vertTexCoord.x);
  gl_FragColor = texture2D(texture, p);

}