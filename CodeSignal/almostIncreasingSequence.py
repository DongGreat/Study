# 나의 풀이
from typing import Sequence


def solution(sequence):
    for i in range(len(sequence)-1):
        if sequence[i] >= sequence[i+1]:
            if sequence.count(sequence[i]) < sequence.count(sequence[i+1]):
                del sequence[i+1]
                break
            else:
                del sequence[i]
                break
    for i in range(len(sequence)-1):
        if sequence[i] >= sequence[i+1]:
            return False
    return True

# 유저1
def solution(sequence):
    droppped = False
    last = prev = min(sequence) - 1 # last와 prev에 sequence 리스트의 최솟값 - 1의 값이 들어감
    for elm in sequence:
        if elm <= last: # 원소의 값이 last와 크거나 같은지 비교
            if droppped: # droppped가 True인 상태면
                return False # False 반환
            else: # droppped가 False인 상태면
                droppped = True # droppped를 True로 변환 = droppped는 딱 1번만 True로 변환하고 다음에 또 호출된다면 그땐 False를 반환
            if elm <= prev: # prev 값이 elm보다 크거나 같다면
                prev = last # prev는 last
            elif elm >= prev: # prev 값이 elm보다 작거나 같다면
                prev = last = elm # prev와 last는 elm
        else:
            prev, last = last, elm # prev에 last 값을 last에 elm 값을
    return True
