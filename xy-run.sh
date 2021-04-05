# on Host

#python=python2.7
# use python3.6
python=python3.6

#apt install -y python python-pip
	#apt install -y $python python-pip libgl1-mesa-glx --fix-missing
	apt install -y wget python3.6 python3-pip libgl1-mesa-glx --fix-missing

	$python -m pip install --upgrade pip
	$python -m pip install -r requirements.txt
	$python -m pip install scipy numpy jupyter ipython easydict opencv-contrib-python==4.0.0.21 Cython h5py lmdb mahotas pandas requests bs4 matplotlib lxml -i https://pypi.tuna.tsinghua.edu.cn/simple/
	$python -m pip install -U pillow -i https://pypi.tuna.tsinghua.edu.cn/simple/ pip install web.py==0.40.dev0 redis pip install keras==2.1.5 tensorflow==1.8
	$python -m pip install torch==1.8.1 torchvision -f https://download.pytorch.org/whl/torch_stable.html
	$python -m pip install opencv-python libxext6 libxrender-dev

# install darket
	git clone https://github.com/pjreddie/darknet.git
	apt install -y build-essential --fix-missing


# Error: add the following line in config.py
	# -*- coding: utf-8 -*-

# Error: str' object has no attribute 'decode'
# https://github.com/chineseocr/chineseocr/issues/518
	python3.6 -m pip install h5py==2.10.0

	$python tools/keras_to_darknet.py -cfg_path models/text.cfg -weights_path models/text.h5 -output_path models/text.weights
	# Saved Keras model to models/text.h5
	python tools/darknet_to_keras.py -cfg_path models/text.cfg -weights_path models/text.weights -output_path models/text.h5


# run
	python3.6 app.py 8080


# Google chrome Failed in docker container
# chrome
	wget http://www.linuxidc.com/files/repo/google-chrome.list -P /etc/apt/sources.list.d/
	wget -q -O - https://dl.google.com/linux/linux_signing_key.pub  | apt-key add -
	apt-get update
	apt-get install -y google-chrome-stable

	# ERROR:browser_dm_token_storage_linux.cc(94)] Error: /etc/machine-id contains 0 characters (32 were expected).
	# http://www.site-digger.com/html/weibo/2019/0321/725.html
	cp /var/lib/dbus/machine-id /etc/machine-id
