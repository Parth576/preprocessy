FROM python:3.8

WORKDIR /usr/src/app

COPY . .
RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements_dev.txt
RUN pip install --no-cache-dir jupyter
RUN printf "alias dpp='nohup jupyter notebook --port=8000 --no-browser --ip=0.0.0.0 --allow-root &> /usr/src/app/notebook.log &'\n" >> $HOME/.bashrc
RUN printf "alias dpp-url='sed '6!d' /usr/src/app/notebook.log'" >> $HOME/.bashrc

ENTRYPOINT ["/bin/bash"]
