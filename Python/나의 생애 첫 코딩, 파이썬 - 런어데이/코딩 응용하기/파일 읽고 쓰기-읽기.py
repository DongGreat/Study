f = open(r"C:\Users\DONGHYEON\OneDrive\바탕 화면\Study\Python\나의 생애 첫 코딩, 파이썬 - 런어데이\코딩 응용하기\test.txt", "r", encoding='UTF8')
# f = open("text.txt", "r")

text = f.read()
print(text)

f.close()

# 파일 열기
# 파일의 경로 입력하기
# 파일 열기 모드 - r : 읽기모드
# 파일 입력 함수 - read : 내용 전체를 읽어오기, readline : 한 줄씩 읽어오기, readlines : 내용 전체를 읽어오되 리스트로 읽어오기
# 파일 닫기