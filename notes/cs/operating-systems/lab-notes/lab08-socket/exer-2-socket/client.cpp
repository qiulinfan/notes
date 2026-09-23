#include <iostream>
#include <string>
#include <sys/socket.h>
#include <netdb.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <unistd.h>
#include <cstring>
#include <sys/types.h>


static const size_t MAX_MESSAGE_SIZE = 256;

int main(int argc, const char **argv) {
    // Parse command line arguments
    if (argc != 4) {
        std::cout << "Usage: ./client <hostname> <port> <message>\n";
        return(-1);
    }
    const char* hostname = argv[1];
    const char* port = argv[2];
    std::string message(argv[3]);

    std::cout << "Sending " << message << " to " << hostname << ":"
              << port << std::endl;

    // Create a socket.  Use socket().
    int sockfd = socket(AF_INET, SOCK_STREAM, 0); //(IPv4, TCP, auto-select protocol)
    if (sockfd < 0) {
        std::cerr << "Error creating socket: " << strerror(errno) << std::endl;
        return(-1);
    }
    // Create a sockaddr to specify remote host and port.  Use getaddrinfo().
    struct addrinfo hints, *res;
    memset(&hints, 0, sizeof(hints));   // Initialize hints to zero
    hints.ai_family = AF_INET; // IPv4
    hints.ai_socktype = SOCK_STREAM;
    hints.ai_protocol = IPPROTO_IP; // TCP
    int status = getaddrinfo(hostname, port, &hints, &res);
    if (status != 0) {
        std::cerr << "getaddrinfo error: " << gai_strerror(status) << std::endl;
        return(-1);
    }

    // print out our address information
    char ipstr[INET_ADDRSTRLEN];
    struct sockaddr_in *ipv4 = (struct sockaddr_in *)res->ai_addr;
    inet_ntop(res->ai_family, &(ipv4->sin_addr), ipstr, sizeof(ipstr));
    std::cout << "Connecting to " << ipstr << ":" << ntohs(ipv4->sin_port) << std::endl;

    // Connect to remote server.  Use connect().
    if (connect(sockfd, res->ai_addr, res->ai_addrlen) < 0) {
        std::cerr << "Error connecting to server: " << strerror(errno) << std::endl;
        freeaddrinfo(res);
        close(sockfd);
        return(-1);
    }

    // Send message to remote server.  Use send().
    send(sockfd, message.c_str(), message.size(), MSG_NOSIGNAL);
    std::cout << "Message sent successfully." << std::endl;

    // Close connection.  Use close().
    freeaddrinfo(res);
    close(sockfd);
    std::cout << "Connection closed." << std::endl;
    
    // Exit successfully.
    std::cout << "Client finished successfully." << std::endl;
    return 0;
}