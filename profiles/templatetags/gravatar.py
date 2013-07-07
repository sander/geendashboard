from django import template
import hashlib
import urllib.parse

register = template.Library()

class GravatarUrlNode(template.Node):
  def __init__(self, email):
    self.email = template.Variable(email)

  def render(self, context):
    try:
      email = self.email.resolve(context)
    except template.VariableDoesNotExist:
      return ''

    default = 'mm'
    size = 32

    return 'http://www.gravatar.com/avatar/%s?%s' % (
      hashlib.md5(email.lower().encode('utf-8')).hexdigest(),
      urllib.parse.urlencode({ 'd': default, 's': str(size) })
    )

@register.tag
def gravatar_url(parser, token):
  try:
    tag_name, email = token.split_contents()
  except ValueError:
    raise(template.TemplateSyntaxError, '%r tag requires an email address argument' % token)

  return GravatarUrlNode(email)
