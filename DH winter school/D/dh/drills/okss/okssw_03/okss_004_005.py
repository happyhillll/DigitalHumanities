#!python
#
#!-*-coding=utf-8-*-
#
# okss_004_005.py

from tqdm import tqdm

if __name__ == "__main__":
    
    with open("okss_004_004_dist.txt", "r", encoding="utf-8") as f_in:
        m_lines = [l.strip() for l in f_in.readlines()]        

        with open("okss_004_005.txt", "w", encoding="utf-8") as f_out:

            for line in tqdm(m_lines):
                cur_line = line.split('\t')

                d_n = int(cur_line[3])  # numerator(분자)
                d_d = int(cur_line[2])  # denominator(분모)
                d_val = 1 if d_n == 0 or d_d == 0 else (d_n / d_d)
                print(cur_line[0], cur_line[1], d_d, d_n, d_val, 
                    file=f_out, sep="\t")


