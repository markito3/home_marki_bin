#!/usr/local/bin/perl
#
# author:   Jorgo Bakker, BSC
#
# patch on: more than 2 \input{file} statements in LaTex documents produces 
#           infinite loop in latex2html.
#
# usage:    l2hpatch < LatexDocument > patchedLatexDocument
#
#           where the latter is the patched document that can be handled by
#           latex2html
$tabber = 1;
print STDERR "l2hpatch - 1.0 patch for latex2html latex2html 98.1p1\n";


&documentSearch(\*STDIN);

print STDERR "\n";
exit;


#------------------------------------------------------------------------------
# search current LaTeX document for include files....
sub documentSearch{
    my ($filehandle) = @_;
    my ($pre,$file,$post);

    while (<$filehandle>)
    {
	if (/^[^\%]*\\(input|include)\s*\{\s*([^\}]*)\s*\}/)
	{
	    ($pre,$file,$post) = ($`,$2,$');
	    if ($pre) {print STDOUT "$pre\n";}

	    &documentInline($file);

	    if ($post) {print STDOUT "$post";}
	}
	else
	{
	    print STDOUT "$_";
	}
	
    }
}

# recursively opens included LaTeX files
sub documentInline{
    my ($file) = @_;
    local (*FILE);
        
    open(FILE,&documentLocate($file)) || die "could not open file '$file'\n";
    print STDOUT "\%//begin including\{$file\}\n";
    print STDERR "   " x $tabber++ . "including $file...\n";    

    &documentSearch(\*FILE);    

    $tabber--;
    print STDOUT "\%//end including\{$file\}\n";
    close(FILE);
}

sub documentLocate{
    my ($file) = @_;
    my ($here);
    my (@path) = split(":",$ENV{"TEXINPUTS"});

    unshift(@path,".");
    while ( $here = shift(@path) ) {
	
	$here .= "/".$file;
	if (-e $here) {last;}

	$here .= ".tex";
	if (-e $here) {last;}

	undef $here;
    }

    $here || die "could not find $file!\n";

    $here;
}
