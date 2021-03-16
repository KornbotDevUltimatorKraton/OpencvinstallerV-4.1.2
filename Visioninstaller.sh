echo "Installing dependencies"
sudo apt-get install build-essential cmake git unzip pkg-config -y 
sudo apt-get install libjpeg-dev libpng-dev libtiff-dev -y 
sudo apt-get install libavcodec-dev libavformat-dev libswscale-dev -y 
sudo apt-get install libgtk2.0-dev libcanberra-gtk* -y 
sudo apt-get install libxvidcore-dev libx264-dev libgtk-3-dev -y 
sudo apt-get install python3-dev python3-numpy -y 
sudo apt-get install python-dev python3-pip python-numpy -y 
sudo apt-get install libtbb2 libtbb-dev libdc1394-22-dev -y 
sudo apt-get install libv4l-dev v4l-utils -y 
sudo apt-get install libjasper-dev libopenblas-dev libatlas-base-dev libblas-dev -y 
sudo apt-get install liblapack-dev gfortran -y 
sudo apt-get install gcc-arm* -y 
sudo apt-get install protobuf-compiler -y 
echo "Download opencv"
cd ~
wget -O opencv.zip https://github.com/opencv/opencv/archive/4.1.2.zip
wget -O opencv_contrib.zip https://github.com/opencv/opencv_contrib/archive/4.1.2.zip
unzip opencv.zip
unzip opencv_contrib.zip

mv opencv-4.1.2 opencv
mv opencv_contrib-4.1.2 opencv_contrib
cd ~/opencv/
mkdir build
cd build
cmake -D CMAKE_BUILD_TYPE=RELEASE \
        -D CMAKE_INSTALL_PREFIX=/usr/local \
        -D OPENCV_EXTRA_MODULES_PATH=~/opencv_contrib/modules \
        -D ENABLE_NEON=ON \
        -D ENABLE_VFPV3=ON \
        -D WITH_OPENMP=ON \
        -D BUILD_TIFF=ON \
        -D WITH_FFMPEG=ON \
        -D WITH_TBB=ON \
        -D BUILD_TBB=ON \
        -D BUILD_TESTS=OFF \
        -D WITH_EIGEN=OFF \
        -D WITH_V4L=ON \
        -D WITH_LIBV4L=ON \
        -D WITH_VTK=OFF \
        -D OPENCV_EXTRA_EXE_LINKER_FLAGS=-latomic \
        -D OPENCV_ENABLE_NONFREE=ON \
        -D INSTALL_C_EXAMPLES=OFF \
        -D INSTALL_PYTHON_EXAMPLES=OFF \
        -D BUILD_NEW_PYTHON_SUPPORT=ON \
        -D BUILD_opencv_python3=TRUE \
        -D OPENCV_GENERATE_PKGCONFIG=ON \
        -D BUILD_EXAMPLES=OFF ..

sudo make -j8
sudo make install 
sudo ldconfig
sudo make clean
sudo apt-get update
