# 2.05 리스트

# 자료구조 책에서 리스트list는 배열과 비교할 때 데이터를 중간 중간에 삽입하는데 유리한 구조로 설명한다.
# 물론 그러한 장점은 동일하지만 R에서 리스트는 데이터를 접근한다는 관점에서 다른 언어의 해시 테이블 또는
# 딕셔너리로 종종 설명된다. 즉, 리스트는 '(키,값)' 형태의 데이터를 담는 연관 배열 Associative Array이다.

# 리스트 생성
# list: 리스트 객체를 생성한다.
#	key1=value1,
#	key2=value2
#	...
# 반환값은 key1에 value1, key2에 value2등을 저장한 리스트다.
(x <- list(name="foo", height=70))

# 이때 각 값이 반드시 스칼라일 필요는 없다. 다음처럼 벡터를 저장할 수도 있다.
(x <- list(name="foo", height=c(1,3,5)))

# 이처럼 리스트에는 다양한 값을 혼합해서 저장할 수 있다. 따라서 리스트 안에 리스트를 중첩하는 일도 가능하다.
list(a = list(val=c(1, 2, 3)), b = list(val = c(1, 2, 3, 4)))

# 리스트 데이터 접근
# 리스트에 저장된 데이터는 색인 또는 키를 사용해 접근할 수 있다.
# x$key: 리스트 x 에서 키 값 key에 해당하는 값
# x[n]: 리스트 x에서 n번째 데이터의 서브리스트
# x[[n]]: 리스트 x에서 n번째 저장된 값

# 앞에서 살펴본 것처럼 리스트를 출력해보면 '$키' 형태로 각 키가 나열된다.
# 데이터는 'x$key' 형태로 접근한다. 또는 각 요소를 순서대로 x[[n]] 형태로 접근할 수도 있다.
x <- list(name="foo", height=c(1,3,5))
x$name
x$height
x[[1]]
x[[2]]

# x[[n]]과 달리 x[n]형태는 각 값이 아니라 '(키, 값)'을 담고 있는 서브리스트를 반환한다.
# 예를 들어, 다음 코드를 보자.
x[1]	# x[1]은 (name, "foo")를 담고 있는 리스트다.
x[2]
