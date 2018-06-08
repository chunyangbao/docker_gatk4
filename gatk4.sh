#!/bin/bash


mkdir -p ~/pkg/gatk4/
# Dockerfile
c=f4225b89a482d4e0b5a4f6542b1a59c392587516
sc=${c:0:7}
wget https://raw.githubusercontent.com/broadinstitute/gatk/${c}/Dockerfile -O ~/pkg/gatk4/Dockerfile_gatk4_${sc} 1> ~/pkg/gatk4/Dockerfile_gatk4_${sc}.stdout.log 2> ~/pkg/gatk4/Dockerfile_gatk4_${sc}.stderr.log
cat ~/pkg/gatk4/Dockerfile_gatk4_${sc} | \
 sed "s#ADD . /gatk#RUN git clone https://github.com/broadinstitute/gatk.git /gatk \&\& cd /gatk \&\& git checkout "${c}"\n#" | \
 sed 's#RUN cp -r install_R_packages.R /gatk#RUN Rscript /gatk/scripts/docker/gatkbase/install_R_packages.R#' > ~/pkg/gatk4/Dockerfile_gatk4_${sc}_cbao
cp ~/pkg/gatk4/Dockerfile_gatk4_${sc}_cbao ~/pkg/gatk4/Dockerfile_gatk4_latest_cbao
# Docker
#docker build -t cbao/gatk4:${sc} -t cbao/gatk4:latest - < /Users/basslabimac/Documents/cbao/gatk4/Dockerfile_gatk4_latest_cbao 1> /Users/basslabimac/Documents/cbao/gatk4/Dockerfile_gatk4_latest_cbao.stdout.log 2> /Users/basslabimac/Documents/cbao/gatk4/Dockerfile_gatk4_latest_cbao.stderr.log
#docker push cbao/gatk4:${sc}
#docker push cbao/gatk4:latest

#docker pull broadinstitute/gatk:4.0.1.2
#docker run -v ~/Documents/cbao:/tmp -it --rm broadinstitute/gatk:4.0.1.2





