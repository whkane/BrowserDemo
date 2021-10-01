# Testing Band websites and players

## Introduction

A short demonstration with Browser library and RPA.Desktop.Windows Library. This demonstration uses Robot Framework Browser library to open a band website and performs the following test cases:

1. Read page id's and verify a text from the main page.
2. Goes to band's Facebook page.
3. Goes to band's Twitter page.
4. Goes to band's Youtube page and plays a video for a duration.
5. Open Spotify in Windows desktop and play songs from a selected band. Note: you need to be logged in in order to make the test work.
6. Open Bandcamp and go through EP's of a band and play each song for a duration.

## Robot Framework and Python libraries

Package                        | Version
-------------------------------| -------
appdirs                        |      1.4.4
Appium-Python-Client           |      1.2.0
attrs                          |        21.2.0
Authlib                        |        0.15.4
backports.cached-property      |        1.0.1
backports.entry-points-selectable   |   1.1.0
bcrypt                         |        3.2.0
beautifulsoup4                 |        4.10.0
cached-property                |        1.5.2
certifi                        |        2021.5.30
cffi                           |        1.14.6
chardet                        |        3.0.4
charset-normalizer             |        2.0.6
click                          |        7.1.2
colorama                       |        0.4.4
comtypes                       |        1.1.7
coverage                       |        5.5
cryptography                   |        3.4.8
decorator                      |        5.1.0
defusedxml                     |        0.7.1
distlib                        |        0.3.3
dnspython                      |        2.1.0
docutils                       |        0.17.1
et-xmlfile                     |        1.1.0
exchangelib                    |        4.5.1
filelock                       |        3.2.0
fpdf2                          |        2.4.3
furl                           |        2.1.3
graphviz                       |        0.13.2
grpcio                         |        1.40.0
grpcio-tools                   |        1.40.0
idna                           |        3.2
isodate                        |        0.6.0
java-access-bridge-wrapper     |        0.7.5
jsonpath-ng                    |        1.5.3
jsonpath-rw                    |        1.4.0
jsonpath-rw-ext                |        1.2.2
jsonschema                     |        4.0.1
kitchen                        |        1.2.6
lxml                           |        4.6.3
msedge-selenium-tools          |        3.141.3
mss                            |        6.1.0
netsuitesdk                    |        1.24.0
notifiers                      |        1.2.1
ntlm-auth                      |        1.5.0
oauthlib                       |        3.1.1
openpyxl                       |        3.0.9
orderedmultidict               |        1.0.1
overrides                      |        6.1.0
paramiko                       |        2.7.2
pbr                            |        5.6.0
pdfminer.six                   |        20201018
pdfminer2                      |        20151206
Pillow                         |        8.3.2
pip                            |        21.2.4
platformdirs                   |        2.4.0
pluggy                         |        0.13.1
ply                            |        3.11
protobuf                       |        3.17.3
psutil                         |        5.8.0
py                             |        1.10.0
pycparser                      |        2.20
Pygments                       |        2.10.0
PyNaCl                         |        1.4.0
pynput-robocorp-fork           |        4.0.0
PyPDF2                         |        1.26.0
pyperclip                      |        1.8.2
pyrsistent                     |        0.18.0
PySocks                        |        1.7.1
python-dateutil                |        2.8.2
pytz                           |        2021.1
pywin32                        |        301
pywinauto                      |        0.6.8
PyYAML                         |        5.4.1
requests                       |        2.26.0
requests-file                  |        1.5.1
requests-ntlm                  |        1.1.0
requests-oauthlib              |        1.3.0
requests-toolbelt              |        0.9.1
rfc3987                        |        1.3.8
robocorp-dialog                |        0.4.1
robotframework                 |        4.1.1
robotframework-appiumlibrary   |        1.6.3
robotframework-assertion-engine|        0.2.0
robotframework-browser         |        8.0.2
robotframework-datadriver      |        1.5.0
robotframework-jsonlibrary     |        0.3.1
robotframework-lint            |        1.1
robotframework-pdf2textlibrary |        1.0.1
robotframework-pythonlibcore   |        3.0.0
robotframework-requests        |        0.9.2
robotframework-sapguilibrary   |        1.1
robotframework-seleniumlibrary |        5.1.3
robotframework-seleniumtestability |    1.1.0
robotframework-sshlibrary      |        3.7.0
robotframework-sudslibrary-aljcalandra | 1.1
robotframework-zoomba          |        2.12.3
rpaframework                   |        11.3.0
rpaframework-core              |        6.5.1
rpaframework-dialogs           |        0.4.2
rpaframework-pdf               |        0.9.0
scp                            |        0.14.1
selenium                       |        3.141.0
setuptools                     |        57.4.0
simple-salesforce              |        1.11.4
six                            |        1.16.0
sortedcontainers               |        2.4.0
soupsieve                      |        2.2.1
spotipy                        |        2.19.0
suds-jurko                     |        0.6
tm4j-reporter-api              |        0.1.2
tm4j-reporter-robot            |        0.1.4
tox                            |        3.0.0
tqdm                           |        4.62.3
tweepy                         |        3.10.0
typing-extensions              |        3.10.0.2
typing-utils                   |        0.1.0
tzdata                         |        2021.1
tzlocal                        |        2.1
urllib3                        |        1.26.6
virtualenv                     |        20.8.1
webdrivermanager               |        0.10.0
wheel                          |        0.37.0
wrapt                          |        1.12.1
xlrd                           |        2.0.1
xlutils                        |        2.0.0
xlwt                           |        1.3.0
zeep                           |        4.1.0

## Other software tools needed

Software       |    Version
---------------|-------------
Node.js        |    14.18.0

## Commands and other information

You can operate the suite as follows.

## Run the whole test suite

```robot .\browser_demo.robot``` OR ```robot --include Dystocracy .```

## Run Page Id and Text test case

```robot --include Pageid .```

## Run Facebook test case

```robot --include Facebook .```

## Run Twitter test case

```robot --include Twitter .```

## Run Youtube test case

```robot --include Youtube .```

## Run Spotify test case

```robot --include Spotify .```

## Run Bandcamp test case

```robot --include Bandcamp .```