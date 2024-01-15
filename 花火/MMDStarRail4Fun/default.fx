////  default.fx
//  MMDStarRail4Fun
//
//  Created by 洪梓嫣 on 2022/9/30.
//  Copyright © 2019 Bilibili. All rights reserved.
//

#define COOLRAMP_TEXTURE "../Texture2D/Avatar_Sparkle_00_Body_Cool_Ramp.png"
#define WARMRAMP_TEXTURE "../Texture2D/Avatar_Sparkle_00_Body_Warm_Ramp.png"

static const float BumpScale = 1.0; // 法线图强度 Range(0, +∞)
static const bool InvertNormalGreenChannel = false; // 反转法线图绿通道

static const float ShadowRampOffset = 0.75;  // 阴影梯度中心位置 Range(0, 1)
static const float ShadowRampGamma = 1;     // 阴影梯度伽马矫正 Range(0,01, +∞)
static const float MainLightColorUsage = 1; // 主光源颜色影响 Range(0, 1)
static const float MainLightBrightness = 1.667; // 主光源亮度 Range(0, +∞)
static const float IndirectLightUsage = 0.1;    // 间接光源影响 Range (0, 1)

static const float2 StockingTileScale = float2(20, 20); // 丝袜网格缩小率
static const float2 StockingTileOffset = float2(0, 0);  // 丝袜网格偏移
static const float3 StockingLightColor = float3(1.08, 0.889794, 0.5140926); // 丝袜亮色
static const float3 StockingTransitionColor = float3(0.360381, 0.242986, 0.358131); //丝袜过渡色
static const float3 StockingDarkColor = float3(0,0,0);  // 丝袜暗色
static const float StockingTransitionThreshold = 0.58;  // 丝袜过渡阈值 Range(0, 1)
static const float StockingTransitionPower = 1; // 丝袜过渡强度 Range(0.01, +∞)
static const float StockingTransitionHardness = 0.4;    // 丝袜过渡硬度 Range(0, 1)
static const float StockingTileUsage = 0.1; // 丝袜网格影响 Range(0, 1)

static const float Gamma = 1.5; // 伽马矫正, 值越大, 亮的越亮暗的越暗 Range(0.1, +∞)
static const float ToneCurveUsage = 0;  // 色调映射曲线影响, 值越大, 越接近真实颜色 Range(0, 1)

#include "internal/define.fxsub"

#define DEBUG_FLAG 0 

// 共8条, 依次对应光照图Alpha通道灰度值0.02, 0.15, 0.27, 0.40, 0.52, 0.65, 0.77, 0.90
MaterialDetail MDS[8] = {
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
    },
    // 第 1 行
    {
        5,  // 阴影梯度索引
        0,  // 阴影位置 Range(-1, 1)
        0.1,  // 阴影软度 Range(0, 1)

        0.5,  // 粗糙度
        0,  // 金属度
        2.5,  // 高光强度 Range(0, 10)
        -0.04,  // 高光阈值 Range(-1, 1)
        0.1,  // 高光软度 Range(0, 1)
        float3(0.04, 0.04, 0.04),   // 非金属反射率 Range(0,1)
        float3(1.0, 1.0, 1.0),   //金属反射率 Range(0, 1)
    },
    // 第 2 行
    {
        2,  // 阴影梯度索引
        0,  // 阴影位置 Range(-1, 1)
        0.1,  // 阴影软度 Range(0, 1)

        0.5,  // 粗糙度
        0,  // 金属度
        2.5,  // 高光强度 Range(0, 10)
        -0.04,  // 高光阈值 Range(-1, 1)
        0.1,  // 高光软度 Range(0, 1)
        float3(0.04, 0.04, 0.04),   // 非金属反射率 Range(0,1)
        float3(1.0, 1.0, 1.0),   //金属反射率 Range(0, 1)
    },
    // 第 3 行
    {
        7,  // 阴影梯度索引
        0,  // 阴影位置 Range(-1, 1)
        0.1,  // 阴影软度 Range(0, 1)

        0.5,  // 粗糙度
        0,  // 金属度
        2.5,  // 高光强度 Range(0, 10)
        -0.04,  // 高光阈值 Range(-1, 1)
        0.1,  // 高光软度 Range(0, 1)
        float3(0.04, 0.04, 0.04),   // 非金属反射率 Range(0,1)
        float3(1.0, 1.0, 1.0),   //金属反射率 Range(0, 1)
    },
    // 第 4 行
    {
        4,  // 阴影梯度索引
        0,  // 阴影位置 Range(-1, 1)
        0.1,  // 阴影软度 Range(0, 1)

        0.5,  // 粗糙度
        1,  // 金属度
        2.5,  // 高光强度 Range(0, 10)
        -0.04,  // 高光阈值 Range(-1, 1)
        0.1,  // 高光软度 Range(0, 1)
        float3(0.04, 0.04, 0.04),   // 非金属反射率 Range(0,1)
        float3(1.0, 1.0, 1.0),   //金属反射率 Range(0, 1)
    },
    // 第 5 行
    {
        1,  // 阴影梯度索引
        0,  // 阴影位置 Range(-1, 1)
        0.1,  // 阴影软度 Range(0, 1)

        0.5,  // 粗糙度
        0,  // 金属度
        2.5,  // 高光强度 Range(0, 10)
        -0.04,  // 高光阈值 Range(-1, 1)
        0.1,  // 高光软度 Range(0, 1)
        float3(0.04, 0.04, 0.04),   // 非金属反射率 Range(0,1)
        float3(1.0, 1.0, 1.0),   //金属反射率 Range(0, 1)
    },
    // 第 6 行
    {
        6,  // 阴影梯度索引
        0,  // 阴影位置 Range(-1, 1)
        0.1,  // 阴影软度 Range(0, 1)

        0.5,  // 粗糙度
        0,  // 金属度
        2.5,  // 高光强度 Range(0, 10)
        -0.04,  // 高光阈值 Range(-1, 1)
        0.1,  // 高光软度 Range(0, 1)
        float3(0.04, 0.04, 0.04),   // 非金属反射率 Range(0,1)
        float3(1.0, 1.0, 1.0),   //金属反射率 Range(0, 1)
    },
    // 第 7 行
    {
        3,  // 阴影梯度索引
        0,  // 阴影位置 Range(-1, 1)
        0.25,  // 阴影软度 Range(0, 1)

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