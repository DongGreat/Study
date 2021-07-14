# time.time() - 1970년 1월 1일 자정 이후로 누적된 초를 유닉스타임으로 보여주기
# time.sleep(초) - 입력한 초만큼 정지하기
# time.localtime() - 현재 시각 알려주기
# t.tm_year - 현재 연도 알려주기
# t.tm_mon - 현재 월 알려주기
# t.tm_mday - 현재 일 알려주기
# t.tm_hour - 현재 시 알려주기
# t.tm_min - 현재 분 알려주기
# t.tm_sec - 현재 초 알려주기

import time

a = time.time()

b = input("1 + 1 = ? ")
c = time.time()

if b == "2" and c - a <= 2: # time.time()은 시간을 잴 때 사용
    print("정답")
else:
    print("오답")

print("정답")
time.sleep(1)
print("오답")

print(time.localtime())

t = time.localtime()
print(t.tm_year)