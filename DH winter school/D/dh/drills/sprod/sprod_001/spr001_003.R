#
# spr001_003.R
#

rm(list=ls())
CBSH = c('강산정기/N', '군산만학부형문/N', '나/V', '남원부/N', '녹주/N', '동/N', '산수정기/N', '생겨나/V', '생기/V', '생하/V', '서/N', '서시/N', '수려/N', '쌍각산/N', '약야/N', '어리/V', '왕소군/N', '저라산/N', '적/N', '적성강/N', '전라좌도/N', '절대가인/N', '종출/N', '지리산/N', '춘향/N', '타/V') 
CJJB = c('간성지장/N', '계계승승/N', '금고옥촉/N', '기운/N', '남/V', '덕/N', '버금/N', '산하/N', '성자성손/N', '숙종대왕/N', '시절/N', '없/V', '요순/N', '용양호위/N', '우탕/N', '의관문물/N', '있/V', '조정/N', '존비/N', '좌우보필/N', '주석지신/N', '즉위/N', '피/V', '향곡/N', '흐르/V') 
CJKS = c('강산정기/N', '군산만학부형문/N', '금강활이아미수/N', '나/V', '남원부/N', '녹주/N', '동/N', '산수정기/N', '생기/V', '생장/N', '서/N', '서시/N', '설도/N', '수려/N', '쌍각산/N', '약야계/N', '어리/V', '왕소군/N', '저라산/N', '적성강/N', '절대가인/N', '제/N', '종출/N', '지리산/N', '춘향/N', '타/V', '태어나/V', '호남좌도/N', '환출/N') 
CJSH = c('곳곳이/B', '관왕묘/N', '나/V', '남녀/N', '남북강성/N', '남원부/N', '당당하/V', '대방국/N', '동/N', '만고충신/N', '모시/V', '북통운암/N', '산수정기/N', '서/N', '수/N', '승지/N', '아니/B', '어리/V', '옛날/N', '일색/N', '있/V', '적성강/N', '지리산/N', '충렬/N', '하/V', '호남좌도/N') 
CKSH = c('강산정기/N', '군산만학부형문/N', '금강활이아미수/N', '나/V', '남원부/N', '녹주/N', '동/N', '산수정기/N', '생기/V', '생장/N', '서/N', '서시/N', '설도/N', '수려/N', '쌍각산/N', '약야계/N', '어리/V', '왕소군/N', '저라산/N', '적성강/N', '절대가인/N', '제/N', '종출/N', '지리산/N', '춘향/N', '타/V', '태어나/V', '호남좌도/N', '환출/N') 
CKYR = c('숙종대왕/N', '즉위/N', '초/N') 
CKYS = c('강산정기/N', '군산만학부형문/N', '금강활이아미수/N', '나/V', '남원부/N', '동/N', '문군/N', '산수정기/N', '생겨나/V', '생기/V', '서/N', '설도/N', '셍겨나/N', '어리/V', '영웅열사/N', '왕소군/N', '우리나라/N', '적성강/N', '절대가인/N', '제/N', '지리산/N', '춘향/N', '타/V', '호남좌도/N', '환생/N') 
CLSU = c('고요직설/N', '나/V', '때/N', '법/N', '숙종/N', '시절/N', '아동국/N', '여상/N', '요순시절/N', '은주/N', '이윤/N', '있/V', '자고로/B', '진실로/B', '충신/N', '현성지국/N', '홍모우순풍/N') 
CPBS = c('간성지장/N', '계계승승/N', '금고옥촉/N', '기운/N', '남/V', '덕화/N', '산하/N', '성자성손/N', '숙종대왕/N', '시절/N', '없/V', '요순/N', '용왕호위/N', '있/V', '조정/N', '존비/N', '즉위/N', '피/V', '향곡/N', '흐르/V') 

# CJKS, CKYS 
# CBSH, CKSH
# CJJB, CPBS

# #########################
# Sample 01: sim 0 == dist 1
# #########################

intersect(CBSH, CJJB) #데이터 교집합 구하기
union(CBSH, CJJB) #합집합 구하기
length(intersect(CBSH, CJJB))
length(union(CBSH, CJJB))
jac_sim = length(intersect(CBSH, CJJB)) / length(union(CBSH, CJJB))
jac_sim


# ##########################
# Sample 02: sim 1 == dist 0
# ##########################
intersect(CJKS, CKSH)
length(intersect(CJKS, CKSH))
union(CJKS, CKSH)
length(union(CJKS, CKSH))
jac_sim = length(intersect(CJKS, CKSH)) / length(union(CJKS, CKSH))
jac_sim

# ##########################
# Sample 03: sim = 0.5428571
# ##########################
intersect(CJKS, CKYS)
length(intersect(CJKS, CKYS))
union(CJKS, CKYS)
length(union(CJKS, CKYS))
jac_sim = length(intersect(CJKS, CKYS)) / length(union(CJKS, CKYS))
jac_sim
#54%
jac_dist = 1 - jac_sim
jac_dist
#0.4571

# CBSH, CKSH
# CJJB, CPBS

intersect(CBSH, CKSH)
length(intersect(CBSH, CKSH))
union(CBSH, CKSH)
length(union(CBSH, CKSH))
jac_sim= length(intersect(CBSH, CKSH))/ length(union(CBSH, CKSH))
jac_sim
#61%

intersect(CJJB, CPBS)
length(intersect(CJJB, CPBS))
union(CJJB, CPBS)
length(union(CJJB, CPBS))
jac_sim= length(intersect(CJJB, CPBS))/ length(union(CJJB, CPBS))
jac_sim
#66%