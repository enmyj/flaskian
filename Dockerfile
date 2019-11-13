FROM continuumio/miniconda3
SHELL ["/bin/bash", "-c"]

EXPOSE 8000

COPY environment.yml environment.yml
RUN /opt/conda/bin/conda env create --file environment.yml

RUN useradd -ms /bin/bash ian
USER ian
WORKDIR /home/ian

# apparently this is how to activate conda environments
# in dockerfiles
ENV PATH /opt/conda/envs/flask/bin:$PATH
RUN source activate flask

COPY --chown=ian:ian flaskian /home/ian/flaskian
COPY --chown=ian:ian ian.py ian.py

CMD ["gunicorn", "ian:app", "-b", "0.0.0.0:8000"]
