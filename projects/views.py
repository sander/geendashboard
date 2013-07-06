from django.shortcuts import render
from django.views.generic import DetailView
from django.views.generic import ListView

from projects.models import Project

class ProjectList(ListView):
  context_object_name = 'project'
  queryset = Project.objects.all()

class ProjectDetail(DetailView):
  context_object_name = 'project'
  model = Project
