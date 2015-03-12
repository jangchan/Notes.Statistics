### 7.06 상관분석Correlation Analysis

# 상관 분석은 두 확률 변수 사이의 관련성을 파악하는 방법이다. 상관 계수Correlation Coefficient는 
# 두 변수 간 관련성의 정도를 의미하며, 이를 계산하는 방법에는 피어슨 상관 계수, 스피어만 상관 계수,
# 켄달의 순위 상관 계수 등이 있다. 그러나 흔히 상관 계수라고 하면 피어슨 상관 계수를 뜻한다.

# 상관 계수 값이 크면 데이터 간의 관계가 존재한다는 의미며, 보통 한쪽 값이 커질 때 다른 쪽 값이
# 커지는 정도가 크다. 그러나 상관 계수가 크다고 해서 변수 간에 인과관계가 있음을 뜻하지는 않는다.
# A카 커짐에 따라 B가 커지는 것을 보고 A가 B를 야기한다고 판단했으나 실제로는 또 다른 변수 C가 
# A와 B를 동시에 증가시키고 있거나(이를 교략 변수Confounding Variable라고 부름), A가 B의 원인이라고
# 예상했지만 실제로는 B가 A의 원인일 수도 있기 때문이다.

# 두 확률 변수 간에 다음 식이 성립하면 독립Independence이라고 한다.
# P(X,Y) = P(X) x P(Y)	(식7-4)

# 변수가 서로 독립이라면 변수 간에 관련성이 없어 상관 계수가 0이다. 그러나 상관 계수가 0이라고 해서 
# 두 변수가 독립임을 의미하지는 않는다. 변수 간 독립성 확인은 식7.4가 성립합을 살펴보거나 독립성 검정을 
# 사용해 알 수 있다.


### 피어슨 상관 계수
# 피어슨 상관 계수 Pearson Correlation Coefficient는 두 변수 간의 선형적 상관관계를 측정하며 [-1,1] 사이의
# 값을 가진다. 0보다 큰 상관 계수 값은 한 변수가 커지면 다른 변수도 선형적으로 증가함을 뜻하고, 0보다 작은
# 상관 계수는 한 변수가 커지면 다른 변수도 선형적으로 증가함을 뜻하고, 0보다 작은 상관 계수가 1이면 (X,Y)를
# 좌표 평면에 그렸을 때 직선으로 나타난다. 0은 두 변수 간 상관관계가 없음을 뜻한다.

# 피어슨 상관 계수는 선형 관계를 판단하므로 Y = aX + b와 같은 형태의 관계를 잘 찾는다. 반면 Y = aX^2 + b와 
# 같은 비선형 관계에서 Y는 X가 증가함에 따라 값이 커지는 것이 확실하지만 값의 증가 형태가 선형이 아니므로
# 피어슨 상관 계수가 작게 나타날 수 있다.

# 피어슨 상관 계수는 다음과 같이 정의된다.

# p(X,Y) = cov(X,Y) / AxAy
# 식에서 cov(X,Y)는 X,Y의 공분산, Ax,Ay는 X,Y의 표준 편차다.

# <Note> 공분산(Convariance)
# 공분산은 두 확률 변수가 얼마나 함께 변하는지를 측정한다. 한 변수가 커질 때 다른 변수가 커지거나,
# 한 변수가 작아질 때 다른 변수가 작아지는 것과 같이 크기 변화의 방향이 같다면 공분산은 양의 값을 가진다.
# 반대로 한 변수가 커질때 다른 변수가 작아지거나 한 변수가 작아질 때 다른 변수가 커지면 공분산은 음의 값을
# 가진다. 만약 두 변수의 값이 서로 상관없이 움직인다면 공분산은 0이다.

# 피어슨 상관 계수는 cor() 함수를 사용해 계산한다. 이 절에서 사용하는 함수들에 대해 살펴보자 
# cor : 상관 계수를 구한다.
# cor (
#	x, # 숫자 벡터, 행렬, 데이터 프레임
#	y=NULL, # NULL, 벡터, 행렬 또는 데이터 프레임
#	# 계산할 상관 계수의 종류를 지정한다. 피어슨(pearson), 켄달(kendall), 스피어만(spearman)을
#	# 지정할 수 있으며 기본값은 피어슨이다.
#	method=c("pearson", "kendall", "spearman")
# )
# 반환 값은 상관 계수다

# symnum: 숫자를 심볼로 표현한다.
# symnum(
#	x # 숫자 또는 논릿값의 벡터, 배열
# )
# 반환 값은 숫자를 심볼로 표현한 값이다. x가 숫자인 경우 0.3, 0.6, 0.8, 0.9, 0.95를 기준으로 숫자들을
# 공백, 마침표(.), 쉼표(,), 더하기(+), 별표(*), B(B)로 대체해 보여준다. 

# corrgram::corrgram: 상관 계수 행렬을 그림으로 보여준다.
# corrgram::corrgram(
#	x, # 한 행에 한 관측값들이 저장된 데이터 프레임 또는 상관 계수 행렬
#	type=NULL, # x가 데이터일 때 data, 상관 계수일 때 cor을 지정하낟.
#		# 그러나 대부분의 경우 지정하지 않아도 잘 동작한다.
#	# panel에는 각 셀을 표현할 패널, lower.panel, upper.pane은 우측 상단과 좌측 상단에 그릴 패널,
#	# diag.panel, text.panel에는 대각선에 그릴 패널과 문자열 패널을 지정한다.
#	# 대각선 외의 패널에는 panel.pts, panel.pie, panel.shade, panel.bar, panel.ellipse,
#	# panel.conf를 지정할 수 있다. 이들 각각은 패널에 어떤 값들을 보여줄지를 의미한다.
#	# 예를 들어, panel.conf는 값의 신뢰 구간을 보여준다.
#	panel=panel.shade,
#	lower.panel=panel,
#	upper.panel=panel,
#	diag.pane=NULL,
#	text.panel=textPanel)

# 다음은 아이리스 데이터에서 Sepal.Width, Sepal.Length의 피어슨 상관 계수를 구하는 예다.
cor(iris$Sepal.Width, iris$Sepal.Length)

# 아이리스에서 Species를 제외한 모든 컬럼의 피어슨 상관 계수를 구해보자.
cor(iris[,1:4])
symnum(cor(iris[,1:4]))

# corrgram 패키지는 상관 계수를 시각화하는 데 유용하다. 
install.packages("corrgram")
library(corrgram)
corrgram(iris, upper.panel=panel.conf)

# 피어슨 상관 계수는 데이터의 선형 관계 정도를 판단한다. 따라서 Y=X, Y=2X는 모두 선형 관계가 성립하므로
# 피어슨 상관 계수가 1이다. 피어슨 상관 계수에서는 선형 관계가 성립하면 1, 성립하지 않으면 1이 아닌 값을 갖게 된다
cor(1:10, 1:10)
cor(1:10, 1:10*2)

# 반면 비선형 상관관계 Y=X은 선형 상관관계가 아니므로 1보다 작은 값을 가진다
x = 1:10
y = x^3
cor(x, y)

### 스피어만 상관 계수
# 스피어만 상관 계수Separman's Rank Correlation Coefficient는 상관 계수를 계산할 두 데이터의 실제 값 대신
# 두 값의 순위rank를 사용해 상관 계수를 계산하는 방식이다. 피어슨 상관 계수와 마찬가지로 값의 범위는 [-1,1]이며
# 1은 한쪽의 순위가 증가함에 따라 다른 쪽의 순위도 증가함을 뜻하고, -1은 한쪽의 순위가 증가할 때 다른 쪽의 순위는
# 감소함을 뜻한다. 0은 한쪽의 순위 증가가 다른쪽의 순위와 연관이 없음을 뜻한다.

 x <- c(3,4,5,3,2,1,7,5)
# rank() 함수를 사용하기 위해 sort()를 할 필요는 없다. 보기 편하게 하려고 정렬한 것일 뿐이다.
rank(sort(x))

# 다음은 가상의 순위가 저장된 행렬로부터 스피어만 상관계수를 계산한 예다.
(m <- matrix(c(1:10, (1:10)^2), ncol=2))
cor(m, method="spearman")
cor(m, method="pearson")

### 켄달의 순위 상관 계수
# ...



