class Calcul:
    def __init__(self, first, second):
        self.first = first
        self.second = second
    def hap(self):
        result = self.first + self.second
        return result
    def cha(self):
        result = self.first - self.second
        return result
    def gob(self):
        result = self.first * self.second
        return result
    def nanu(self):
        result = self.first / self.second
        return result

car1 = Calcul(5, 3)
print(car1.hap())
print(car1.cha())
print(car1.gob())
print(car1.nanu())

car2 = Calcul(6, 8)
print(car2.hap())
print(car2.cha())
print(car2.gob())
print(car2.nanu())