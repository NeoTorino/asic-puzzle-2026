class Var:
    def __init__(self, name):
        self.name = name


class And:
    def __init__(self, *args):
        self.args = args


class Or:
    def __init__(self, *args):
        self.args = args


class Not:
    def __init__(self, arg):
        self.arg = arg


class Const:
    def __init__(self, value):
        self.value = int(value)