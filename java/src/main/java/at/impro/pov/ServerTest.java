/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package at.impro.pov;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author patrick
 */
public class ServerTest {

    public static void main(String args[]) {

        try {
            ServerSocket serverSocket = new ServerSocket(9999);
            while(true)
            {
                final Socket clientSocket = serverSocket.accept();
                new Thread(new Runnable() {
                    @Override
                    public void run() {
                        try {
                            PrintWriter out
                                = new PrintWriter(clientSocket.getOutputStream(), true);
                            BufferedReader in = new BufferedReader(
                                new InputStreamReader(clientSocket.getInputStream()));

                            String inputLine;

                            char[] data = new char[100000];
                            int l;
                            // Initiate conversation with client
                            while ((l = in.read(data)) != -1) {
                                System.out.println(l);
                            }
                        } catch (Exception ex) {
                            Logger.getLogger(ServerTest.class.getName()).log(Level.SEVERE, null, ex);
                        }
                    }
                }).start();
            }
        } catch (Exception ex) {
            Logger.getLogger(ServerTest.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
}
