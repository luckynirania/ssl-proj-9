import sys
g=open(sys.argv[1],"r")
con = g.read()
con = con.strip()
con = con.split("\n")
max = len(con)
for i in range(len(con)):
    con[i] = con[i].rstrip()
    if max < (len(con[i]) + 1) / 2:
        max = (len(con[i]) + 1) / 2
    con[i] = con[i].split(" ")
t = str()
y = str()
i = 0
j = 0
while i < max:
    while j < max:
        if i < len(con):
            if j < len(con[i]):
                if con[i][j] == "":
                    j = j + 1
                    t = t + "0 "
                else:
                    t = t + con[i][j] + " "
            else:
                t = t + "0 "
        else:
            t = t + "0 "
        j = j + 1
    j = 0
    i = i + 1
    t = t + "\n"
t = t.strip()
t = t.split("\n")
for i in range(len(t)):
    t[i] = t[i].rstrip()
    if max > (len(t[i]) + 1) / 2:
        t[i] = t[i] + " 0"
q = str()
for i in range(len(t)):
    q = q + t[i] + "\n"
q = q.strip()
z = open("tmpe.txt","w")
z.write(q)
z.close()