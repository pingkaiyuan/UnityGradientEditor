using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEditor;


public class GradientShaderGUI : ShaderGUI {
    public enum Options {
        Horizontal = 0,
        Vertical = 1
    }
    public Options op;
    public override void OnGUI(MaterialEditor materialEditor, MaterialProperty[] properties)
    {
        Material targetMat = (Material)materialEditor.target;
        EditorGUI.BeginChangeCheck();
        op = (Options)EditorGUILayout.EnumPopup("Gradient Mode", op);//get gradient mode value
        if (EditorGUI.EndChangeCheck()) {
            if (op == 0)
            {
                //enable Horizontal Mode
                targetMat.EnableKeyword("HORIZONTAL");
                targetMat.DisableKeyword("VERTICAL");
            }
            else {
                //enable Vertical Mode
                targetMat.EnableKeyword("VERTICAL");
                targetMat.DisableKeyword("HORIZONTAL");
            }
        }
        base.OnGUI(materialEditor, properties);
        
    }
}
