import cv2

RESIZE = True

PATH = "./thirdlevel.png"

img = cv2.imread(PATH)
if (RESIZE):
    res = cv2.resize(img, dsize=(64, 54), interpolation=cv2.INTER_AREA)
    cv2.imwrite("resized.png", res)
else:
    res = img

print(len(res))
print(len(res[0]))

f = open("output.txt", "w")

prev_color = ""

for x in range(0, 54):
    for y in range(0, 64):
        b, g, r = res[x, y]
        if (b < 10 and g < 10 and r < 10):
            b = 0
            g = 0
            r = 0

        color = "{:02x}{:02x}{:02x}".format(r, g, b)

        if (prev_color != color):
            f.write(f"li $t9 0x{color}\n")
        f.write(f"sw $t9 {2560 + 256*x + 4*y}($s7)\n")

        prev_color = color

f.close()
