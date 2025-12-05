FROM python:3.11-slim

WORKDIR /app

COPY requirements.txt .

RUN pip install --upgrade pip && pip install -r requirements.txt

COPY . .

EXPOSE 8000

# ---- DEV STAGE ----
# CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

# ---- PROD STAGE 1 ----
# CMD ["gunicorn", "personalblog.wsgi:application", "--bind", "0.0.0.0:8000"]

# ---- PROD STAGE 2 ----
CMD ["gunicorn", "personalblog.wsgi:application", "--bind", "0.0.0.0:8000"]
