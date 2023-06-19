### 通过如下三个课程，分别学习了mmdetection，mmpose的环境安装，训练，评估与推理

1.  [安装MMDetection和MMPose](https://www.bilibili.com/video/BV1Pa4y1g7N7)
2.  [MMDetection三角板目标检测](https://www.bilibili.com/video/BV1Lm4y1879K)
3.  [MMPose、RTMPose三角板关键点检测](https://www.bilibili.com/video/BV12a4y1u7sd)

### 建立了ubuntu linux环境安装脚本 conda\_install.sh：

```
conda create -n mmlab python=3.9conda activate mmlabpip install install torch==1.10.1+cu113 torchvision==0.11.2+cu113 torchaudio==0.10.1+cu113 -f https://download.pytorch.org/whl/cu113/torch_stable.htmlpip install -i https://pypi.tuna.tsinghua.edu.cn/simple -U openmimmim install -i https://pypi.tuna.tsinghua.edu.cn/simple mmcv-fullmim install -i https://pypi.tuna.tsinghua.edu.cn/simple mmenginemim install -i https://pypi.tuna.tsinghua.edu.cn/simple "mmcv==2.0.0rc3"mim install -i https://pypi.tuna.tsinghua.edu.cn/simple "mmdet>=3.0.0rc6"pip install opencv-python pillow matplotlib seaborn tqdm pycocotools -i https://pypi.tuna.tsinghua.edu.cn/simplegit clone https://github.com/open-mmlab/mmdetection.git -b 3.xcd mmdetectionpip install -v -e .python check_env.pycd ..git clone https://github.com/open-mmlab/mmpose.git -b tutorial2023cd mmposemim install -e .python check_env.pypip install albumentations -i https://pypi.tuna.tsinghua.edu.cn/simple
```

检测环境 check\_env.py  

![img](https://img-community.csdnimg.cn/images/eb73e09c579d407d833706f8d40195be.png)

![img](https://img-community.csdnimg.cn/images/c3274fe7177c422a898189b57911e2a2.png)

### 下载ear的配置文件与数据（已经标注）并训练

```
python tools/train.py ../data/rtmdet_tiny_ear.py
```

![img](https://img-community.csdnimg.cn/images/646de0cda05f43f18f7f5d103bc2352e.png)

```
python tools/test.py ../data/rtmdet_tiny_ear.py work_dirs/rtmdet_tiny_ear/epoch_110.pth
```

![img](https://img-community.csdnimg.cn/images/b61015d3f2794dcd9996ee9344699ae7.png)

```
python tools/train.py ../data/rtmpose-s-ear.py
```

![img](https://img-community.csdnimg.cn/images/e9baa1507d50461a8dcb879f413d755d.png)

模型转换并测试图片

```
python tools/model_converters/publish_model.py work_dirs/rtmdet_tiny_ear/epoch_110.pth checkpoint/rtmdet_tiny_ear_110.pthpython tools/misc/publish_model.py work_dirs/rtmpose-s-ear/epoch_300.pth checkpoint/rtmpose-s-ear-300.pth
```

```
python demo/topdown_demo_with_mmdet.py \        ../data/rtmdet_tiny_ear.py \        ../mmdetection/checkpoint/rtmdet_tiny_ear_110-dc76ceac.pth \        ../data/rtmpose-s-ear.py \checkpoint/rtmpose-s-ear-300-22690e19_20230606.pth\
```

![img](https://img-community.csdnimg.cn/images/16a01e65d6f647d1a54880c1cf5918f8.jpg)