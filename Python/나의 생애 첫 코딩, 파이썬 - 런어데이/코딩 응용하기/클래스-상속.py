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

class Animal(Pet): # 클래스 상속(Inheritance)
    def walk(self, do): # 메서드 오버라이딩
        if self.strength <= 0:
            print("체력이 없습니다.")
        else:
            self.strength = self.strength - do

simba = Animal("yellow", "tiger", "active")
simba.walk(100)
simba.walk(100)
print(simba.strength)