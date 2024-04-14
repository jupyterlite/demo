FROM debian:bookworm-slim

#RUN apt-get update -y && apt-get install -y texlive-xetex latexmk texlive-xetex \
#	texlive-fonts-extra fonts-freefont-otf python3 python3-pip git zile wget

RUN apt-get update -y && apt-get install -y python3 python3-pip texlive-xetex \
    latexmk git zile wget texlive-fonts-extra python3-venv

COPY requirements.txt /opt/

WORKDIR /opt/
RUN python3 -m venv venv
RUN . venv/bin/activate && pip install -r requirements.txt
RUN . venv/bin/activate && pip list
# activate venv
ENV PATH="/opt/venv/bin:$PATH"

RUN mkdir -p /io
WORKDIR /io

# Need this for one nbval and chapter 1
RUN ln -s /usr/bin/python3 /usr/local/bin/python

# supress warning when running jupyter-book in container
ENV PYDEVD_DISABLE_FILE_VALIDATION=1
CMD ["/bin/bash"]
