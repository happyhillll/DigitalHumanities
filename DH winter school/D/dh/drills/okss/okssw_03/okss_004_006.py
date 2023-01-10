#!python
#
#!-*-coding=utf-8-*-
#
#

from tqdm import tqdm 
from decimal import Decimal

if __name__ == "__main__":
    
    with open("okss_004_005.txt", "r", encoding="utf-8") as f_in:
        m_lines = [l.strip() for l in f_in.readlines()]

    print("Aggregating data values...")

    # Constructing values dictionary
    dic_agg_dist = {}
    for line in tqdm(m_lines):
        cur_elt = line.split('\t')
        cur_key = cur_elt[0] + "_" + cur_elt[1]
        if cur_key in dic_agg_dist.keys():
            cur_val = dic_agg_dist[cur_key]
            cur_val = cur_val + float(cur_elt[4])
            dic_agg_dist[cur_key] = cur_val
        else:
            cur_val = float(cur_elt[4])
            dic_agg_dist[cur_key] = cur_val
    

    print("Writing Distance values...")
    with open("okss_004_006.txt", "w", encoding="utf-8") as f_out:
        for k, v in tqdm(dic_agg_dist.items()):
            cur_elt = k.split('_')
            if Decimal(v) == Decimal(0):
                v = 0.00000001
            print(cur_elt[0], cur_elt[1], v, sep="\t", file=f_out)
