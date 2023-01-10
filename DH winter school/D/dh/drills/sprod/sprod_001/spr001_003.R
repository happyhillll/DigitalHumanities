#
# spr001_003.R
#

rm(list=ls())
CBSH = c('��������/N', '���길�к�����/N', '��/V', '������/N', '����/N', '��/N', '�������/N', '���ܳ�/V', '����/V', '����/V', '��/N', '����/N', '����/N', '�ְ���/N', '���/N', '�/V', '�ռұ�/N', '�����/N', '��/N', '������/N', '�����µ�/N', '���밡��/N', '����/N', '������/N', '����/N', 'Ÿ/V') 
CJJB = c('��������/N', '���½�/N', '�ݰ�����/N', '���/N', '��/V', '��/N', '����/N', '����/N', '���ڼ���/N', '�������/N', '����/N', '��/V', '���/N', '���ȣ��/N', '����/N', '�ǰ�����/N', '��/V', '����/N', '����/N', '�¿캸��/N', '�ּ�����/N', '����/N', '��/V', '���/N', '�帣/V') 
CJKS = c('��������/N', '���길�к�����/N', '�ݰ�Ȱ�̾ƹ̼�/N', '��/V', '������/N', '����/N', '��/N', '�������/N', '����/V', '����/N', '��/N', '����/N', '����/N', '����/N', '�ְ���/N', '��߰�/N', '�/V', '�ռұ�/N', '�����/N', '������/N', '���밡��/N', '��/N', '����/N', '������/N', '����/N', 'Ÿ/V', '�¾/V', 'ȣ���µ�/N', 'ȯ��/N') 
CJSH = c('������/B', '���չ�/N', '��/V', '����/N', '���ϰ���/N', '������/N', '�����/V', '��汹/N', '��/N', '�������/N', '���/V', '������/N', '�������/N', '��/N', '��/N', '����/N', '�ƴ�/B', '�/V', '����/N', '�ϻ�/N', '��/V', '������/N', '������/N', '���/N', '��/V', 'ȣ���µ�/N') 
CKSH = c('��������/N', '���길�к�����/N', '�ݰ�Ȱ�̾ƹ̼�/N', '��/V', '������/N', '����/N', '��/N', '�������/N', '����/V', '����/N', '��/N', '����/N', '����/N', '����/N', '�ְ���/N', '��߰�/N', '�/V', '�ռұ�/N', '�����/N', '������/N', '���밡��/N', '��/N', '����/N', '������/N', '����/N', 'Ÿ/V', '�¾/V', 'ȣ���µ�/N', 'ȯ��/N') 
CKYR = c('�������/N', '����/N', '��/N') 
CKYS = c('��������/N', '���길�к�����/N', '�ݰ�Ȱ�̾ƹ̼�/N', '��/V', '������/N', '��/N', '����/N', '�������/N', '���ܳ�/V', '����/V', '��/N', '����/N', '�İܳ�/N', '�/V', '��������/N', '�ռұ�/N', '�츮����/N', '������/N', '���밡��/N', '��/N', '������/N', '����/N', 'Ÿ/V', 'ȣ���µ�/N', 'ȯ��/N') 
CLSU = c('��������/N', '��/V', '��/N', '��/N', '����/N', '����/N', '�Ƶ���/N', '����/N', '�������/N', '����/N', '����/N', '��/V', '�ڰ���/B', '���Ƿ�/B', '���/N', '��������/N', 'ȫ����ǳ/N') 
CPBS = c('��������/N', '���½�/N', '�ݰ�����/N', '���/N', '��/V', '��ȭ/N', '����/N', '���ڼ���/N', '�������/N', '����/N', '��/V', '���/N', '���ȣ��/N', '��/V', '����/N', '����/N', '����/N', '��/V', '���/N', '�帣/V') 

# CJKS, CKYS 
# CBSH, CKSH
# CJJB, CPBS

# #########################
# Sample 01: sim 0 == dist 1
# #########################

intersect(CBSH, CJJB) #������ ������ ���ϱ�
union(CBSH, CJJB) #������ ���ϱ�
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