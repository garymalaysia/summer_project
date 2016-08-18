FROM lballabio/boost
MAINTAINER Luigi Ballabio <luigi.ballabio@gmail.com>
LABEL Description="A development environment for building QuantLib and its SWIG bindings"

RUN apt-get update && apt-get install -y autoconf automake libtool ccache \
                                         libpcre3-dev python-dev \
                                         ipython-notebook python-matplotlib python-pandas

RUN mv /usr/lib/ccache/* /usr/local/bin

#ENV swig_version=3.0.10

#RUN wget http://downloads.sourceforge.net/project/swig/swig/swig-${swig_version}/swig-${swig_version}.tar.gz \
#   && tar xfz swig-${swig_version}.tar.gz \
#    && rm swig-${swig_version}.tar.gz \
#    && cd swig-${swig_version} \
#    && ./configure --prefix=/usr \
#    && make -j 4 && make install \
#    && cd .. && rm -rf swig-${swig_version}




CMD bash

RUN apt-get update
#RUN apt-get install python-pip -y
#RUN apt-get --yes --force-yes install libssl-dev  
#RUN apt-get --yes install libudev-dev 

#RUN apt-get --yes install python-pyscard
#RUN apt-get --yes install python3
#RUN pip install openpyxl

#RUN apt-get --yes install python-usb
#RUN apt-get --yes  install libccid 
#RUN apt-get --yes install pcscd
#RUN service pcscd start
#RUN apt-get --yes install libpcsclite1 
#RUN apt-get --yes install libpcsclite-dev 
RUN apt-get --yes install pcscd git python-setuptools swig gcc libpcsclite-dev python-dev
RUN git clone https://github.com/LudovicRousseau/pyscard.git \ 
&& cd pyscard \ 
&&  python setup.py build_ext install
COPY testing.xlsx /Users/garytsai/Desktop/rfid-reader-http/summer_project/testing.xlsx
COPY art.py /Users/garytsai/Desktop/rfid-reader-http/summer_project/art.py
COPY alert.py /Users/garytsai/Desktop/rfid-reader-http/summer_project/alert.py
COPY rsa.py /Users/garytsai/Desktop/rfid-reader-http/summer_project/rsa.py
COPY header.py /Users/garytsai/Desktop/rfid-reader-http/summer_project/header.py

COPY pythoncard.py /Users/garytsai/Desktop/rfid-reader-http/summer_project/pythoncard.py
CMD ["python","/Users/garytsai/Desktop/rfid-reader-http/summer_project/pythoncard.py"]


