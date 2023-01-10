#! okss_004_004_dist.py
#
#!-*-coding: utf-8-*-
#

from difflib import ndiff
from tqdm import tqdm 

def lv_align(str1, str2):
	result = ""
	pos, removed = 0, 0
	
	for x in ndiff(str1, str2):
		if pos < len(str1) and str1[pos] == x[2]:
			pos += 1
			result += x[2]
			if x[0] == "-":
				removed += 1
			continue
		else:
			if removed > 0:
				removed -= 1
			else:
				result += "-"
	#print(result)
	return result

def lv_align_max(str1, str2):
	res01 = lv_align(str1, str2)
	res02 = lv_align(str2, str1)
	
	len01 = len(res01)
	len02 = len(res02)
	
	if (len01 > len02):
		return res01
	
	return res02



def lv_dist(s, t):
	
	if len(s) == 0:
		return len(t)
		
	if len(t) == 0:
		return len(s)
		
	dist = iterative_levenshtein(s, t)
	
	return dist

def iterative_levenshtein(s, t):
	
	rows = len(s) + 1
	cols = len(t) + 1
	dist = [ [0 for x in range(cols)] for x in range(rows)]
	
	# source prefixed can be transformed into empty strings
	# by deletions:
	
	for i in range(1, rows):
		dist[i][0] = i
		
	# target prefixes can be created from an empty source string
	# by inserting the characters
	
	for i in range(1, cols):
		dist[0][i] = i
		
	for col in range(1, cols):
		for row in range(1, rows):
			if s[row-1] == t[col-1]:
				cost = 0
			else:
				cost = 1
			dist[row][col] = min(dist[row-1][col] + 1,     # deletion
					dist[row][col-1] + 1,          # insertion
					dist[row-1][col-1] + cost)   # substitution
					
	#for r in range(rows):
	#	print(dist[r])
		
	return dist[row][col]
	

if __name__ == "__main__":

	f_out = open("okss_004_004_dist.txt", "w", encoding="utf-8")
	
	
	with open("okss_004_003.txt", "r", encoding="utf-8") as f_in:
		m_lines = f_in.readlines()
		for bline in tqdm(m_lines):
			bline = bline.strip("\n")
			cur_data = bline.split("\t")

			str_src = cur_data[1]
			str_target = cur_data[3]
			bsrc = cur_data[0]
			btarget = cur_data[2]
			res_lv = lv_align_max(str_src, str_target)
			lv_distval = lv_dist(str_src, str_target)
			

			str_out = "\t".join([bsrc, btarget, str(len(res_lv)), str(lv_distval) ])
			f_out.write(str_out)
			f_out.write("\n")
	
	f_out.close()
	