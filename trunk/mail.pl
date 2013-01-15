#!E:\goss\project\perl\mail
#主程序入口

#syswrite(READERME,"This is my write file contents\n");

use File::Basename;


my $source = 'source-mails';

my $dest = 'emails';

my @files = glob "$source/*";

foreach my $files(@files){
	$user_file = open USERINFO,$files;
	($name,$path,$suffix) = fileparse($files,@suffixlist);
	
	$mail_file = open MAIL,">$dest/$name.$suffix";
	
	while(<USERINFO>){
		@line = split /\s+/, <USERINFO>;
		foreach $line(@line){
			if($line=~/[\w]+@[\w]+\.[\w]+/i){
				syswrite(MAIL,"$line\r\n");
			}
			print $line;
		}
		
		
	}
	close USERINFO;
	close MAIL;
	
}

