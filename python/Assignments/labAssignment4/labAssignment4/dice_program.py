import random
from dataclasses import dataclass

@dataclass
class Die:
    __value:int = 1

    @property
    def value(self):
        return self.__value

    def roll(self):
        self.__value = random.randrange(1, 7)

    def __str__(self):
        return str(self.__value)
  
class Dice(list):
    def __init__(self):
        self.__list = []

    def addDie(self, die):
        self.__list.append(die)

    def rollAll(self):
        for die in self.__list:
            die.roll()
  
    def __iter__(self):
        for die in self.__list:
            yield die

dice = Dice()
dice.append(Die()) # uses method from list class
dice.append(Die()) # uses method from list class
dice.rollAll()
die = dice[0] # uses operators from list class
dice.insert(0, Die()) # uses method from list class
# dice.pop() # uses method from list class
print(dice)
print("Die value:", die.value)
print("Dice count:", len(dice))
