#
# list_01.awk
#
#

BEGIN {
	FS = "\t";
	OFS = "\t";
}
{
	$0 = gensub(/[\n\r]+$/, "", "g", $0);
	fout_name = gensub(/^[.]+\\pairs_00\\/, "", "g", $0);
	fout_name = gensub(/[.]txt$/, "", "g", fout_name);
	fout_name = sprintf("%s.html", fout_name);
	printf("gawk -f seq_align_to_html.awk %s > %s \n", $0, fout_name);
}
