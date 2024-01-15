////  hair.fx
//  MMDStarRail4Fun
//
//  Created by 洪梓嫣 on 2022/9/30.
//  Copyright © 2019 Bilibili. All rights reserved.
//

#define LIGHTMAP_TEXTURE "../Texture2D/Avatar_Sparkle_00_Hair_LightMap.png"
#define COOLRAMP_TEXTURE "../Texture2D/Avatar_Sparkle_00_hair_Cool_Ramp.png"
#define WARMRAMP_TEXTURE "../Texture2D/Avatar_Sparkle_00_Hair_Warm_Ramp.png"

static const float BumpScale = 1.0; // 法线图强度 Range(0, +∞)
static const bool InvertNormalGreenChannel = false; // 反转法线图绿通道

static const float ShadowRampOffset = 0.75;  // 阴影梯度中心位置 Range(0, 1)
static const float ShadowRampGamma = 1;     // 阴影梯度伽马矫正 Range(0,01, +∞)
static const float MainLightColorUsage = 1; // 主光源颜色影响程度 Range(0, 1)
static const float MainLightBrightness = 1.667; // 主光源亮度 Range(0, +∞)
static const float IndirectLightUsage = 0.1;    // 间接光源影响程度 Range (0, 1)

static const float Gamma = 1.5; // 伽马矫正, 值越大, 亮的越亮暗的越暗 Range(0.1, +∞)
static const float ToneCurveUsage = 0;  // 色调映射曲线影响, 值越大, 越接近真实颜色 Range(0, 1)

#include "internal/define.fxsub"

#define DEBUG_FLAG 0 

// 仅1条
MaterialDetail MDS[1] = {
    // 第 0 行
    {
        0,  // 阴影梯度索引
        0,  // 阴影位置 Range(-1, 1)
        0.1,  // 阴影软度 Range(0, 1)

        0.5,  // 粗糙度
        0,  // 金属度
        2.5,  // 高光强度 Range(0, 10)
        -0.04,  // 高光阈值 Range(-1, 1)
        0.1,  // 高光软度 Range(0, 1)
        float3(0.04, 0.04, 0.04),   // 非金属反射率 Range(0,1)
        float3(1.0, 1.0, 1.0),   //金属反射率 Range(0, 1)
    }
};

#include "internal/main.fxsub"
