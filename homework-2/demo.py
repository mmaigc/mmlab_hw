import json

from mmpretrain.apis import ImageClassificationInferencer
import os

test_root = 'test_pictures'+os.sep
test_pictures = [test_root+filename for filename in os.listdir(test_root)]

inference = ImageClassificationInferencer("resnet50_fruit30.py", pretrained="exp2/best_accuracy_top1_epoch_96.pth")

results = inference(test_pictures)

for result in results:
    result.pop("pred_scores")
    print(result)
