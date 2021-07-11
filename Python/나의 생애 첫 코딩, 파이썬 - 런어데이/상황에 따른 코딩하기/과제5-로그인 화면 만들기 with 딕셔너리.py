register = {}

while True:
    a = int(input("원하는 메뉴를 선택해주세요.\n\t1. 회원가입\n\t2. 로그인\n\t입력 : "))    
    
    if a == 1:
        name = input("아이디를 입력해주세요. : ")
        if name in register:
            print("중복되는 아이디가 있습니다. 새로운 아이디를 입력해주세요.")
            continue
        password = int(input("비밀번호를 입력해주세요. : "))
        register[name] = password
    elif a == 2:
        name = input("아이디를 입력해주세요. : ")
        if name in register:
            password = int(input("비밀번호를 입력해주세요. : "))
            if password == register.get(name):
                print("로그인이 정상적으로 되었습니다.")
                break
            else:
                print("비밀번호가 틀렸습니다.")
                continue
        else:
            print("존재하지 않는 아이디입니다.")
            continue