# Generated by Django 2.1.15 on 2021-08-31 08:11

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0003_ingradient'),
    ]

    operations = [
        migrations.RenameModel(
            old_name='Ingradient',
            new_name='Ingredient',
        ),
    ]
