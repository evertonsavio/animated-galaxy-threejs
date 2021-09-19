uniform float uSize;

attribute float aScale;

varying vec3 vColor;
uniform float uTime;

void main() {
    vec4 modelPosition = modelMatrix * vec4(position, 1.0);

    modelPosition += uTime * 0.005;

    //Spin
    float angle = atan(modelPosition.x, modelPosition.z);
    float distanceOfParticleFromCenter = length(modelPosition.xz);
    float angleOffset = (1.0 / distanceOfParticleFromCenter) * uTime * 0.1;
    angle += angleOffset;
    modelPosition.x = cos(angle);
    modelPosition.z = sin(angle);

    vec4 viewPosition = viewMatrix * modelPosition;
    vec4 projectionPosition = projectionMatrix * viewPosition;
    gl_Position = projectionPosition;

    gl_PointSize = uSize * aScale;
    gl_PointSize *= ( 1.0 / - viewPosition.z );

    vColor = color;
}