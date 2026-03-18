def binary_encoder(s):
    r=""
    n=s.count(",")
    for i in range(n+1):
        l=s[:find(s, ",")+1]
        s=s[find(s, ",")+1:]
        print(l,"   ,    ",s)
        if l=="Sunny":
            r+="00"
        elif l=="Rainy":
            r+="01"
        elif l=="Cloudy":
            r+="10"
        elif l=="Snowy":
            r+="00"
        else:
            pass
    return r

print(binary_encoder("Sunny,Rainy,Cloudy,Snowy"))
