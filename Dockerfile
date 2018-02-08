FROM bvlc/caffe:cpu

# you can add your model name to use it later as ${MODEL_NAME}
ENV MODEL_NAME NOI_All-Iter_850000

RUN pip install tensorflow

CMD git clone https://github.com/ethereon/caffe-tensorflow && \
# change next two lines with your links to .caffemodel & .prototxt
    wget https://raw.githubusercontent.com/Wenchao-Du/SCN-for-Image-Denoising/master/model/NOI_All-Iter_850000.caffemodel -P /workspace/caffe-tensorflow && \
    wget https://raw.githubusercontent.com/Wenchao-Du/SCN-for-Image-Denoising/master/model/Imploy.prototxt -P /workspace/caffe-tensorflow && \
    cd caffe-tensorflow && \
    ./convert.py  \
    --caffemodel "/workspace/caffe-tensorflow/${MODEL_NAME}.caffemodel" \
    --data-output-path "/workspace/${MODEL_NAME}.npy" \
    --code-output-path "/workspace/${MODEL_NAME}.py" \
# change "Imploy" to your .prototxt file name 
    "/workspace/caffe-tensorflow/Imploy.prototxt" && \
    ls /workspace 