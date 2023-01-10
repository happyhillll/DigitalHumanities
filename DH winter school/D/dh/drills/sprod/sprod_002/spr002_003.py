#!python
#
#!-*-coding=utf-8-*-
#
# okss_004_007.py > spr002_003.py
#

from tqdm import tqdm

if __name__ == "__main__":

    with open("spr002_002.txt", "r", encoding="utf-8") as f_in:
        m_lines = [l.strip() for l in f_in.readlines()]

        dic_book_code = {}
        # 작품 ID 구하기
        print("Preprocessing book codes.")
        for line in tqdm(m_lines):

            cur_elts = line.split("\t")
            if cur_elts[0] in dic_book_code.keys():                
                dic_book_code[cur_elts[0]] += 1
            else:
                dic_book_code[cur_elts[0]] = 1

            if cur_elts[1] in dic_book_code.keys():
                dic_book_code[cur_elts[1]] += 1
            else:
                dic_book_code[cur_elts[1]] = 1
        
        tbl_size = len(dic_book_code.keys())
        tbl_dist = [ [0] * tbl_size for _ in range(tbl_size)]
        list_keys = list(dic_book_code.keys())
        
        for idx_i in range(len(list_keys)):
            dic_book_code[list_keys[idx_i]] = idx_i   
            

        # Table Index 안에 값 채워 넣기.
        print("\nFilling the distance values into the matrix.")
        for line in tqdm(m_lines):
            cur_elts = line.split("\t")
            elt_01 = cur_elts[0]
            elt_02 = cur_elts[1]
            elt_dist = 1 - float(cur_elts[2])
            idx_01 = dic_book_code[elt_01]
            idx_02 = dic_book_code[elt_02]
            tbl_dist[idx_01][idx_02] = elt_dist
            tbl_dist[idx_02][idx_01] = elt_dist

        # Table 출력하기
        print("\nPrinting the table to the output file.")

        with open("spr002_003.txt", "w", encoding="utf-8") as f_out:
            # Header 출력
            str_header = '\t'.join(list_keys)
            print("", str_header, sep="\t", file=f_out)
            for idx_i in tqdm(range(len(tbl_dist))):
                list_line = list(map(str, tbl_dist[idx_i]))
                str_key = list_keys[idx_i]
                str_line = "\t".join(list_line)
                print(str_key, str_line, sep="\t", file=f_out)
