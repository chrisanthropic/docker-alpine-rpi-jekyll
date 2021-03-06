FROM ctarwater/armhf-alpine-rpi-java8
MAINTAINER chrisanthropic <ctarwater@gmail.com>
# Thanks to Irakli Nadareishvili @inadarei / https://github.com/inadarei/alpine-jekyll

# docker build -t ctarwater/armhf-alpine-rpi-jekyll .
# docker run --rm -v $(pwd):/tmp/jekyll -w "/tmp/jekyll" -it -p 4000:4000 ctarwater/armhf-alpine-rpi-jekyll
# docker run -d $(pwd):/tmp/jekyll -p 4000:4000 ctarwater/armhf-alpine-rpi-jekyll serve --config _config.yml,_jenkins.yml --baseurl ''


RUN apk upgrade --update \
 && apk add bash build-base imagemagick libjpeg-turbo-utils pngcrush file libffi libatomic readline readline-dev libxml2 libxml2-dev \
        ncurses-terminfo-base ncurses-terminfo \
        libxslt libxslt-dev zlib-dev zlib \
        ruby ruby-dev yaml yaml-dev \
        libffi-dev build-base git nodejs \
        ruby-io-console ruby-irb ruby-json ruby-rake \
 && gem install --no-document bundler redcarpet kramdown maruku rdiscount RedCloth liquid pygments.rb \
 && gem install --no-document sass safe_yaml \        
 && gem install --no-document jekyll -v 2.5 \
 && gem install --no-document jekyll-paginate jekyll-sass-converter \
 && gem install --no-document jekyll-sitemap jekyll-feed jekyll-redirect-from \
 && rm -rf /root/src /tmp/* /usr/share/man /var/cache/apk/* \
 && apk search --update

ADD run.sh /root/ 
RUN chmod +x /root/run.sh
 
EXPOSE 4000
 
WORKDIR /tmp/jekyll

ENTRYPOINT ["/root/run.sh"]
CMD [""]
