from parser import normalize
from reverser import Sky130Reverser

FLIP_FLOPS = {"dfxtp", "dfrtp", "dfstp"}


class JustificationTracer:
    def __init__(self, netlist, stop_at_registers=True):
        self.nl = netlist
        self.rev = Sky130Reverser()
        self.stop_at_registers = stop_at_registers

    def trace(self, net, value, depth=0, _seen=None):
        indent = "  " * depth
        _seen = _seen or set()

        if net in self.nl.primary_inputs:
            print(f"{indent}{net} = {value}   (primary input)")
            return

        driver = self.nl.driver_of.get(net)
        if driver is None:
            print(f"{indent}{net} = {value}   (unconnected / free)")
            return

        inst_name, out_pin = driver
        if (inst_name, value) in _seen:
            print(f"{indent}{net} = {value}   <- {inst_name} (already expanded above)")
            return
        _seen = _seen | {(inst_name, value)}

        inst = self.nl.instances[inst_name]
        base = normalize(inst.cell)

        # tie cells
        if base == "conb":
            const = 1 if out_pin == "HI" else 0
            status = "OK" if const == value else "CONTRADICTION"
            print(f"{indent}{net} = {value}   <- {inst_name} (conb, drives constant {const}) [{status}]")
            return

        # register boundary
        if base in FLIP_FLOPS:
            print(f"{indent}{net} = {value}   <- Q of {inst_name} ({inst.cell})")
            if self.stop_at_registers:
                print(f"{indent}  [register boundary: {net} must equal {value} "
                      f"at the previous clk edge]")
                return
            d_net = inst.inputs.get("D")
            print(f"{indent}  walking into D (previous cycle) ->")
            self.trace(d_net, value, depth + 1, _seen)
            return

        # ordinary combinational gate
        print(f"{indent}{net} = {value}   <- output of {inst_name} ({inst.cell})")
        branches = self.rev.reverse(inst.cell)[value]

        if not branches:
            print(f"{indent}  UNSATISFIABLE: no input combination of {inst.cell} "
                  f"gives Y={value}")
            return

        print(f"{indent}  {len(branches)} valid input combination(s):")
        for i, assignment in enumerate(branches, 1):
            print(f"{indent}  branch {i}: {assignment}")
            for pin, pin_val in assignment.items():
                actual_net = inst.inputs[pin]
                self.trace(actual_net, pin_val, depth + 2, _seen)