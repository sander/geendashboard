from django.conf.urls import patterns, include, url

from django.contrib import admin
admin.autodiscover()

import projects.views

urlpatterns = patterns('',
    # Examples:
    # url(r'^$', 'geendashboard.views.home', name='home'),
    # url(r'^blog/', include('blog.urls')),

    url(r'^$', projects.views.ProjectList.as_view()),

    url(r'^admin/', include(admin.site.urls)),
)
