import json
from inventory import all_gates
from reverser import Sky130Reverser

r = Sky130Reverser()

for gate in all_gates:

    print(gate)
    result = r.reverse(gate)
    print(json.dumps(result))