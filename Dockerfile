FROM python:3.8
WORKDIR /usr/src/app
COPY requirements.txt .
RUN apt-get update && apt-get install make

# RUN /usr/local/bin/python -m pip install --upgrade pip
#RUN apk --no-cache add musl-dev linux-headers g++
RUN apt install -y libeigen3-dev libboost-all-dev

RUN pip install  -U -r requirements.txt
RUN pip3 install torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cu116

RUN git clone https://github.com/Discngine/fpocket.git
WORKDIR fpocket/
RUN make 
RUN make install
WORKDIR /usr/src/app
