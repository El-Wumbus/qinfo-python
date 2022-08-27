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
