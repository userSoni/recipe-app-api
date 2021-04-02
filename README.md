# recipe-app-api
Recipe app api source code

# Command that will use to build manage.py file
1. docker-compose run app sh -c "python manage.py makemigrations core"
2. docker-compose run app sh -c "python manage.py test && flake8"
3. docker-compose build
