/* Trivial password generator for cvs.  Compile with 'cc -o cvspasswd cvspasswd.c -lcrypt' */
#include <unistd.h>       
#include <stdio.h>
#include <sys/times.h>

/* Generate a single character of salt given a random integer.  See 'man crypt'. */
int base64(int x)
{
	const char b64[64] = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz./";
	return b64[x % 64];
}

int main(int argc, char **argv)
{
	char ibuf[256];
	char passwd[256];
	char saltstr[3];
	struct tms t;

	if (argc != 2) {
		fprintf(stderr, "Usage: cvspasswd username\n");
		exit(1);
	}
	fprintf(stderr, "Password for %s: ", argv[1]);
	ibuf[0] = 0;
	fgets(ibuf, sizeof(ibuf), stdin);
	sscanf(ibuf, "%s", passwd);
	saltstr[0] = base64(times(&t));
	saltstr[1] = base64(time(0));
	saltstr[2] = 0;
	
	printf("%s:%s:cvsuser\n", argv[1], crypt(passwd, saltstr));
	exit(0);
}
	
