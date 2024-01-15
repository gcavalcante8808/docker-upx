FROM alpine:3.19 as builder
ARG UPX_VERSION=v4.2.2
WORKDIR /usr/src
RUN apk add --no-cache git ca-certificates gcc g++ make cmake
RUN git clone --branch ${UPX_VERSION} https://github.com/upx/upx.git && \
    cd upx && \
    git submodule update --init
WORKDIR /usr/src/upx
RUN sed -i '/print summary/a set(BUILD_SHARED_LIBS OFF)\nset(CMAKE_EXE_LINKER_FLAGS "-static")' CMakeLists.txt
RUN make

FROM scratch as final
COPY --from=builder /usr/src/upx/build/release/upx /usr/local/bin/upx
RUN ["/usr/local/bin/upx", "--version"]
ENTRYPOINT ["/usr/local/bin/upx"]
