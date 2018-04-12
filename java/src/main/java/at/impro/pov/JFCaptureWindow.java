/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package at.impro.pov;

import java.awt.Color;
import java.awt.Dimension;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.GridBagLayout;
import javax.swing.JFrame;
import javax.swing.JPanel;

/**
 *
 * @author patrick
 */
public class JFCaptureWindow extends JFrame {
    
    public JFCaptureWindow() {
        super("Capture Windwo");
        setBackground(new Color(0, 0, 0, 0));
        setSize(new Dimension(300, 200));
        setLocationRelativeTo(null);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        JPanel panel = new JPanel() {
            @Override
            protected void paintComponent(Graphics g) {
                if (g instanceof Graphics2D) {
                    Graphics2D g2d = (Graphics2D) g;
                    g2d.clearRect(0, 0, getWidth(), getHeight());
                    g2d.setColor(new Color(0, 0, 0, 0));
                    g2d.fillRect(0, 0, getWidth(), getHeight());
                    g2d.setColor(new Color(0, 0, 0, 255));
                    if(getHeight()<getWidth())
                        g2d.fillRect(getHeight(), 0, getWidth(), getHeight());
                    else
                        g2d.fillRect(0, getWidth(), getWidth(), getHeight());
                }
            }
        };
        setContentPane(panel);
        setLayout(new GridBagLayout());
    }
    
}
