FROM juno:julia-1.2

RUN apt-get update 
RUN apt-get install -y zlib1g-dev 
RUN julia -e 'using Pkg; Pkg.add("Circuitscape")'

ENV JULIA_NUM_THREADS=11