#
# okss_work_006_01.R
#
#

# ###################################################
# install.packages("MASS", "graphics", "ape", "rgl")
# ###################################################

library(MASS)
library(graphics)
library(ape)
library(rgl)


# ##########################
# Set working directory
# ##########################
working_dir = "/Users/minjikim/D/dh/drills/okss/okssw_04" #워킹디렉토리에 저장
setwd(working_dir) 

data <- read.table("okss_004_007.txt", 
                   header=TRUE, encoding="utf-8")

#
# Classical MDS
#
data.matrix <- as.matrix(data)
head(data.matrix)

data.mds2 <- cmdscale(data.matrix, k=2)
head(data.mds2)

data.mds3 <- cmdscale(data.matrix, k=3)
head(data.mds3,n=10)

x <- data.mds2[, 1] #1번 칼럼 x에 저장
x
y <- data.mds2[, 2] #2번 칼럼 y에 저장
y
plot(x, y, main="OKSS distance plot") #플롯 만들기
grid() #가이드 그려줌

x <- data.mds3[, 1]
y <- data.mds3[, 2]
z <- data.mds3[, 3]

# ####################
# rgl 3d mapping
# ####################

plot3d(x, y, z, type='p')

# #####################
# Hierarchical Clustering
# 나무 그림 그려주기
# #####################

data.dist <- as.dist(data.matrix) #change matrix to dist
data.dist
hc <- hclust(data.dist, 'ave')
hc #작품 36개 
plot(hc, cex=.85)

#왼쪽 그룹과 오른쪽 그룹의 변이도가 많이 다름

# #####################
# Unrooted Tree : 루트 없는 걸 뽑게 되면, 유사도가 더 잘 보임
# #####################

tr <- as.phylo(hc)
plot(tr, type="u", cex=.45)


# #####################
# HClust cutting
# #####################

plot(hc, hang=-1, cex=.8)
rect.hclust(hc, k=3)

plot(hc, hang=-1, cex=.8)
rect.hclust(hc, k=6)


