FROM ubuntu:20.04

# Install dependencies.
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    git \
    build-essential \
    cmake \
    qt5-default  \
    libglib2.0-0 \
    libqt5dbus5 \
    libqt5widgets5 \
    libqt5network5 \
    libqt5gui5 \
    libqt5core5a \
    libfontconfig1 \
    mesa-common-dev  \
    libglu1-mesa-dev \
    mesa-utils \
    x11-apps \
    libopencv-dev \
    && rm -rf /var/lib/apt/lists/*

RUN git clone --depth=1 -b chanege_to_qt5 https://github.com/Dansato1203/YLLabelMaker.git

WORKDIR /YLLabelMaker

RUN cmake .

RUN make -j8

CMD ["./LabelMaker"]
