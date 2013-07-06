from django.contrib.auth.decorators import login_required
from django.shortcuts import get_object_or_404, redirect, render
import json

from projects.models import *
from wunderlist.forms import *
from wunderlist.models import *

@login_required
def settings(request):
  try:
    account = Account.objects.get(user=request.user)
    if request.method == 'POST':
      account.delete()
      return redirect('wunderlist-settings')
    else:
      return render(request, 'wunderlist/settings.html', { 'account': account })
  except Account.DoesNotExist:
    if request.method == 'POST':
      form = LoginForm(request.POST)
      if form.is_valid():
        email = form.cleaned_data['wunderlist_email']
        Account(
            user=request.user,
            email=form.cleaned_data['wunderlist_email'],
            token=form.cleaned_data['token']
        ).save()
        return redirect('wunderlist-settings')
    else:
      form = LoginForm()
    return render(request, 'wunderlist/settings.html', { 'form': form })

@login_required
def attach(request, slug):
  project = get_object_or_404(Project, slug=slug)
  try:
    account = Account.objects.get(user=request.user)
  except Account.DoesNotExist:
    return render(request, 'wunderlist/no_account.html')
  if request.method == 'POST' and 'list' in request.POST:
    items = account.items(request.POST['list'])
    task_list, _ = TaskList.objects.get_or_create(
        project=project,
        account=account,
    )
    task_list.wunderlist_id = request.POST['list']
    task_list.tasks = json.dumps(items, indent=2)
    task_list.save()
    return redirect(project.get_absolute_url())
  else:
    lists = account.lists()
    return render(request, 'wunderlist/attach.html', {
      'project': project,
      'lists': lists
    })
