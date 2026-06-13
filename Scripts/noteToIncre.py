import math

with open("C:\\Nerd Projects\\FPGA-Projects\\Synth\\Scripts\\note_rom.coe", "w") as f:
    f.write("memory_initialization_radix=10;\n")
    f.write("memory_initialization_vector=\n")
    for note in range(128):
        freq = 440.0 * (2.0 ** ((note - 69) / 12.0))
        inc  = int((freq * (2**32)) / 100_000_000)
        sep  = "," if note < 127 else ";"
        f.write(f"{inc}{sep}\n")