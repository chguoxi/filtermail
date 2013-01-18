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
		@email = $_=~ m/.*?(\w+\@\w+\.\w+).*?/i;
		if( @email and @email ne $last ){
			syswrite(MAIL,"@email[0]\r\n");
			print "@email[0]\r\n";
			$last = @email[0];
			undef @email;
		}
	}

}
close USERINFO;
close MAIL;

