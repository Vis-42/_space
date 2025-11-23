def print_set(s):
    if s=="":
        print('{}')
    else:
        r='{'
        for i in s[:-1]:
            r+=i+', '
        r+=s[-1]+'}'
        print(r)

def binary_subset(set_str, binary_rep):
    r=''
    for i in range(len(binary_rep)):
        if binary_rep[i]=='1':
            r+=set_str[i]
    return r

