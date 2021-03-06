varying vec3 vColor;

void main() {

    //Disc
    //float strenght = distance(gl_PointCoord, vec2(0.5));
    //strenght = 1.0 - step(0.5, strenght);

    //Diffuse Point
    //float strenght = distance(gl_PointCoord, vec2(0.5));
    //strenght *= 2.0;
    //strenght = 1.0 - strenght;

    //light Point
    float strenght = distance(gl_PointCoord, vec2(0.5));
    strenght = 1.0 - strenght;
    strenght = pow(strenght, 5.0);

    //Final Color
    vec3 color = mix(vec3(0.0), vColor, strenght);


    gl_FragColor = vec4(color, 1.0);
}