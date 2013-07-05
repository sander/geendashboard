geendashboard
=============


Installation
------------

1. Install Python 3.3+.
2. Untar Django 1.6b1+.
3. Run:

```
cd $PATH_TO_GEENDASHBOARD
pyvenv env
source env/bin/activate
curl -O http://python-distribute.org/distribute_setup.py
sudo python distribute_setup.py
sudo easy_install pip
pip install pytz
cd $PATH_TO_DJANGO
python setup.py install
cd $PATH_TO_GEENDASHBOARD
python manage.py syncdb
```


Running the development server
------------------------------

```
cd $PATH_TO_GEENDASHBOARD
source env/bin/activate
python manage.py runserver
```
