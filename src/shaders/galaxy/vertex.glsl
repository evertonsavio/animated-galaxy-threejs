uniform float uSize;

attribute float aScale;

varying vec3 vColor;
uniform float uTime;

attribute vec3 aRadomness;

void main() {
    vec4 modelPosition = modelMatrix * vec4(position, 1.0);

    //Spin
    float angle = atan(modelPosition.x, modelPosition.z);
    float distanceOfParticleFromCenter = length(modelPosition.xz);
    float angleOffset = (1.0 / distanceOfParticleFromCenter) * uTime * 0.05;
    angle += angleOffset;
    modelPosition.x = distanceOfParticleFromCenter * cos(angle);
    modelPosition.z = distanceOfParticleFromCenter * sin(angle);

    //Randonmess
    //modelPosition.x += aRadomness.x;
    //modelPosition.y += aRadomness.y;
    //modelPosition.z += aRadomness.z;
    modelPosition.xyz += aRadomness;

    vec4 viewPosition = viewMatrix * modelPosition;
    vec4 projectionPosition = projectionMatrix * viewPosition;
    gl_Position = projectionPosition;

    gl_PointSize = uSize * aScale;
    gl_PointSize *= ( 1.0 / - viewPosition.z );

    vColor = color;
}