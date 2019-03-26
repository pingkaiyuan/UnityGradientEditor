Shader "Custom/Gradient"
{
	Properties
	{

	}
	SubShader
	{
		Tags { "RenderType"="Transparent""Queue"="Transparent" }
		LOD 100
		Blend SrcAlpha OneMinusSrcAlpha
		Pass
		{
			CGPROGRAM

			#pragma vertex vert
			#pragma fragment frag
			#pragma shader_feature HORIZONTAL VERTICAL

			#include "UnityCG.cginc"

			struct appdata
			{
				float4 vertex : POSITION;
				float2 uv : TEXCOORD0;
			};

			struct v2f
			{
				float2 uv : TEXCOORD0;
				float4 vertex : SV_POSITION;
			};

			uniform int _ColorKeyLength;
			//Unity Bulid-in Grandient Tool just supports 8 color keys
			uniform float4 _ColorKey[8];
			uniform int _AlphaKeyLength;
			//Unity Bulid-in Grandient Tool just supports 8 alpha keys
			uniform float4 _AlphaKey[8];

			v2f vert (appdata v)
			{
				v2f o;
				o.vertex = UnityObjectToClipPos(v.vertex);
				o.uv = v.uv;
				return o;
			}
			
			fixed4 frag (v2f i) : SV_Target
			{

				fixed4 col;

				//Horizontal Mode
				#if HORIZONTAL
				float UV = i.uv.x;
				#endif

				//Vertical Mode
				#if VERTICAL
				float UV = i.uv.y;
				#endif

				//check the interval which contains uv of this frag
				for(int n = 0; n<_ColorKeyLength;n++){
					if(UV<=_ColorKey[n].w){
						break;
					}
				}
				//calculate the mix value by the proportion
				float mixvalue = (UV-_ColorKey[max(n-1,0)].w)/(_ColorKey[n].w-_ColorKey[n-1].w);
				//mix the color
				col.xyz = _ColorKey[max(n-1,0)].xyz*(1-mixvalue)+_ColorKey[n].xyz*mixvalue;

				//check the interval which contains uv of this frag
				for(int a = 0; a<_AlphaKeyLength;a++){
					if(UV<=_AlphaKey[a].w){
						break;
					}
				}
				//calculate the mix value by the proportion
				float mixvalue2 = (UV-_AlphaKey[max(a-1,0)].w)/(_AlphaKey[a].w-_AlphaKey[max(a-1,0)].w);
				//mix the alpha
				col.w = _AlphaKey[max(a-1,0)].x*(1-mixvalue2)+_AlphaKey[a].x*mixvalue2;

				return col;
			}
			ENDCG
		}
	}
	CustomEditor "GradientShaderGUI"
}
