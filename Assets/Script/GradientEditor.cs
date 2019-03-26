using System.Collections;
using System.Collections.Generic;
using UnityEngine;
[ExecuteInEditMode]
public class GradientEditor : MonoBehaviour {
    public Gradient ga;
    public GameObject GradientObject;
    // Use this for initialization
    void Start () {
	}

    // Update is called once per frame
    void Update() {
        int ColorkeyLength = ga.colorKeys.Length;//get the amount of colorkeys
        var ColorKey = new Vector4[8];
        for (int i = 0; i < ColorkeyLength; i++) {
            ColorKey[i] = new Vector4(ga.colorKeys[i].color.r, ga.colorKeys[i].color.g, ga.colorKeys[i].color.b,ga.colorKeys[i].time);
        }//set colorkeys' data to vector array
        GradientObject.GetComponent<Renderer>().sharedMaterial.SetVectorArray("_ColorKey", ColorKey);
        GradientObject.GetComponent<Renderer>().sharedMaterial.SetInt("_ColorKeyLength", ColorkeyLength);

        int AlphakeyLength = ga.alphaKeys.Length;//get the amount of colorkeys
        var AlphaKey = new Vector4[8];
        for (int j = 0; j < AlphakeyLength; j++) {
            AlphaKey[j] = new Vector4(ga.alphaKeys[j].alpha, 0, 0, ga.alphaKeys[j].time);
        }//set alphakeys' data to vector array
        GradientObject.GetComponent<Renderer>().sharedMaterial.SetVectorArray("_AlphaKey", AlphaKey);
        GradientObject.GetComponent<Renderer>().sharedMaterial.SetInt("_AlphaKeyLength", AlphakeyLength);

    }
}
