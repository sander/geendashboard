from django.conf import settings
from django.forms import *
from django.utils.translation import ugettext as _
import requests

class LoginForm(Form):
  wunderlist_email = EmailField()
  wunderlist_password = CharField(widget=PasswordInput)

  def clean(self):
    cleaned_data = super(LoginForm, self).clean()

    result = requests.post(settings.WUNDERLIST_API + 'login', data={
      'email': cleaned_data['wunderlist_email'],
      'password': cleaned_data['wunderlist_password']
    }).json()

    if 'errors' in result:
      raise ValidationError(_('Wrong email or password'), code='fail_to_authenticate')
    else:
      cleaned_data['token'] = result['token']

    return cleaned_data
