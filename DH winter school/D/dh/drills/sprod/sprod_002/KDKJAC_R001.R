#
#

#install.packages("vegan", "amap", "scatterplot3d")

require(ape)
require(MASS)
require(graphics)
require(vegan)
require(amap)
require(scatterplot3d)

options(digits=22)

setwd('/Users/minjikim/Desktop/dh/drills/sprod/sprod_002/')

#김동건
kdkjac = read.table('spr002_003.txt')
kdkjac
#save distance in kdkjac.d
kdkjac.d = as.dist(kdkjac)

#k = dimension 
kdkjac.mds1 = cmdscale(kdkjac.d, k=1)
kdkjac.mds2 = cmdscale(kdkjac.d, k=2)
kdkjac.mds3 = cmdscale(kdkjac.d, k=3)
kdkjac.mds4 = cmdscale(kdkjac.d, k=4)
kdkjac.mds5 = cmdscale(kdkjac.d, k=5)

#2차원 plot
plot(kdkjac.mds2[, 1], kdkjac.mds2[, 2], "p")

######################
# HC (Cophenetic Cor.)
######################

kdk_hc.average = hclust(kdkjac.d, method="average")

#####################################
# Hierarchical Clustering (average method) 계층 군집
#####################################
X11(72, 48) #window-size 늘리기
plot(kdk_hc.average, hang=-1, cex=.8, main="Hierarchical Clustering (average)\nJaccard Similarity (Distance) Index",  sub="", xlab="Work IDs", ylab="Distance (0~1)")


######################
# Clustering 16 clusters
######################

X11(72, 48)
plot(kdk_hc.average, hang=-1, cex=.8, main="Cut into 16 clusters",  sub="", xlab="Work IDs", ylab="Distance (0~1)")
rect.hclust(kdk_hc.average, k=16, border="red") #16개로 나눴을때 이렇게 나눌 수 있겠다.

###########################
#
# Unrooted Tree 
#
###########################

kdk_hc.tree = as.phylo.hclust(kdk_hc.average)
X11(64, 64)
plot(kdk_hc.tree, type="u", cex=0.8, font=3)

########################
# Left-Justified Clade 그냥 나누는 분기점만 레벨 별로 표시해줌
########################
kdk_hc.tree = as.phylo.hclust(kdk_hc.average)
X11(64, 64)
plot(kdk_hc.tree, type="c", use.edge.length=FALSE, direction="l", cex=.8)

