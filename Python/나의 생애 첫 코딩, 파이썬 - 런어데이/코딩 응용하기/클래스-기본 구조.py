class Pet: # 클래스 선언(클래스명은 대문자로 시작)
    color = ""
    kind = "dog"
    character = "home-grown"
    strength = 100 # 변수(속성)

    def walk(self, do):
        self.strength = self.strength - do
    def eat(self, do):
        self.strength = self.strength + do
    def sleef(self, do):
        self.strength = self.strength + do # 함수(메서드)