#!python
#
#-*-coding=utf-8
#
# okss_004_003.py
#


if __name__ == "__main__":

    with open("okss_004_002.txt", "r", encoding="utf-8") as f_in:
        m_lines = [l.strip('\n') for l in f_in.readlines()]
        m_lines_out = []
        with open("okss_004_003.txt", "w", encoding="utf-8") as f_out:
            for line in m_lines:
                cur_line = line.split('\t')                
                if len(cur_line) < 12:
                    list_elt = [cur_line[0], cur_line[5], cur_line[6], ""]
                else:
                    list_elt = [cur_line[0], cur_line[5], cur_line[6], cur_line[11]]
                
                print('\t'.join(list_elt), file=f_out)



