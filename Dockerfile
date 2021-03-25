#FROM alpine
FROM ubuntu:20.04

ENV TZ=Europe/Oslo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone


RUN apt-get update && apt-get install --no-install-recommends --assume-yes -qq curl libncurses5-dev build-essential zlib1g-dev libbz2-dev liblzma-dev unzip default-jre python-is-python3 r-base && apt-get clean

RUN mkdir -p  /usr/local/jars/ 

RUN curl -Lo /tmp/samtools.tgz.bz2 https://github.com/samtools/samtools/releases/download/1.12/samtools-1.12.tar.bz2 && \
      mkdir /tmp/samtools && \
      tar jxvf /tmp/samtools.tgz.bz2 --strip 1 -C /tmp/samtools && \
      cd /tmp/samtools && \
      ./configure --prefix=/usr/local/  && \
      make  && \
      make install  && \
      rm -rf /tmp/samtools*

RUN curl -Lo /tmp/bcftools.tgz.bz2 https://github.com/samtools/bcftools/releases/download/1.11/bcftools-1.11.tar.bz2 && \
      mkdir /tmp/bcftools && \
      tar jxvf /tmp/bcftools.tgz.bz2 --strip 1 -C /tmp/bcftools && \
      cd /tmp/bcftools && \
      ./configure --prefix=/usr/local/  && \
      make  && \
      make install  && \
      rm -rf /tmp/bcftools*

RUN curl -Lo /tmp/htslib.tgz.bz2 https://github.com/samtools/htslib/releases/download/1.11/htslib-1.11.tar.bz2 && \
      mkdir /tmp/htslib && \
      tar jxvf /tmp/htslib.tgz.bz2 --strip 1 -C /tmp/htslib && \
      cd /tmp/htslib && \
      ./configure --prefix=/usr/local/  && \
      make  && \
      make install  && \
      rm -rf /tmp/htslib*

RUN curl -Lo /tmp/bwa.tgz.bz2 https://downloads.sourceforge.net/project/bio-bwa/bwa-0.7.17.tar.bz2 && \
      mkdir /tmp/bwa && \
      tar jxvf /tmp/bwa.tgz.bz2 --strip 1 -C /tmp/bwa && \
      cd /tmp/bwa && \
      make  && \
      cp bwa /usr/local/bin/bwa  && \
      rm -rf /tmp/bwa*

RUN curl -Lo /tmp/gatk.zip https://github.com/broadinstitute/gatk/releases/download/4.2.0.0/gatk-4.2.0.0.zip && \
      mkdir /usr/local/gatk && \
      unzip -d /usr/local/gatk/ /tmp/gatk.zip && \
      mv /usr/local/gatk/*/* /usr/local/gatk/ && \
      ln -s /usr/local/gatk/gatk /usr/local/bin/gatk && \
      rm -f /tmp/gatk.zip


RUN curl -Lo  /tmp/star.tgz https://github.com/alexdobin/STAR/archive/2.7.8a.tar.gz && \
    mkdir /tmp/star && \
    tar zxvf /tmp/star.tgz --strip 1 -C /tmp/star && \
    cd /tmp/star/source && \
    make  && \
    cp STAR /usr/local/bin/  && \
    rm -rf /tmp/star*

RUN curl -Lo /usr/local/jars/picard.jar https://github.com/broadinstitute/picard/releases/download/2.25.0/picard.jar

RUN curl -Lo /usr/local/bin/verifyBamID https://github.com/statgen/verifyBamID/releases/download/v1.1.3/verifyBamID && \
    chmod 755 /usr/local/bin/verifyBamID
