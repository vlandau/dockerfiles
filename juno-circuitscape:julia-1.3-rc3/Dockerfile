FROM vlandau/juno:julia-1.3-rc3

RUN apt-get update 
RUN apt-get install -y zlib1g-dev 
RUN julia -e 'using Pkg; Pkg.add("Circuitscape")'

ENV JULIA_NUM_THREADS=11