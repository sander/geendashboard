from django.contrib.auth.decorators import login_required
from django.shortcuts import redirect, render

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
