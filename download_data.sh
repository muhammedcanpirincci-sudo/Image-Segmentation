echo -n "Kaggle username: "
read USERNAME
echo ""
echo -n "Kaggle API key: "
read APIKEY

pip install kaggle --upgrade
mkdir -p ~/.kaggle
echo "{\"username\":\"$USERNAME\",\"key\":\"$APIKEY\"}" > ~/.kaggle/kaggle.json

kaggle competitions download -c carvana-image-masking-challenge -f train_hq.zip
unzip train_hq.zip
mv train_hq/* /content/data/imgs
rm -d train_hq
rm train_hq.zip

kaggle competitions download -c carvana-image-masking-challenge -f train_masks.zip
unzip train_masks.zip
mv train_masks/* /content/data/img_GT
rm -d train_masks
rm train_masks.zip