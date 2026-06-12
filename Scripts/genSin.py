import math

N = 256

with open("C:\\Nerd Projects\\FPGA-Projects\\Synth\\Scripts\\sin_table.coe", "w") as f:
    f.write("memory_initialization_radix=10;\n")
    f.write("memory_initialization_vector=\n")
    for i in range(N):
        angle = (2 * math.pi) * i / (N - 1)
        value = int(math.sin(angle) * 32767)

        if i == N - 1:
            f.write(f"{value};\n")
        else:
            f.write(f"{value},\n")