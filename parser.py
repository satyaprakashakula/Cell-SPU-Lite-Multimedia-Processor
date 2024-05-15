def twoscomplement(input):
    input = str(input)
    input = list(input)
    n = len(input)
    i = n - 1

    while i >= 0:
        if input[i] == "1":
            break
        i -= 1

    j = i - 1

    while j >= 0:
        if input[j] == "1":
            input[j] = "0"
        else:
            input[j] = "1"
        j -= 1
    return "".join(input)


def to_binary(val, bitsize):
    val = str(val).strip()
    if val.startswith('$'):
        val = format(int(val[1:]), 'b')
    elif val.startswith('-') or val.isdigit():
        if int(val) < 0:
            abs_binary = format(int(val[1:]), 'b')
            abs_binary = abs_binary.zfill(bitsize)
            val = twoscomplement(abs_binary)
        else:
            val = format(int(val), 'b')
    else:
        raise ValueError(f"Unexpected operand format: {val}")

    padded_val = val.zfill(bitsize)
    if len(padded_val) > bitsize:
        return padded_val[-bitsize:]
    return padded_val



assembly_code = open("assembly_code_copy.txt")
assembly = assembly_code.readlines()
binary = open("32bitbinary.txt", "w")

opcodes_4 = {
    "selb": "1000",
    "fma": "1110",
    "fms": "1111",
    "mpya": "1100",
}
opcodes_7 = {
    "ila": "0100001",
}
opcodes_8 = {
    "ahi": "00011101",
    "ai": "00011100",
    "sfhi": "00001101",
    "sfi": "00001100",
    "andhi": "00010101",
    "andi": "00010100",
    "orhi": "00000101",
    "ori": "00000100",
    "xorhi": "01000101",
    "xori": "01000100",
    "clgthi": "01011101",
    "clgti": "01011100",
    "cgthi": "01001101",
    "cgti": "01001100",
    "ceqhi": "01111101",
    "ceqi": "01111100",
    "mpyi": "01110100",
}
opcodes_9 = {
    "ilh": "010000011",
    "il": "010000001",
    "lqa": "001100001",
    "stqa": "001000001",
    "bra": "001100000",
    "brasl": "001100010",
    "br": "001100100",
    "brsl": "001100110",
    "brz": "001000000",
    "brnz": "001000010",
    "brhz": "001000100",
}

opcodes_11 = {
    "ah": "00011001000",
    "a": "00011000000",
    "cg": "00011000010",
    "addx": "01101000000",
    "bg": "00001000010",
    "sfx": "01101000010",
    "sfh": "00001001000",
    "sf": "00001000000",
    "and": "00011000001",
    "andc": "01011000001",
    "nand": "00011001001",
    "or": "00001000001",
    "orc": "01011001001",
    "nor": "00001001001",
    "clgth": "01011001000",
    "clgt": "01011000000",
    "cgth": "01001001000",
    "cgt": "01001000000",
    "ceqh": "01111001000",
    "ceq": "01111000000",
    "shlh": "00001011111",
    "shlhi": "00001111111",
    "shl": "00001011011",
    "shli": "00001111011",
    "roth": "00001011100",
    "rothi": "00001111100",
    "rot": "00001011000",
    "roti": "00001111000",
    "fa": "01011000100",
    "mpy": "01111000100",
    "mpyu ": "01111001100",
    "cntb": "01010110100",
    "absdb": "00001010011",
    "avgb": "00011010011",
    "sumb": "01001010011",
    "shlqby": "00001011111",
    "shlqbyi": "00111111111",
    "shlqbi": "00001011111",
    "shlqbii": "00111111111",
    "rotqby": "00111011100",
    "rotqbyi": "00111111100",
    "rotqbi": "00111011100",
    "rotqbii": "00111111100",
    "bi": "00110101000",
    "biz": "00100101000",
    "bisl": "00110101001",
    "stop": "00000000000",
    "nop": "01000000001",
    "lnop": "00000000001",
    "clz" : "01010100101",
    "fm" : "01011000110",
}

print(len(opcodes_7), len(opcodes_8), len(opcodes_9), len(opcodes_11))

count = 1
for line in assembly:
    parts = line.strip().split(maxsplit=1)
    if not parts:
        continue

    opcode = parts[0]
    operands = parts[1].split(',') if len(parts) > 1 else []
    operands = [op.strip() for op in operands]

    if opcode in opcodes_4.keys():
        binary.write(
            opcodes_4[opcode]
            + to_binary(operands[0], 7)
            + to_binary(operands[1], 7)
            + to_binary(operands[2], 7)
            + to_binary(operands[3], 7)
        )

    elif opcode in opcodes_11.keys():
        if (opcode == "nop") or (opcode == "lnop") or (opcode == "stop"):
            binary.write(opcodes_11[opcode] + to_binary(0, 21))
        elif len(operands) == 3:
            binary.write(opcodes_11[opcode]
                    + to_binary(operands[2], 7)
                    + to_binary(operands[1], 7)
                    + to_binary(operands[0], 7))

    elif opcode in opcodes_9.keys(): 
        binary.write(opcodes_9[opcode] + to_binary(operands[1], 16) + to_binary(operands[0], 7))

    elif opcode in opcodes_8.keys():
        binary.write(
            opcodes_8[opcode]
            + to_binary(operands[2], 10)
            + to_binary(operands[1], 7)
            + to_binary(operands[0], 7)
        )
    elif opcode in opcodes_7.keys():
        binary.write(
            opcodes_7[opcode] + to_binary(operands[1], 18) + to_binary(operands[0], 7)
        )
    else:
        print(parts)

    binary.write("\n")
    count += 1

binary.close()
assembly_code.close()
