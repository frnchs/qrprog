FROM python:3.12.0a1-buster
RUN apt-get update &&\
    /usr/local/bin/python3 -m pip install --upgrade pip &&\
    /usr/local/bin/python3 -m pip install --upgrade setuptools &&\
    adduser frnchs
ENV PATH="/home/myuser/.local/bin:${PATH}"
ENV QR_CODE_IMAGE_DIRECTORY='images'
ENV QR_CODE_DEFAULT_URL='https://www.njit.edu'
ENV QR_CODE_DEFAULT_FILE_NAME='default.png'
WORKDIR /home/frnchs
COPY --chown=frnchs:frnchs . .
RUN pip3 install -r requirements.txt
ENTRYPOINT ["runuser", "-u", "frnchs", "--", "python3"]
CMD ["main.py"]