package day0630;

import java.awt.Color;

import javax.swing.JFrame;

public class SwingGibon_07 extends JFrame{

	public SwingGibon_07(String title) {
		super(title);
		
		//시작위치,너비,높이
		this.setBounds(500, 100, 500, 500);
		//종료
		this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		
		//배경색
		//this.setBackground(Color.MAGENTA);
		//this.setBackground(new Color(190,242,200));
		this.getContentPane().setBackground(Color.CYAN);
		
		//프레임 보이게
		this.setVisible(true);
		
	}
	
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

		new SwingGibon_07("스윙기본");
	}

}
