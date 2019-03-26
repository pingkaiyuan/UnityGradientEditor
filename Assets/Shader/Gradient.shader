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
			uniform float4 _ColorKey[8];
			uniform int _AlphaKeyLength;
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

////----------------------------------Horizontal Mode--------------------------------------

				#if HORIZONTAL
				
				int n0 = step(_ColorKey[0].w,i.uv.x);
				int n1 = step(_ColorKey[1].w,i.uv.x);
				int n2 = step(_ColorKey[2].w,i.uv.x);
				int n3 = step(_ColorKey[3].w,i.uv.x);
				int n4 = step(_ColorKey[4].w,i.uv.x);
				int n5 = step(_ColorKey[5].w,i.uv.x);
				int n6 = step(_ColorKey[6].w,i.uv.x);
				int n7 = step(_ColorKey[7].w,i.uv.x);
				int totaln = n0+n1+n2+n3+n4+n5+n6+n7-8+_ColorKeyLength;//check the position of frag uv to decide the colorkeys
				int totalnminus1 =totaln-1;
				float mixvalue = (i.uv.x-_ColorKey[totalnminus1].w)/(_ColorKey[totaln].w-_ColorKey[totalnminus1].w);

				col.x = _ColorKey[totalnminus1].x*(1-mixvalue)+_ColorKey[totaln].x*mixvalue;
				col.y = _ColorKey[totalnminus1].y*(1-mixvalue)+_ColorKey[totaln].y*mixvalue;
				col.z = _ColorKey[totalnminus1].z*(1-mixvalue)+_ColorKey[totaln].z*mixvalue;
				
				int a0 = step(_AlphaKey[0].w,i.uv.x);
				int a1 = step(_AlphaKey[1].w,i.uv.x);
				int a2 = step(_AlphaKey[2].w,i.uv.x);
				int a3 = step(_AlphaKey[3].w,i.uv.x);
				int a4 = step(_AlphaKey[4].w,i.uv.x);
				int a5 = step(_AlphaKey[5].w,i.uv.x);
				int a6 = step(_AlphaKey[6].w,i.uv.x);
				int a7 = step(_AlphaKey[7].w,i.uv.x);
				int totala = a0+a1+a2+a3+a4+a5+a6+a7-8+_AlphaKeyLength;//check the position of frag uv to decide the alphakeys
				int totalaminus1 =totala-1;
				float mixvalue2 = (i.uv.x-_AlphaKey[totalaminus1].w)/(_AlphaKey[totala].w-_AlphaKey[totalaminus1].w);

				col.w=_AlphaKey[totalaminus1].x*(1-mixvalue2)+_AlphaKey[totala].x*mixvalue2;

				#endif

////------------------------------------Vertical Mode---------------------------------------------------

				#if VERTICAL
				
				int n0 = step(_ColorKey[0].w,i.uv.y);
				int n1 = step(_ColorKey[1].w,i.uv.y);
				int n2 = step(_ColorKey[2].w,i.uv.y);
				int n3 = step(_ColorKey[3].w,i.uv.y);
				int n4 = step(_ColorKey[4].w,i.uv.y);
				int n5 = step(_ColorKey[5].w,i.uv.y);
				int n6 = step(_ColorKey[6].w,i.uv.y);
				int n7 = step(_ColorKey[7].w,i.uv.y);
				int totaln = n0+n1+n2+n3+n4+n5+n6+n7-8+_ColorKeyLength;//check the position of frag uv to decide the colorkeys
				int totalnminus1 =totaln-1;
				float mixvalue = (i.uv.y-_ColorKey[totaln-1].w)/(_ColorKey[totaln].w-_ColorKey[totaln-1].w);

				col.x = _ColorKey[totalnminus1].x*(1-mixvalue)+_ColorKey[totaln].x*mixvalue;
				col.y = _ColorKey[totalnminus1].y*(1-mixvalue)+_ColorKey[totaln].y*mixvalue;
				col.z = _ColorKey[totalnminus1].z*(1-mixvalue)+_ColorKey[totaln].z*mixvalue;
				
				int a0 = step(_AlphaKey[0].w,i.uv.y);
				int a1 = step(_AlphaKey[1].w,i.uv.y);
				int a2 = step(_AlphaKey[2].w,i.uv.y);
				int a3 = step(_AlphaKey[3].w,i.uv.y);
				int a4 = step(_AlphaKey[4].w,i.uv.y);
				int a5 = step(_AlphaKey[5].w,i.uv.y);
				int a6 = step(_AlphaKey[6].w,i.uv.y);
				int a7 = step(_AlphaKey[7].w,i.uv.y);
				int totala = a0+a1+a2+a3+a4+a5+a6+a7-8+_AlphaKeyLength;//check the position of frag uv to decide the alphakeys
				int totalaminus1 =totala-1;
				float mixvalue2 = (i.uv.y-_AlphaKey[totalaminus1].w)/(_AlphaKey[totala].w-_AlphaKey[totalaminus1].w);

				col.w=_AlphaKey[totalaminus1].x*(1-mixvalue2)+_AlphaKey[totala].x*mixvalue2;

				#endif
//-----------------------------------------Founction END----------------------------------------------------------------------------
				return col;
			}
			ENDCG
		}
	}
	CustomEditor "GradientShaderGUI"
}
