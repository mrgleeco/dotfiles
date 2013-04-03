#!/usr/bin/env perl

# keep list of vim repos we care to use
my $repo = [
	"git://github.com/Raimondi/delimitMate.git",
	"git://github.com/Lokaltog/vim-powerline.git",
	"git://github.com/Shougo/neocomplcache.git",
	"git://github.com/acustodioo/vim-tmux.git",
	"git://github.com/brookhong/DBGPavim.git",
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
	"git://github.com/nanotech/jellybeans.vim.git",
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
];

-d './bundle' or print qx{ mkdir -p ./bundle };

for my $r(@$repo){
    $r =~ m@.*/(.*?).git$@ or next;
    -d $1   and next;
    my $cmd = qq{ cd ./bundle && git clone $r };
    print "CMD>>  $cmd \n";
    print qx{ $cmd };
}



###############
=cut
my $vim_org_scripts = [
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
