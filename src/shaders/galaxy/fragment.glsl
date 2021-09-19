void main() {

    //Disc
    float strenght = distance(gl_PointCoord, vec2(0.5));
    strenght = 1.0 - step(0.5, strenght);

    gl_FragColor = vec4(vec3(strenght), 1.0);
}