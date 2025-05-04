# GI Tract Segmentation – Workshop Project (TAU)

Note: This guide specifically covers the training procedures for the segmentation component. All other pipeline components, including ROI detection, preprocessing, and classification training, have already been completed and are fully prepared and ready to use.

### Training
**All scripts are run from the `seg_models` directory.**

so first do: `cd seg_models`

---
#### Setup
Make sure to install all requierments:

```python
pip install -r requirements.txt
```

Download the pretrained classification weights:

```bash
sh download_cls_models.sh
```

---

#### Train segmentation models:

```bash
sh run_seg_models.sh
```

---

#### Apply Stochastic Weight Averaging (SWA)

```bash
sh run_seg_swa.sh
```

---

#### Fine-Tune

```bash
sh run_seg_models_finetune.sh
sh run_seg_swa_finetune.sh
```

---
### Upload Segmentation Models Weights to Kaggle

1. **Set up the Kaggle API on your machine**
   Follow this guide to authenticate the Kaggle API
   [here](https://www.kaggle.com/docs/api)

2. **Run the upload script**
   From the `model_snap` directory, run:

   ```bash
   cd model_snap
   ./upload_to_kaggle.sh <your-kaggle-username>
   ```

3. Copy the kaggle notebook and replace the existing hausdorf weights with yours:
   https://www.kaggle.com/code/talhakim/segmentation-demo/notebook
---

### Demo

run this kaggle notebook:

https://www.kaggle.com/code/talhakim/segmentation-demo/notebook


