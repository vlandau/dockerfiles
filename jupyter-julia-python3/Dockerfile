FROM ubuntu:18.04

# Install python, pip, and jupyter
RUN apt-get update && \
	apt-get install -y --no-install-recommends \
	 wget ca-certificates \
	 python3 python3-pip && \
	pip3 install setuptools wheel

RUN pip3 install jupyter

RUN mkdir home/tmp

# Install Julia 
RUN wget https://julialang-s3.julialang.org/bin/linux/x64/1.1/julia-1.1.0-linux-x86_64.tar.gz -O /home/tmp/julia.tar.gz

RUN tar -zxvf home/tmp/julia.tar.gz
RUN rm -rf home/tmp
RUN ln -s /julia-1.1.0/bin/julia /usr/bin/julia

# Add julia kernel for jupyter
RUN julia -e 'using Pkg; Pkg.add(["IJulia"])'

EXPOSE 8888

CMD cd home && jupyter notebook --port=8888 --ip=0.0.0.0 --allow-root