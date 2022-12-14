# qinfo-python

Python Bindings for [qinfo](https://github.com/el-wumbus/qinfo).

## Installation

```bash
pip install qinfo-python
```

How to compile

Build dependencies:
  
* Python3 (Cython)
* gcc
* glibc
* make
* patchelf

```bash
git clone --recurse-submodules https://github.com/el-wumbus/qinfo-python
cd qinfo-pyhton
pip install -r ./requirements.txt 
make package
```

The package is in the `dist` directory.

## Usage

Below is a short example of some of the functionality of this module

```Python
#!/usr/bin/env python3
import qinfo
from sys import exit as sexit
from os import environ, path


def main():
    silent = False
    config_file = path.join(environ.get("HOME"), ".config/.qinfo.conf")
    configuration_options = qinfo.parse_config(config_file, silent)

    if configuration_options is None:
        return 1

    if configuration_options["display_cpu"]:
        cpu = qinfo.cpu_model()
        print(f"CPU: {cpu}")
    return 0


sexit(main())
```

### Avaliable Functions & What They Return

* `avalible_memory()` -> int
  * Returns the avalible memory in kB.

* `core_count()` -> int
  * Returns the core count.

* `cpu_model()` -> string
  * Returns the cpu model as a string.

* `kernel_release()` -> string
  * Returns the release and name of the kernel.

* `motherboard_model()` -> string
  * Returns the model name of the motherboard along with the manufacturer.

* `os_name()` -> string
  * Returns the operating system name (distro name) as a string.

* `parse_config(config_file_location: string, silent:bool)` -> dict
  * Returns a dict of all the configuration options.

* `thread_count()` -> int
  * Returns the thread count.

* `total_memory()` -> int
  * Returns the total memory in kB.

* `uptime()` -> long
  * Returns the uptime in seconds.
  
* `version()` -> string
  * Returns the version of qinfo being used.

* `hostname()` -> string
  * Return the hostname of the system as a string.

* `packages()` -> dict
  * Returns a dict of the number of packages for each supported package manager.

* `rootfs_age()` -> dict
  * Returns a dict of the age of the root file system.

* `shell()` -> string
  * Returns a string containing the shell (or if none found, the calling process).

* `username()` -> string
  * Returns the username of the user running the program as a string.

#### What the dictionaries look like

`parse_config()` returns a dict of the configuration options and their values.
This looks similar to the following:

```Python
{
  'display_cpu': 1,          # Display cpu name and core/thread info
  'display_etc_cpu': 0,      # Display extra cpu info
  'display_mem': 1,          # Display memory capacity and usage ratio
  'display_board': 1,        # Display motherboard info
  'display_hostname': 1,     # Display the computer's hostname
  'display_uptime': 1,       # Display the system uptime
  'display_gb': 1,           # Measure memory in gigabytes instead of kilobytes
  'display_kernel': 1,       # Display Kernel release version
  'display_logo': 1,         # Display a logo for the OS if supported
  'display_rootfs_birth': 1, # Display the birthdate of the root file system
  'display_pkg_count': 1,    # Display the number of packages for every supported package manager
  'display_shell': 1,        # Display the shell calling the program
  'display_username': 1,     # Display the username of the user calling the program
  'display_os': 1,           # Display the os name
  'date_order' : 0,          # supported formats are YYYY/MM/DD (0) and MM/DD/YYYY (1)
  'idcolor': '\x1b[1;36m',   # Color for the id column
  'txtcolor': '',            # Color for the text column
  'logocolor': '\x1b[0;31m'  # Color for the logo
}
```

The *color values are ansi escape codes.
The rest are int values that are either `1` or `0` (a.k.a booleans).

`rootfs_age()` returns a dict containing the date.
This will look like the following:

```Python
{
  'year': 2022,
  'month': 8,
  'day': 21
}
```

`packages()` returns a dict that looks something like the following:

```Python
{
  'pacman': 979,
  'apt': 372,
  'apk': 87,
  'flatpak': 0,
  'snap': 0
}
```
