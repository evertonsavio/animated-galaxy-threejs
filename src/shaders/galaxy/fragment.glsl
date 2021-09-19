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


    gl_FragColor = vec4(vec3(strenght), 1.0);
}