f = open(r"C:\Users\DONGHYEON\OneDrive\바탕 화면\Study\Python\나의 생애 첫 코딩, 파이썬 - 런어데이\코딩 응용하기\test2.txt", "w", encoding='UTF-8')
# f = open("test2.txt", "w")

f.write("코리아\n")

f.close()

# 파일 열기
# 파일의 경로 입력하기
# 파일 열기모드 - w : 쓰기모드
# 파일 입력 함수 - write : 내용 전체를 쓰기, writelines : 내용 전체를 리스트로 쓰기
# 파일 닫기

# 파일 이어서 쓰기
f = open(r"C:\Users\DONGHYEON\OneDrive\바탕 화면\Study\Python\나의 생애 첫 코딩, 파이썬 - 런어데이\코딩 응용하기\test2.txt", "a", encoding='UTF-8')
# f = open("test2.txt", "a")

f.write("런어데이")

f.close()