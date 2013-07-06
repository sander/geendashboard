from django.contrib.auth.models import User
from django.db.models import *
import requests

from projects.models import *

class Account(Model):
  user = ForeignKey(User, unique=True)
  email = EmailField()
  token = CharField(max_length=255)
  issued = DateTimeField(auto_now=True)

  def get(self, path):
    return requests.get(settings.WUNDERLIST_API + path, headers={
      'Authorization': 'Bearer ' + self.token
    }).json()

  def lists(self):
    return self.get('me/lists')

  def items(self, list_id):
    tasks = self.get('me/tasks')
    return [task for task in tasks if task['list_id'] == list_id]

  def __str__(self):
    return 'Wunderlist account for %s' % self.email

class TaskList(Model):
  project = ForeignKey(Project, unique=True)
  account = ForeignKey(Account)
  updated = DateTimeField(auto_now=True)

  tasks = TextField(blank=True, null=True)

  def __str__(self):
    return 'Task list for %s' % self.project
