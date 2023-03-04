from tp_src.controller.controller import save
from tp_src.api import api


def add(x, y):
    save(x)
    save(y)
    return x + y
