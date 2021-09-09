#include <unistd.h>
#include <stdio.h>
#include <string.h>
#include <arpa/inet.h>
#include <sys/socket.h>

#define PORT 9001

char buffer[BUFSIZ] = "20170660, 김동현, 안녕하세요\n";
int main(void){
	int s_socket, c_socket;
	struct sockaddr_in s_addr, c_addr;
	int len;
	int n;
	s_socket = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);

	memset(&s_addr, 0, sizeof(s_addr));
	s_addr.sin_addr.s_addr = htonl(INADDR_ANY);
	s_addr.sin_family = AF_INET;
	s_addr.sin_port = htons(PORT);

	if(bind(s_socket, (struct sockaddr *)&s_addr, sizeof(s_addr)) == -1){
		printf("Can not Bind\n");
		return -1;
	}

	if(listen(s_socket, 5) == -1){
		printf("listen Fail\n");
		return -1;
	}

	while(1){
		printf("Server waiting...\n");
		len = sizeof(c_addr);
		c_socket = accept(s_socket, (struct sockaddr*)&c_addr, &len);
		printf("Connected IP : %s\n", inet_ntoa(c_addr.sin_addr));

		n = strlen(buffer);
		write(c_socket, buffer, n);

		close(c_socket);
	}
	close(s_socket);
	return 0;
}
