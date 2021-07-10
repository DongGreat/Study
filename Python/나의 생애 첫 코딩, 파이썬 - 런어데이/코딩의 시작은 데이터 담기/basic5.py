f={"가":1, "나":2, "다":[3, 4, 5]}

print(f["가"])
print(f["다"])

f["나"]=6
print(f)

f["라"]=7
print(f)

del f["나"]
print(f)

print(list(f.keys())) # 키만 추출하기

print(list(f.values())) # 값만 추출하기