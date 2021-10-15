class TNode:						# 이진트리를 위한 노드 클래스
    def __init__ (self, data, left, right):	# 생성자
        self.data = data 			# 노드의 데이터
        self.left = left			# 왼쪽 자식을 위한 링크
        self.right = right			# 오른쪽 자식을 위한 링크

def count_node(root):
    if root is None:
        return 0
    else:
        return 1 + count_node(root.left) + count_node(root.right)

d = TNode('D', None, None)
e = TNode('E', None, None)
b = TNode('B', d, e)
f = TNode('F', None, None)
c = TNode('C', f, None)
root = TNode('A', b, c)		# 루트 노드
print("노드의 개수 = ", count_node(root))