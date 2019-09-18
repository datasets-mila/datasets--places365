import torchvision

torchvision.datasets.Places365(".", split="train-standard", small=True, download=True)
torchvision.datasets.Places365(".", split="val", small=True, download=True)
