FROM continuumio/miniconda3
SHELL ["/bin/bash", "-c"]
EXPOSE 8000

# easiest way to handle anaconda/docker
# just update the base environment
COPY environment.yml environment.yml
RUN /opt/conda/bin/conda env update --file environment.yml

# create user
RUN useradd -ms /bin/bash ian
USER ian
WORKDIR /home/ian

# copy in app files
COPY --chown=ian:ian flaskian /home/ian/flaskian
COPY --chown=ian:ian ian.py ian.py

# RUN IAN
CMD ["gunicorn", "ian:app", "-b", "0.0.0.0:8000"]
