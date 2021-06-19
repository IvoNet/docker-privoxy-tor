FROM ivonet/privoxy:3.0.32

RUN apk --update --no-cache --no-progress add tor

EXPOSE 8118 9050

COPY root/ /

ENV HOME /root
