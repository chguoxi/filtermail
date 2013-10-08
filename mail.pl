#!E:\goss\project\perl\mail
#主程序入口

#syswrite(READERME,"This is my write file contents\n");

use File::Basename;


my $source = 'emails';

my $dest = 'emails';

my @files = glob "$source/*.txt";

open MAIL,">mails/".time().".txt";
#邮箱个数
my $count = 0;

foreach my $files(@files){
	$user_file = open USERINFO,$files;
	
	#($name,$path,$suffix) = fileparse($files,@suffixlist);
	
	while(my $uf = <USERINFO>){
		my @email = $uf=~m/.*?(\w+\@\w+\.\w+).*?/i;
		if($count>0 && $count%10000000==0){
			close MAIL;
			open MAIL,">mails/".time().".txt";
		}
		if(@email){
			syswrite(MAIL,"@email[0]\r\n");
			print "@email[0]\r\n";
			$count ++;
		}
		undef $uf;
	}

}
close USERINFO;
close MAIL;

