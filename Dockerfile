# always base every smart docker container on worker_base.
#It contains all the logic for communicating the results
FROM axenu/app-worker-base:debian

RUN \
        apt-get update && \
        apt-get clean && \
        apt-get install -f && \
        DEBIAN_FRONTEND=noninteractive \
                apt-get install -y -f --force-yes \
		python3 \
                python3-uno unoconv \
                ruby-full make libxml2 libxml2-dev libxslt-dev zlib1g-dev
