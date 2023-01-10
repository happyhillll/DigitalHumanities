#
# seq_align_to_html.awk
#
#

BEGIN {
	FS = "\t";
	OFS = "\t";

	print "<html>";
	print "<head>";
	print "", "<link rel=\"stylesheet\" type=\"text/css\" href=\"./seq_align.css\">";
	print "</head>";
	print "<body>";

	#SPACE_REPLACE = "▒";
	SPACE_REPLACE = "□";
	#SPACE_REPLACE = "&nbsp;" ;
	
	arrOP["i"] = "ｉ";
	arrOP["d"] = "ｄ";
	arrOP["s"] = "ｓ";

}
{
	$0 = gensub(/[\n\r]+$/, "", "g", $0);
}
($1 == "#seqpair") {
	printf("<div class=\"divTable seqPairHead\">\n");
	printf("\t"); printf("<div class=\"divTableHeading\">\n");
	printf("\t\t"); printf("<div class=\"tblHeadRowGroup\">\n");
	printf("\t\t\t<div class=\"tblHeadRow\">\n");
	printf("\t\t\t\t"); printf("<div class=\"tbl_hc_srcid\">src-id</div>\n");
	printf("\t\t\t\t"); printf("<div class=\"tbl_hc_targetid\">target-id</div>\n");
	printf("\t\t\t\t"); printf("<div class=\"tbl_hc_pcode\">pcode</div>\n");
	printf("\t\t\t\t"); printf("<div class=\"tbl_hc_pserial\">pserial</div>\n");
	printf("\t\t\t\t"); printf("<div class=\"tbl_hc_ctype\">ctype</div>\n");
	printf("\t\t\t\t"); printf("<div class=\"tbl_hc_src\">src</div>\n");
	printf("\t\t\t\t"); printf("<div class=\"tbl_hc_target\">target</div>\n");
	printf("\t\t\t"); printf("</div>\n");
	printf("\t\t</div>\n");	
	printf("\t"); printf("</div>\n");

	printf("\t"); printf("<div class=\"divTableBody\">\n");
	printf("\t\t"); printf("<div class=\"divTableRowGroup\">\n");
	printf("\t\t\t"); printf("<div class=\"divTableRow\">\n");
	printf("\t\t\t\t"); printf("<div class=\"tbl_cell_srcid\">%s</div>\n", $2);
	printf("\t\t\t\t"); printf("<div class=\"tbl_cell_targetid\">%s</div>\n", $8);
	printf("\t\t\t\t"); printf("<div class=\"tbl_cell_pcode\">%s</div>\n", $4);
	printf("\t\t\t\t"); printf("<div class=\"tbl_cell_pserial\">%s</div>\n", $5);
	printf("\t\t\t\t"); printf("<div class=\"tbl_cell_ctype\">%s</div>\n", $6);
	printf("\t\t\t\t"); printf("<div class=\"tbl_cell_src\">%s</div>\n", $7);
	printf("\t\t\t\t"); printf("<div class=\"tbl_cell_target\">%s</div>\n", $13);
	printf("\t\t\t"); printf("</div>\n");
	printf("\t\t"); printf("</div>\n");

	printf("\t"); printf("</div>\n");
	printf("</div>\n");
}

($1 == "#seqsrc") {

	print "<div class=\"alignTblSrc\">";
	printf("\t"); printf("<div class=\"alignSrcRowGroup\">\n");
	printf("\t\t"); printf("<div class=\"divSrcRow\">\n");
	for (i = 2; i <= NF; i++)
	{
		if ($i ~ /^[ ]+$/)
			$i = SPACE_REPLACE;
		printf("\t\t\t"); printf("<div class=\"divSrcCell\">%s</div>\n", $i);
	}
	printf("\t\t"); printf("</div>\n");
	printf("\t"); printf("</div>\n");
	print "</div>";
}
($1 == "#seqtar") {
	print "<div class=\"alignTblTarget\">";
	printf("\t"); printf("<div class=\"alignTargetRowGroup\">\n");
	printf("\t\t"); printf("<div class=\"divTargetRow\">\n");
	for (i = 2; i <= NF; i++)
	{
		if ($i ~ /^[ ]+$/)
			$i = SPACE_REPLACE;
		printf("\t\t\t"); printf("<div class=\"divTargetCell\">%s</div>\n", $i);
	}
	printf("\t\t"); printf("</div>\n");
	printf("\t"); printf("</div>\n");
	print "</div>";
}
($1 == "#seqopr") {
	print "<div class=\"divTblSrc\">";
	printf("\t"); printf("<div class=\"divOpRow\">\n");
	for (i = 2; i <= NF; i++)
	{
		if ($i ~ /^[ ]+$/)
		{
			$i = SPACE_REPLACE;
			#$i = "&#12288;";
		}

		if ($i == "d" || $i == "i" || $i == "s")
		{
			str_op = arrOP[$i];
			printf("\t\t"); printf("<div class=\"divOpCellNB\">%s</div>\n", str_op);
		}
		else
		{
			printf("\t\t"); printf("<div class=\"divOpCell\">%s</div>\n", $i);
		}
	}
	printf("\t"); printf("</div>\n");
	print "</div>";
}

END {
	print "</body>";
	print "</html>";
}

