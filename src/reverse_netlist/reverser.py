from itertools import product

from ast_nodes import *
from parser import normalize, parse_basic, parse_complex


class Sky130Reverser:

    def eval(self, node, values):

        if isinstance(node, Var):
            return values[node.name]

        if isinstance(node, And):
            return int(all(self.eval(x, values) for x in node.args))

        if isinstance(node, Or):
            return int(any(self.eval(x, values) for x in node.args))

        if isinstance(node, Not):
            return int(not self.eval(node.arg, values))

        if isinstance(node, Const):
            return node.value

        raise TypeError(
            f"Unsupported AST node: {type(node).__name__}"
        )

    def build(self, cell):

        cell = normalize(cell)

        basic = parse_basic(cell)

        if basic:
            vars_, expr = basic
            return [v.name for v in vars_], expr

        complex_ = parse_complex(cell)

        if complex_:
            vars_, expr = complex_
            return [v.name for v in vars_], expr

        raise ValueError(
            f"Unsupported gate: {cell}"
        )

    def reverse(self, cell):

        inputs, expr = self.build(cell)

        result = {
            0: [],
            1: []
        }

        for values in product(
            [0, 1],
            repeat=len(inputs)
        ):

            assignment = dict(
                zip(inputs, values)
            )

            output = self.eval(
                expr,
                assignment
            )

            result[output].append(
                assignment
            )

        return result

    def truth_table(self, cell):

        inputs, expr = self.build(cell)

        table = []

        for values in product(
            [0, 1],
            repeat=len(inputs)
        ):

            assignment = dict(
                zip(inputs, values)
            )

            table.append({
                **assignment,
                "Y": self.eval(
                    expr,
                    assignment
                )
            })

        return table
