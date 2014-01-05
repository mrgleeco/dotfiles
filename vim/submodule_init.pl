#!/usr/bin/env perl


use strict;
use warnings;


my %Repo = ();

# TODO - get rid of all the github stuff?  download the files proper? 
# TODO - colors is going in to subdir 
$Repo{colors} =  [
	"git://github.com/nanotech/jellybeans.vim.git",
	"git://github.com/Lokaltog/vim-distinguished.git",
	"git://github.com/altercation/vim-colors-solarized.git"
];


# keep list of vim repos we care to use
$Repo{bundle} =  [
	"git://github.com/Raimondi/delimitMate.git",
    "git://github.com/bling/vim-airline.git",
	"git://github.com/Shougo/neocomplcache.git",
	"git://github.com/acustodioo/vim-tmux.git",
	"git://github.com/duff/vim-scratch.git",
	"git://github.com/gmarik/vundle.git",
	"git://github.com/jakar/vim-json.git",
	"git://github.com/jnwhiteh/vim-golang.git",
	"git://github.com/kien/ctrlp.vim.git",
	"git://github.com/majutsushi/tagbar.git",
	"git://github.com/mattn/gist-vim.git",
	"git://github.com/mattn/webapi-vim.git",
	"git://github.com/mileszs/ack.vim.git",
	"git://github.com/mutewinter/nginx.vim.git",
	"git://github.com/nsf/gocode.git",
	"git://github.com/othree/html5.vim.git",
	"git://github.com/pangloss/vim-javascript.git",
	"git://github.com/scrooloose/nerdcommenter.git",
	"git://github.com/scrooloose/nerdtree.git",
	"git://github.com/scrooloose/syntastic.git",
	"git://github.com/tpope/vim-eunuch.git",
	"git://github.com/tpope/vim-fugitive.git",
	"git://github.com/vim-scripts/indenthtml.vim.git",
	"git://github.com/vim-scripts/matchit.zip.git",
	"git://github.com/jamessan/vim-gnupg.git",
];



for my $type ( keys %Repo ) {

	# $type eq 'colors' or next;
	-d "./$type" or print "creating dir ./$type\n",  qx{ mkdir -p ./$type };
	my $repo = $Repo{$type};
	for my $r(@$repo){
		$r =~ m@.*/(.*?).git$@  or next;
		my $d = "./$type/$1";
		( -d $d || -f $d) and next;
		# my $cmd = qq{ git clone $r $d };
		my $cmd = qq{ git clone $r $d };
		print "CMD>>  $cmd \n";
		print qx{ $cmd };
		if ($type eq 'colors'){
			my $sub_cmd = qq! mv $d $d~ && ( find $d~/colors -type f -name "*.vim" -exec mv! . q! {} ! . qq!$type/  \\; ) && rm -rf $d~ !;
			print "CMD>>  $sub_cmd\n";
			print qx{ $sub_cmd };
		}
	}
}



###############
=cut
my $vim_org_scripts = [
  ["listmaps",      "672",  "plugin"],
  ["IndexedSearch", "7062",  "plugin"],
  ["jquery",        "12107", "syntax"],
];

for my $e ( @$vim_org_scripts ){
    my ($n,$id,$type) = @$e;
    print qx{ };
}

vim_org_scripts.each do |name, script_id, script_type|
  puts "downloading #{name}"
  local_file = File.join(name, script_type, "#{name}.vim")
  FileUtils.mkdir_p(File.dirname(local_file))
  File.open(local_file, "w") do |file|
    file << open("http://www.vim.org/scripts/download_script.php?src_id=#{script_id}").read
e

=cut
