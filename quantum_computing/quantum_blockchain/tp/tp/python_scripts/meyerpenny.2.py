from pyquil.quil import Program
import pyquil.api as api

from pyquil.gates import I, H, X
qvm = api.QVMConnection()

picard_register = 1
answer_register = 0

then_branch = Program(X(0))
else_branch = Program(I(0))

prog = (Program()
    # Prepare Qubits in Heads state or superposition, respectively
    .inst(X(0), H(1))
    # Q puts the penny into a superposition
    .inst(H(0))
    # Picard makes a decision and acts accordingly
    .measure(1, picard_register)
    .if_then(picard_register, then_branch, else_branch)
    # Q undoes his superposition operation
    .inst(H(0))
    # The outcome is recorded into the answer register
    .measure(0, answer_register))

result = qvm.run(prog, [0, 1], trials=10)

print(result)
