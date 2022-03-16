#define M_AP1_TO_REC709 mat3(1.705079555511475, -0.1297005265951157, -0.02416634373366833, -0.6242334842681885, 1.138468623161316, -0.1246141716837883, -0.0808461606502533, -0.008768022060394287, 1.148780584335327)

vec3 mx_srgb_texture_to_lin_rec709(vec3 color)
{
    vec3 breakPnt = vec3(0.03928571566939354, 0.03928571566939354, 0.03928571566939354);
    vec3 slope = vec3(0.07738015800714493, 0.07738015800714493, 0.07738015800714493);
    vec3 scale = vec3(0.9478672742843628, 0.9478672742843628, 0.9478672742843628);
    vec3 offset = vec3(0.05213269963860512, 0.05213269963860512, 0.05213269963860512);
    vec3 isAboveBreak = vec3(greaterThan(color, breakPnt));
    vec3 powSeg = pow(max(vec3(0.0), scale * color + offset), vec3(2.4));
    vec3 linSeg = color * slope;
    return isAboveBreak * powSeg + (vec3(1.0) - isAboveBreak) * linSeg;
}
