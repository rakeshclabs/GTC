#import "GPUImageFastBlurFilter.h"

//   Code based on http://rastergrid.com/blog/2010/09/efficient-gaussian-blur-with-linear-sampling/

NSString *const kGPUImageFastBlurVertexShaderString = SHADER_STRING
(
 attribute vec4 position;
 attribute vec2 inputTextureCoordinate;

 uniform highp float texelWidthOffset; 
 uniform highp float texelHeightOffset; 
 uniform highp float blurSize;
 
 varying highp vec2 centerTextureCoordinate;
 varying highp vec2 oneStepLeftTextureCoordinate;
 varying highp vec2 twoStepsLeftTextureCoordinate;
 varying highp vec2 oneStepRightTextureCoordinate;
 varying highp vec2 twoStepsRightTextureCoordinate;

// const float offset[3] = float[]( 0.0, 1.3846153846, 3.2307692308 );

 void main()
 {
     gl_Position = position;
          
     vec2 firstOffset = vec2(1.3846153846 * texelWidthOffset, 1.3846153846 * texelHeightOffset) * blurSize;
     vec2 secondOffset = vec2(3.2307692308 * texelWidthOffset, 3.2307692308 * texelHeightOffset) * blurSize;
     
     centerTextureCoordinate = inputTextureCoordinate;
     oneStepLeftTextureCoordinate = inputTextureCoordinate - firstOffset;
     twoStepsLeftTextureCoordinate = inputTextureCoordinate - secondOffset;
     oneStepRightTextureCoordinate = inputTextureCoordinate + firstOffset;
     twoStepsRightTextureCoordinate = inputTextureCoordinate + secondOffset;
 }
);


NSString *const kGPUImageFastBlurFragmentShaderString = SHADER_STRING
(
 precision highp float;

 uniform sampler2D inputImageTexture;
 
 varying highp vec2 centerTextureCoordinate;
 varying highp vec2 oneStepLeftTextureCoordinate;
 varying highp vec2 twoStepsLeftTextureCoordinate;
 varying highp vec2 oneStepRightTextureCoordinate;
 varying highp vec2 twoStepsRightTextureCoordinate;
 
// const float weight[3] = float[]( 0.2270270270, 0.3162162162, 0.0702702703 );
 
 void main()
 {
     lowp vec4 fragmentColor = texture2D(inputImageTexture, centerTextureCoordinate) * 0.2270270270;
     fragmentColor += texture2D(inputImageTexture, oneStepLeftTextureCoordinate) * 0.3162162162;
     fragmentColor += texture2D(inputImageTexture, oneStepRightTextureCoordinate) * 0.3162162162;
     fragmentColor += texture2D(inputImageTexture, twoStepsLeftTextureCoordinate) * 0.0702702703;
     fragmentColor += texture2D(inputImageTexture, twoStepsRightTextureCoordinate) * 0.0702702703;
     
     gl_FragColor = fragmentColor;
 }
);

NSString *const kGPUImageFastBlurIgnoringAlphaFragmentShaderString = SHADER_STRING
(
 precision highp float;
 
 uniform sampler2D inputImageTexture;
 
 varying highp vec2 centerTextureCoordinate;
 varying highp vec2 oneStepLeftTextureCoordinate;
 varying highp vec2 twoStepsLeftTextureCoordinate;
 varying highp vec2 oneStepRightTextureCoordinate;
 varying highp vec2 twoStepsRightTextureCoordinate;
 
 // const float weight[3] = float[]( 0.2270270270, 0.3162162162, 0.0702702703 );
 
 void main()
 {
     lowp vec3 fragmentColor = texture2D(inputImageTexture, centerTextureCoordinate).rgb * 0.2270270270;
     fragmentColor += texture2D(inputImageTexture, oneStepLeftTextureCoordinate).rgb * 0.3162162162;
     fragmentColor += texture2D(inputImageTexture, oneStepRightTextureCoordinate).rgb * 0.3162162162;
     fragmentColor += texture2D(inputImageTexture, twoStepsLeftTextureCoordinate).rgb * 0.0702702703;
     fragmentColor += texture2D(inputImageTexture, twoStepsRightTextureCoordinate).rgb * 0.0702702703;
     
     gl_FragColor = vec4(fragmentColor, 1.0);
 }
);

@implementation GPUImageFastBlurFilter

@synthesize blurPasses = _blurPasses;
@synthesize blurSize = _blurSize;

#pragma mark -
#pragma mark Initialization and teardown

- (id)init;
{
    if (!(self = [self initWithFragmentShaderFromString:kGPUImageFastBlurFragmentShaderString]))
    {
		return nil;
    }

    return self;
}

- (id)initWithFragmentShaderFromString:(NSString *)fragmentShaderString;
{
    if (!(self = [super initWithFirstStageVertexShaderFromString:kGPUImageFastBlurVertexShaderString firstStageFragmentShaderFromString:fragmentShaderString secondStageVertexShaderFromString:kGPUImageFastBlurVertexShaderString secondStageFragmentShaderFromString:fragmentShaderString]))
    {
		return nil;
    }
    
    firstBlurSizeUniform = [filterProgram uniformIndex:@"blurSize"];    
    secondBlurSizeUniform = [secondFilterProgram uniformIndex:@"blurSize"];

   // self.blurSize = 3.0;

    return self;
}

#pragma mark -
#pragma mark Rendering

- (void)renderToTextureWithVertices:(const GLfloat *)vertices textureCoordinates:(const GLfloat *)textureCoordinates sourceTexture:(GLuint)sourceTexture;
{
    [super renderToTextureWithVertices:vertices textureCoordinates:textureCoordinates sourceTexture:sourceTexture];
    
    for (NSUInteger currentAdditionalBlurPass = 1; currentAdditionalBlurPass < _blurPasses; currentAdditionalBlurPass++)
    {
        [super renderToTextureWithVertices:vertices textureCoordinates:[[self class] textureCoordinatesForRotation:kGPUImageNoRotation] sourceTexture:secondFilterOutputTexture];
    }
}


-(void)sizeofblurring:(CGFloat)fl
{
    NSLog(@" value is%f",fl);
    self.blurSize=fl;
}
#pragma mark -
#pragma mark Accessors

- (void)setBlurSize:(CGFloat)newValue;
{
    _blurSize = newValue;
    
    [self setFloat:_blurSize forUniform:firstBlurSizeUniform program:filterProgram];
    [self setFloat:_blurSize forUniform:secondBlurSizeUniform program:secondFilterProgram];
}

@end

