FROM ubuntu:18.04

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      ca-certificates \
      curl \
      build-essential

# Install julia
RUN curl -L https://julialang-s3.julialang.org/bin/linux/x64/1.5/julia-1.5.3-linux-x86_64.tar.gz > /tmp/julia.tar.gz
RUN tar -zxvf /tmp/julia.tar.gz
RUN ln -s /julia-1.5.3/bin/julia /usr/bin/julia

RUN export USE_BLAS64=true && julia -e 'using Pkg; Pkg.add("MKL")'

CMD ["/usr/bin/julia"]
