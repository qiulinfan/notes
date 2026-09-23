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

int main() {
    // Create socket for accepting connections.  Use socket().
    int listen_sockfd = socket(AF_INET, SOCK_STREAM, 0); 
    if (listen_sockfd < 0) {
        std::cerr << "Error creating socket: " << strerror(errno) << std::endl;
        return(-1);
    }

    // Configure a sockaddr_in for the accepting socket.
    struct sockaddr_in server_addr{};
    server_addr.sin_family = AF_INET;
    server_addr.sin_addr.s_addr = htonl(INADDR_ANY);  // 绑定到所有本地地址
    server_addr.sin_port = htons(0); // 让系统自动分配端口号

    // Bind to a port.  Use bind().
    if (bind(listen_sockfd, (sockaddr*)&server_addr, sizeof(server_addr)) < 0) {
        std::cerr << "Bind failed: " << strerror(errno) << std::endl;
        close(listen_sockfd);
        return -1;
    }

    // Get the port number assigned by the system, and print it out
    socklen_t addr_len = sizeof(server_addr);
    if (getsockname(listen_sockfd, (sockaddr*)&server_addr, &addr_len) < 0) {
        std::cerr << "getsockname failed: " << strerror(errno) << std::endl;
        close(listen_sockfd);
        return -1;
    }
    // Print the port number and local ip  address
    char ipstr[INET_ADDRSTRLEN];
    inet_ntop(AF_INET, &server_addr.sin_addr, ipstr, sizeof(ipstr));
    std::cout << "Server IP: " << ipstr << std::endl;
    std::cout << "Server listening on port: " << ntohs(server_addr.sin_port) << std::endl;

    // Begin listening for incoming connections.  Use listen().
    if (listen(listen_sockfd, 30) < 0) {
        std::cerr << "Listen failed: " << strerror(errno) << std::endl;
        close(listen_sockfd);
        return -1;
    }

    // Serve incoming connections one by one forever.
    while (true) {
        // Accept connection from client.  Use accept().
        struct sockaddr_in client_addr{};
        socklen_t client_addr_len = sizeof(client_addr);
        int client_sockfd = accept(listen_sockfd, (sockaddr*)&client_addr, &client_addr_len); 
        if (client_sockfd < 0) {
            std::cerr << "Accept failed: " << strerror(errno) << std::endl;
            continue; // Continue to accept next connection
        }

        // Print client address and port.
        char client_ip[INET_ADDRSTRLEN];
        inet_ntop(AF_INET, &client_addr.sin_addr, client_ip, sizeof(client_ip));
        std::cout << "Accepted connection from " << client_ip << ":"
                  << ntohs(client_addr.sin_port) << std::endl;
        
        // Receive message from client.  Use recv().
        char buffer[MAX_MESSAGE_SIZE];
        ssize_t bytes_received = recv(client_sockfd, buffer, sizeof(buffer) - 1, 0);
        if (bytes_received < 0) {
            std::cerr << "Error receiving message: " << strerror(errno) << std::endl;
            close(client_sockfd);
            continue; // Continue to accept next connection
        } else if (bytes_received == 0) {
            std::cout << "Client disconnected." << std::endl;
            close(client_sockfd);
            continue; // Continue to accept next connection
        } else { 
            buffer[bytes_received] = '\0'; // Null-terminate the received string
            // Print message from client.
            std::cout << "Received message: " << buffer << std::endl;
        }

        // Close connection.  Use close().
        close(client_sockfd);
        std::cout << "Connection closed." << std::endl;
    }

    // close listening socket before exiting
    close(listen_sockfd);
    std::cout << "Server finished successfully." << std::endl;

    // Exit successfully.
    return(0);
}