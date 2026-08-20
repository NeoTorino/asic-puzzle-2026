from dataclasses import dataclass, field

@dataclass
class Instance:
    name: str
    cell: str                # e.g. "sky130_fd_sc_hd__o22ai_2"
    inputs: dict              # pin -> net, e.g. {"A1": "net_23", "B1": "net_9"}
    outputs: dict             # pin -> net, e.g. {"Y": "net_44"} / {"Q": "n1", "Q_N": "n2"}


class Netlist:
    def __init__(self):
        self.instances = {}        # name -> Instance
        self.driver_of = {}        # net -> (instance_name, output_pin)
        self.primary_inputs = set()
        self.primary_outputs = {}  # e.g. {"success": "net_99", "o[0]": "net_5", ...}

    def add_instance(self, inst: Instance):
        self.instances[inst.name] = inst
        for pin, net in inst.outputs.items():
            self.driver_of[net] = (inst.name, pin)

    # loader(s) go here once we know your netlist's actual format