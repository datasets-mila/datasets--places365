import torchvision

torchvision.datasets.Places365(".", split="train-standard", download=True)
torchvision.datasets.Places365(".", split="val", download=True)
