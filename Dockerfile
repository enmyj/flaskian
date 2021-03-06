FROM python
EXPOSE 8000

RUN pip install gunicorn flask 

# create user
RUN useradd -ms /bin/bash ian
USER ian
WORKDIR /home/ian

# copy in app files
COPY --chown=ian:ian flaskian /home/ian/flaskian
COPY --chown=ian:ian ian.py ian.py

# RUN IAN
CMD ["gunicorn", "ian:app", "-b", "0.0.0.0:8000"]
