
docker-nsm-tools
================

A collection of tools used by the nsm-pipelines

All tools are installed in /usr/local/bin/ and all jar files are placed in /usr/local/jars/

How to use the image
---------------------

Run a tool command in the container (samtools in this case):
```bash
docker run bruggerk/nms-tools:latest samtools
```

give nsm-tools  access to reference data in read-only mode, here as /references

```bash
docker run -v [PATH-TO-REFERENCE-DATA]:/references/:ro bruggerk/nsm-tools:latest samtools
```


However as the majority of the tools needs, and generates, data you will need to make a directory available through volumes:


```bash
# This will run docker mounting your current working directory in /run, and execute the program in /run
docker run -v [PATH-TO-REFERENCE-DATA]:/references/:ro -v`pwd`:/run/ -w /run bruggerk/nsm-tools:latest samtools

```


Tools/jars in container :
-------------------------

* samtools
* bcftools
* tabix
* bwa
* gatk
* verifyBamID


Jars in container :
-------------------------

* picard
