FROM julia:1.1.0
  RUN apt-get update 
  RUN apt-get install -y zlib1g-dev 
  RUN julia -e 'using Pkg; Pkg.add("Circuitscape")'
CMD julia