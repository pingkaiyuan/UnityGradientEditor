# UnityGradientEditor 1.0

可适用于Unity材质的渐变编辑器

通过简单地添加与修改颜色与透明度节点即可在Unity实时得到高自由化的渐变效果

## 使用说明

clone下Unity工程文件或单独下载根目录下GradientEditor.unitypackage导入现有工程。

确保GradientEditorGUI.cs文件位于Editor文件夹下。

对渐变对象添加GradientEditor.cs和材质，将GradientObject设置为渐变对象，材质着色器选择Custom/Gradient。

GradientEditor组件界面及功能如下图：

![上传示例图失效](http://ar-scene-source.nosdn.127.net/9c559a42-3a1c-438b-a9f4-c2d615312924.png)

点击渐变条可使用渐变编辑器编辑渐变模式。

![上传示例图失效](http://ar-scene-source.nosdn.127.net/7821debe-d167-4254-a5ff-48d76c4230e5.png )

![上传示例图失效](http://ar-scene-source.nosdn.127.net/2fccc547-c39e-4469-9665-2f8f9fd06213.png )

![上传示例图失效](http://ar-scene-source.nosdn.127.net/e5da9c15-80d3-444e-9807-fcb08b923668.png )

点击渐变模式可以更改渐变方向（目前两种方式分别为Horizontal——沿UV.u方向渐变和Vertical——沿UV.v方向渐变）。

![上传示例图失效](http://ar-scene-source.nosdn.127.net/66a11b48-1b06-46c8-899f-ef03f410a3e9.png)
