import z3

from trace_utils import Var, Const, Not, And, Or, Xor

def to_z3(node, zvar):
    if isinstance(node, Var):
        return zvar(node.name)
    if isinstance(node, Const):
        return z3.BoolVal(bool(node.value))
    if isinstance(node, Not):
        return z3.Not(to_z3(node.arg, zvar))
    if isinstance(node, And):
        return z3.And([to_z3(a, zvar) for a in node.args])
    if isinstance(node, Or):
        return z3.Or([to_z3(a, zvar) for a in node.args])
    if isinstance(node, Xor):
        parts = [to_z3(a, zvar) for a in node.args]
        expr = parts[0]
        for p in parts[1:]:
            expr = z3.Xor(expr, p)
        return expr
    raise TypeError(type(node))