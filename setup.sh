git config --global user.email 'sevenquarkoniums@gmail.com'
git config --global user.name 'sevenquarkoniums'
git config --global credential.helper cache
git config --global credential.helper 'cache --timeout=86400'
git clone https://github.com/sevenquarkoniums/testProject.git
cp testProject/.vimrc ~/.vimrc
git clone https://github.com/sevenquarkoniums/interpretability.git
cd interpretability

wget http://files.fast.ai/data/imagenet-sample-train.tar.gz
tar xzf imagenet-sample-train.tar.gz
rm -f imagenet-sample-train.tar.gz
mkdir data
mv train data/all
mkdir data/train
mkdir data/val
chmod +x moveData.py
chmod +x imagenet.py
./moveData.py

./imagenet.py -a alexnet -j 16 --epochs 1000 data
./imagenet.py -a alexnet -j 16 --start-epoch 90 --epochs 1000 --resume checkpoint.pth.tar data
./imagenet.py -a resnet18 -j 16 --epochs 1000 data

# to delete
gcloud deployment-manager deployments delete imagenet
