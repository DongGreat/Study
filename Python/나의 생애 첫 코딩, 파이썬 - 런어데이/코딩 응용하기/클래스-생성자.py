# 클래스(class)
# * 클래스는 설계도일 뿐이다.
# * 설계도에 따라 만든 것이 객체(인스턴스)이다.

class Pet: # 클래스 선언(클래스명은 대문자로 시작)
    def __init__(self, color, kind, character): # 생성자(Constructor)
        self.color = color
        self.kind = kind
        self.character = character
        self.strength = 100 # 변수(속성)

    def walk(self, do):
        self.strength = self.strength - do
    def eat(self, do):
        self.strength = self.strength + do
    def sleef(self, do):
        self.strength = self.strength + do # 함수(메서드)

poodle = Pet("brown", "dog", "active")
siam = Pet("white", "cat", "quietly")

poodle.walk(15)
print(poodle.color, poodle.strength)

siam.eat(20)
print(siam.strength)