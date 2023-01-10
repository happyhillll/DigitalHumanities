#! lv_test.py
#
#!-*-coding: utf-8-*-
#

from difflib import ndiff

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
	return result

def lv_align_max(str1, str2):
	res01 = lv_align(str1, str2)
	res02 = lv_align(str2, str1)
	
	len01 = len(res01)
	len02 = len(res02)
	
	if (len01 > len02):
		return res01
	
	return res02


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

	return dist[row][col]
	

if __name__ == "__main__":
	
	"""
	str01 = "Korean"
	str02 = "Koreaa"	
	print("Distance: ", iterative_levenshtein(str01, str02), sep="\t")
	res01 = lv_align("Korea", "Koreea")
	res02 = lv_align("Koreea", "Korea")
	print(len(res01), res01)
	print(len(res02), res02)
	print("*" * 80)
	"""
	
	"""
	str01 = "橘屬木從登聲"
	str02 = "橘屬从木登聲"
	print("Distance: ", iterative_levenshtein(str01, str02), sep="\t")
	res01 = lv_align(str01, str02)
	res02 = lv_align(str02, str01)
	print(len(res01), res01)
	print(len(res02), res02)
	print("*" * 80)
	"""
	
	
	
	str01 = "與之相狎恩情之篤如山如海"
	str02 = "與之相狎恩情如山女如海"
	print("Distance: ", iterative_levenshtein(str01, str02), sep="\t")
	res01 = lv_align(str01, str02)
	res02 = lv_align(str02, str01)
	print(len(res01), res01)
	print(len(res02), res02)
	
