from django.contrib.auth.decorators import login_required
from django.shortcuts import render
from django.utils.decorators import method_decorator
from django.views.generic import DetailView
from django.views.generic import ListView

from projects.models import Involvement, Project

class ProjectList(ListView):
  context_object_name = 'project'

  def get_queryset(self):
    return Project.objects.filter(involvement__user=self.request.user)

  @method_decorator(login_required)
  def dispatch(self, *args, **kwargs):
    return super(ProjectList, self).dispatch(*args, **kwargs)

class ProjectDetail(DetailView):
  context_object_name = 'project'

  def get_queryset(self):
    return Project.objects.filter(involvement__user=self.request.user)

  @method_decorator(login_required)
  def dispatch(self, *args, **kwargs):
    return super(ProjectDetail, self).dispatch(*args, **kwargs)
