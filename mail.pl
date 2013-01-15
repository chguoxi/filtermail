#!E:\goss\project\perl\mail
#主程序入口

#syswrite(READERME,"This is my write file contents\n");

use File::Basename;


my $source = 'source-mails';

my $dest = 'emails';

my @files = glob "$source/*.txt";

foreach my $files(@files){
	$user_file = open USERINFO,$files;
	
	($name,$path,$suffix) = fileparse($files,@suffixlist);
	
	open MAIL,">$dest/$name.$suffix";
	
	while(<USERINFO>){
		~ m/.*?(\w+\@\w+\.\w+).*?/i;
		if($1){
			syswrite(MAIL,"$1\r\n");
			print "$1\r\n";
		}
	}

}
close USERINFO;
close MAIL;

