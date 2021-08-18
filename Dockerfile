FROM bvlc/caffe:cpu

# you can add your model name to use it later as ${MODEL_NAME}
ENV MODEL_NAME dilation8_pascal_voc
ENV PROTOTXT_NAME dilation8_pascal_voc_deploy

RUN pip install tensorflow

CMD rm -rf caffe-tensorflow && ls && git clone https://github.com/ivanzhovannik/caffe-tensorflow && \
# change next two lines with your links to .caffemodel & .prototxt, do not change after `${`
    wget http://dl.yf.io/dilation/models/${MODEL_NAME}.caffemodel -P /workspace/caffe-tensorflow && \
    wget https://raw.githubusercontent.com/fyu/dilation/master/models/${PROTOTXT_NAME}.prototxt -P /workspace/caffe-tensorflow && \
    cd caffe-tensorflow && \
    ./convert.py  \
    --caffemodel "/workspace/caffe-tensorflow/${MODEL_NAME}.caffemodel" \
    --data-output-path "/workspace/${MODEL_NAME}.npy" \
    --code-output-path "/workspace/${MODEL_NAME}.py" \
    "/workspace/caffe-tensorflow/${PROTOTXT_NAME}.prototxt" && \
    ls /workspace && \
	echo "Press Enter: " && \
	read nothing_variable