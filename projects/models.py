from django.contrib.auth.models import User
from django.core.urlresolvers import reverse
from django.db.models import *

class Project(Model):
  name = CharField(blank=True, max_length=70)
  goal = TextField(blank=True)

  start = DateTimeField(blank=True, null=True)
  due = DateTimeField(blank=True, null=True)
  end = DateTimeField(blank=True, null=True)

  visible = BooleanField(default=False)
  active = BooleanField(default=False)

  slug = SlugField()

  def __str__(self):
    return self.name

  def get_absolute_url(self):
    return reverse('project-detail', args=(self.slug,))

class Role(Model):
  name = CharField(max_length=20)

  can_read = BooleanField(default=True)
  can_write = BooleanField(default=True)

  def __str__(self):
    return self.name

class Involvement(Model):
  user = ForeignKey(User)
  project = ForeignKey(Project)
  role = ForeignKey(Role)

  def __str__(self):
    return '%s in %s as %s' % (self.user, self.project, self.role)
