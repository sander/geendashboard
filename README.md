geendashboard
=============


Installation
------------

1. Install Python 3.3+.
2. Untar Django 1.6b1+.
3. `cd` to the geendashboard directory.
4. Run:

    pyvenv env
    source env/bin/activate
    curl -O http://python-distribute.org/distribute_setup.py
    sudo python distribute_setup.py
    sudo easy_install pip
    pip install pytz

5. `cd` to the Django directory and run `python setup.py install`.
3. `cd` to the geendashboard directory and run `python manage.py syncdb`.


Running the development server
------------------------------

1. `cd` to the geendashboard directory.
2. Run:

    source env/bin/activate
    python manage.py runserver
