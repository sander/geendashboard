from django.conf.urls import patterns, include, url

from django.contrib import admin
admin.autodiscover()

import projects.views

urlpatterns = patterns('',
    # Examples:
    # url(r'^$', 'geendashboard.views.home', name='home'),
    # url(r'^blog/', include('blog.urls')),

    url(r'^$', projects.views.ProjectList.as_view(), name='project-list'),
    url(r'^project/(?P<slug>[-_\w]+)/$', projects.views.ProjectDetail.as_view(), name='project-detail'),

    url(r'^account/log-in$', 'django.contrib.auth.views.login', name='login'),
    url(r'^account/log-out$', 'django.contrib.auth.views.logout', { 'next_page': '/' }, name='logout'),

    url(r'^account/services/wunderlist$', 'wunderlist.views.settings', name='wunderlist-settings'),

    url(r'^admin/', include(admin.site.urls)),
)
