import re

from ast_nodes import Var, And, Or, Not


def normalize(name):

    name = name.split("__")[-1]

    m = re.match(r"(.+)_\d+$", name)

    if m:
        name = m.group(1)

    return name


def make_vars(*names):
    return [Var(x) for x in names]


def parse_basic(cell):

    # -------------------------
    # BUFFERS / INVERTERS
    # -------------------------

    if cell == "inv":
        A = Var("A")
        return [A], Not(A)

    if cell == "buf":
        A = Var("A")
        return [A], A

    if cell == "clkbuf":
        A = Var("A")
        return [A], A

    # -------------------------
    # XOR FAMILY
    # -------------------------

    if cell == "xor2":
        A, B = make_vars("A", "B")
        return ([A, B], Or( And(A, Not(B)), And(Not(A), B)))

    if cell == "xnor2":
        A, B = make_vars("A", "B")
        return (
            [A, B], Not( Or( And(A, Not(B)), And(Not(A), B))))

    # -------------------------
    # AND FAMILY
    # -------------------------

    if cell == "and2":
        A, B = make_vars("A", "B")
        return [A, B], And(A, B)

    if cell == "and2b":
        A, B = make_vars("A", "B")
        return [A, B], And(Not(A), B)

    if cell == "and3":
        A, B, C = make_vars("A", "B", "C")
        return [A, B, C], And(A, B, C)

    if cell == "and3b":
        A, B, C = make_vars("A", "B", "C")
        return [A, B, C], And(Not(A), B, C)

    if cell == "and4":
        A, B, C, D = make_vars("A", "B", "C", "D")
        return [A, B, C, D], And(A, B, C, D)

    if cell == "and4b":
        A, B, C, D = make_vars("A", "B", "C", "D")
        return [A, B, C, D], And(Not(A), B, C, D)

    if cell == "and4bb":
        A, B, C, D = make_vars("A", "B", "C", "D")
        return [A, B, C, D], And(Not(A), Not(B), C, D)

    # -------------------------
    # OR FAMILY
    # -------------------------

    if cell == "or2":
        A, B = make_vars("A", "B")
        return [A, B], Or(A, B)

    if cell == "or3":
        A, B, C = make_vars("A", "B", "C")
        return [A, B, C], Or(A, B, C)

    if cell == "or3b":
        A, B, C = make_vars("A", "B", "C")
        return [A, B, C], Or(A, B, Not(C))

    if cell == "or4":
        A, B, C, D = make_vars("A", "B", "C", "D")
        return [A, B, C, D], Or(A, B, C, D)

    if cell == "or4b":
        A, B, C, D = make_vars("A", "B", "C", "D")
        return [A, B, C, D], Or(A, B, C, Not(D))

    if cell == "or4bb":
        A, B, C, D = make_vars("A", "B", "C", "D")
        return [A, B, C, D], Or(Not(A), Not(B), C, D)

    # -------------------------
    # NAND FAMILY
    # -------------------------

    if cell == "nand2":
        A, B = make_vars("A", "B")
        return [A, B], Not(And(A, B))

    if cell == "nand2b":
        A, B = make_vars("A", "B")
        return [A, B], Not(And(Not(A), B))

    if cell == "nand3":
        A, B, C = make_vars("A", "B", "C")
        return [A, B, C], Not(And(A, B, C))

    if cell == "nand3b":
        A, B, C = make_vars("A", "B", "C")
        return [A, B, C], Not(And(Not(A), B, C))

    if cell == "nand4":
        A, B, C, D = make_vars("A", "B", "C", "D")
        return [A, B, C, D], Not(And(A, B, C, D))

    # -------------------------
    # NOR FAMILY
    # -------------------------

    if cell == "nor2":
        A, B = make_vars("A", "B")
        return [A, B], Not(Or(A, B))

    if cell == "nor3":
        A, B, C = make_vars("A", "B", "C")
        return [A, B, C], Not(Or(A, B, C))

    if cell == "nor3b":
        A, B, C = make_vars("A", "B", "C")
        return [A, B, C], Not(Or(A, B, Not(C)))

    if cell == "nor4":
        A, B, C, D = make_vars("A", "B", "C", "D")
        return [A, B, C, D], Not(Or(A, B, C, D))

    if cell == "nor4b":
        A, B, C, D = make_vars("A", "B", "C", "D")
        return [A, B, C, D], Not(Or(A, B, C, Not(D)))

    # -------------------------
    # MUX
    # -------------------------

    if cell == "mux2":
        A0, A1, S = make_vars("A0", "A1", "S" )
        return ([A0, A1, S], Or( And( Not(S), A0), And( S, A1)))

    return None


def build_a_family(pattern, invert=False):

    groups = []
    inputs = []

    prefixes = "ABCDEF"

    for group_idx, width in enumerate(pattern):

        width = int(width)

        group_vars = []

        for pin in range(1, width + 1):

            name = f"{prefixes[group_idx]}{pin}"

            v = Var(name)

            inputs.append(v)
            group_vars.append(v)

        if len(group_vars) == 1:
            groups.append(group_vars[0])
        else:
            groups.append(And(*group_vars))

    expr = Or(*groups)

    if invert:
        expr = Not(expr)

    return inputs, expr


def build_o_family(pattern, invert=False):

    groups = []
    inputs = []

    prefixes = "ABCDEF"

    for group_idx, width in enumerate(pattern):

        width = int(width)

        group_vars = []

        for pin in range(1, width + 1):

            name = f"{prefixes[group_idx]}{pin}"

            v = Var(name)

            inputs.append(v)
            group_vars.append(v)

        if len(group_vars) == 1:
            groups.append(group_vars[0])
        else:
            groups.append(Or(*group_vars))

    expr = And(*groups)

    if invert:
        expr = Not(expr)

    return inputs, expr


def parse_complex(cell):

    #
    # AO family
    #
    m = re.match(r"a(\d+)oi$", cell)
    if m:
        return build_a_family(m.group(1), invert=True)

    m = re.match(r"a(\d+)o$", cell)
    if m:
        return build_a_family(m.group(1))

    #
    # OA family
    #
    m = re.match(r"o(\d+)ai$", cell)
    if m:
        return build_o_family(m.group(1), invert=True)

    m = re.match(r"o(\d+)a$", cell)
    if m:
        return build_o_family(m.group(1))

    #
    # a21bo
    # ((A1 & A2) | ~B1)
    #
    if cell == "a21bo":

        A1, A2, B1 = make_vars("A1", "A2", "B1")

        return (
            [A1, A2, B1],
            Or(
                And(A1, A2),
                Not(B1)
            )
        )

    if cell == "a21boi":

        A1, A2, B1 = make_vars("A1", "A2", "B1")

        return (
            [A1, A2, B1],
            Not(
                Or(
                    And(A1, A2),
                    Not(B1)
                )
            )
        )

    #
    # o21ba
    # ((A1 | A2) & ~B1)
    #
    if cell == "o21ba":

        A1, A2, B1 = make_vars("A1", "A2", "B1")

        return (
            [A1, A2, B1],
            And(
                Or(A1, A2),
                Not(B1)
            )
        )

    if cell == "o21bai":

        A1, A2, B1 = make_vars("A1", "A2", "B1")

        return (
            [A1, A2, B1],
            Not(
                And(
                    Or(A1, A2),
                    Not(B1)
                )
            )
        )

    #
    # o2bb2a
    # (~A1 | ~A2) & (B1 | B2)
    #
    if cell == "o2bb2a":

        A1, A2, B1, B2 = make_vars(
            "A1", "A2", "B1", "B2"
        )

        return (
            [A1, A2, B1, B2],
            And(
                Or(Not(A1), Not(A2)),
                Or(B1, B2)
            )
        )

    return None