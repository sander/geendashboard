from django.shortcuts import render
from django.views.generic import ListView

from projects import models

class ProjectList(ListView):
  context_object_name = 'project'
  queryset = models.Project.objects.all()
