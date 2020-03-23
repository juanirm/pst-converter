FROM pitkley/libpst 

WORKDIR /mnt

COPY convert.sh .
RUN chmod +x convert.sh

CMD ["convert.sh"]