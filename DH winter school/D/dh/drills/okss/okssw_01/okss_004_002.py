#!python
#
# okss_004_002.py
#


if __name__ == "__main__":

    # File reading
    with open("okss_004_001.txt", "r", encoding="utf-8") as f_in:
        m_lines = [l.strip() for l in f_in.readlines()]

    #print(len(m_lines))

    m_pairs = []
    for idx_i in range(len(m_lines)):
        list_cur_i = m_lines[idx_i].split('#')
        str_cno_i = list_cur_i[2]

        for idx_j in range(idx_i+1, len(m_lines)):            
            list_cur_j = m_lines[idx_j].split('#')
            str_cno_j = list_cur_j[2]

            if str_cno_i == str_cno_j:
                m_pairs.append( [m_lines[idx_i], m_lines[idx_j]] )

    #print(len(m_pairs))

    # Tab으로 분리된 텍스트로 비교 대상 쌍을 출력
    with open("okss_004_002.txt", "w", encoding="utf-8") as f_out:
        for elt in m_pairs:
            str_left = '\t'.join(elt[0].split('#'))
            str_right = '\t'.join(elt[1].split('#'))
            print(str_left, str_right, sep='\t', file=f_out)
