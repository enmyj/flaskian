FROM continuumio/miniconda3
SHELL ["/bin/bash", "-c"]

EXPOSE 80

# easiest way to handle anaconda/docker
# just update the base environment
COPY environment.yml environment.yml
RUN /opt/conda/bin/conda env update --file environment.yml

# copy in app files
COPY flaskian flaskian
COPY ian.py ian.py

# RUN IAN
CMD ["gunicorn", "ian:app", "-b", "0.0.0.0:80"]
