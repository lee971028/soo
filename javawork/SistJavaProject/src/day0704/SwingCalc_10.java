package day0704;

import java.awt.Color;
import java.awt.Container;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JTextField;

public class SwingCalc_10 extends JFrame{

	Container cp;
	JLabel lblResult,lbl1,lbl2; //결과나오는곳,숫자1제목,숫자2제목
	JTextField tfSu1,tfSu2; //입력하는곳
	JButton btnAdd; //이벤트 발생버튼
	
	public SwingCalc_10(String title) {
		super(title);
		cp=this.getContentPane();
		this.setBounds(200, 100, 300, 400);
		cp.setBackground(new Color(255,255,200));
		setDesign();
		setVisible(true);
	}
	
	public void setDesign()
	{
		this.setLayout(null);
		
		lbl1=new JLabel("숫자1");
		lbl2=new JLabel("숫자2");
		
		lbl1.setBounds(20, 20, 50, 30);
		this.add(lbl1);
		lbl2.setBounds(20, 60, 50, 30);
		this.add(lbl2);
		
		tfSu1=new JTextField();
		tfSu1.setBounds(70, 20, 60, 30);
		this.add(tfSu1);
		
		tfSu2=new JTextField();
		tfSu2.setBounds(70, 60, 60, 30);
		this.add(tfSu2);
		
		btnAdd=new JButton("숫자더하기");
		btnAdd.setBounds(30, 120, 150, 30);
		this.add(btnAdd);
		
		
		lblResult=new JLabel("결과 나오는곳");
		lblResult.setBounds(10, 180, 250, 60);
		this.add(lblResult);
		
		//버튼 이벤트인데 익명내부 클래스 형식으로 만들기
		btnAdd.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				// TODO Auto-generated method stub
				int su1= Integer.parseInt(tfSu1.getText());
				int su2= Integer.parseInt(tfSu2.getText());
				
				int sum=su1+su2;
				
				//String s=String.valueOf(sum);
				//String s=sum+"";
				String s=su1+"+"+su2+"="+sum;
				
				//결과라벨지에 수정
				lblResult.setText(s);
				
			}
		});
		
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

		new SwingCalc_10("간단계산 연습");
	}

}
