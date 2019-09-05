git config --global user.email 'sevenquarkoniums@gmail.com'
git config --global user.name 'sevenquarkoniums'
git config --global credential.helper cache
git config --global credential.helper 'cache --timeout=86400'
git clone https://github.com/sevenquarkoniums/testProject.git
cp testProject/.vimrc ~/.vimrc
git clone https://github.com/sevenquarkoniums/interpretability.git
cd interpretability
wget http://files.fast.ai/data/imagenet-sample-train.tar.gz
