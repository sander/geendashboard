from django.contrib.auth.models import User
from django.db.models import *
import json
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
  project = OneToOneField(Project, unique=True)
  wunderlist_id = CharField(max_length=255)
  account = ForeignKey(Account)
  updated = DateTimeField(auto_now=True)

  tasks = TextField(blank=True, null=True)

  def __str__(self):
    return 'Task list for %s' % self.project

  def get_tasks(self):
    tasks = [task for task in json.loads(self.tasks) if not task['parent_id']]
    tasks.sort(key=lambda task: (not not task['completed_by_id'], float(task['position'])))
    return tasks
