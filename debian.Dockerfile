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

# the url where unoconv can be found
# ENV UNO_URL https://raw.githubusercontent.com/dagwieers/unoconv/master/unoconv

# # install some packages from apk
# RUN apk update
# RUN apk --no-cache add icu-libs \
#             icu-dev \
#             bash \
#             mc \
#             curl \
#             util-linux \
#             libreoffice-common \
#             libreoffice-writer \
#             ttf-droid-nonlatin \
#             ttf-droid \
#             ttf-dejavu \
#             ttf-freefont \
#             ttf-liberation
# RUN pip install unotools

# #download unoconv from the url previously defined
# RUN curl -Ls $UNO_URL -o /usr/local/bin/unoconv \
#         && chmod +x /usr/local/bin/unoconv \
#         && apk del curl \
#         && rm -rf /var/cache/apk/*

# # update the font list
# WORKDIR /usr/share/fonts
# COPY ./fonts_from_win10_180824.tar .
# RUN tar xvf fonts_from_win10_180824.tar
# RUN rm fonts_from_win10_180824.tar
# RUN ls
# RUN fc-cache -f -v

# ADD ./19970527-3663.pdf /