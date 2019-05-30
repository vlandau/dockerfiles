FROM ubuntu:18.04

ENV CPLUS_INCLUDE_PATH=/usr/include/gdal
ENV C_INCLUDE_PATH=/usr/include/gdal

# Install python, pip, gdal and jupyter
RUN apt-get update && \
	apt-get install -y --no-install-recommends \
	 wget ca-certificates \
	 python3 python3-pip \
	 python3-dev \
	 libgdal-dev \
	 gdal-bin \
	 python3-gdal && \
	pip3 install setuptools wheel

RUN apt-get install -y build-essential gcc

RUN pip3 install jupyter

RUN mkdir home/tmp

# Install the python gdal api
RUN pip3 install GDAL==2.1.3 --global-option=build_ext \
	--global-option="-I/usr/include/gdal"

# Install Julia 
RUN wget https://julialang-s3.julialang.org/bin/linux/x64/1.1/julia-1.1.0-linux-x86_64.tar.gz -O /home/tmp/julia.tar.gz

RUN tar -zxvf home/tmp/julia.tar.gz
RUN rm -rf home/tmp
RUN ln -s /julia-1.1.0/bin/julia /usr/bin/julia

# Add julia kernel for jupyter
RUN julia -e 'using Pkg; Pkg.add(["IJulia"])'

EXPOSE 8888

CMD cd home && jupyter notebook --port=8888 --ip=0.0.0.0 --allow-root