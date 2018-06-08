# Using OpenJDK 8
FROM broadinstitute/gatk:latest

RUN R -e "install.packages('reshape', repos = 'http://cran.us.r-project.org')"

WORKDIR /gatk

ENV PATH /gatk:$PATH