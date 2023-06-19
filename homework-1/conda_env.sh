conda create -n mmlab python=3.9

conda activate mmlab

pip install install torch==1.10.1+cu113 torchvision==0.11.2+cu113 torchaudio==0.10.1+cu113 -f https://download.pytorch.org/whl/cu113/torch_stable.html

pip install -i https://pypi.tuna.tsinghua.edu.cn/simple -U openmim

mim install -i https://pypi.tuna.tsinghua.edu.cn/simple mmcv-full

mim install -i https://pypi.tuna.tsinghua.edu.cn/simple mmengine

mim install -i https://pypi.tuna.tsinghua.edu.cn/simple "mmcv==2.0.0rc3"

mim install -i https://pypi.tuna.tsinghua.edu.cn/simple "mmdet>=3.0.0rc6"

pip install opencv-python pillow matplotlib seaborn tqdm pycocotools -i https://pypi.tuna.tsinghua.edu.cn/simple

git clone https://github.com/open-mmlab/mmdetection.git -b 3.x

cd mmdetection

pip install -v -e .

python check_env.py

cd ..

git clone https://github.com/open-mmlab/mmpose.git -b tutorial2023

cd mmpose

mim install -e .

python check_env.py

# train mmpose

pip install albumentations -i https://pypi.tuna.tsinghua.edu.cn/simple
