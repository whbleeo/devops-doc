FROM python:2.7
LABEL MAINTAINER="Wang Hongbo"
COPY . /app
WORKDIR /app
RUN pip install -r requirements.txt
RUN ln -sf /dev/stdout /app/logs/error.logs
EXPOSE 8000
ENTRYPOINT ["python", "manage.py", "--settings=admin.settings.settings1", "makemigrations", "&&", "python", "manage.py", "--settings=admin.settings.settings1", "migrate", "&&", "python", "manage.py", "--settings=admin.settings.settings1", "runserver"]
CMD ["0.0.0.0:8000"]
