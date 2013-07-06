from django.contrib.auth.models import User
from django.db.models import *

class Account(Model):
  user = ForeignKey(User, unique=True)
  email = EmailField()
  token = CharField(max_length=255)
  issued = DateTimeField(auto_now=True)
