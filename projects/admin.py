from django.contrib import admin

from projects import models

class ProjectAdmin(admin.ModelAdmin):
  prepopulated_fields = { 'slug': ('name',) }
  list_display = ('name', 'visible', 'active')
admin.site.register(models.Project, ProjectAdmin)

admin.site.register(models.Role)

class InvolvementAdmin(admin.ModelAdmin):
  list_display = ('user', 'project', 'role')
admin.site.register(models.Involvement, InvolvementAdmin)
