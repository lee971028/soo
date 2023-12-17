package mycar.data;

import java.sql.Timestamp;
import org.hibernate.annotations.CreationTimestamp;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
//자동으로 mycar 라는 table을 생성하는데 없을경우 새로 생성, 존재할경우 수정
@Table(name = "mycar")
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class MyCarDto{	
	@Id  //각 엔터티를 구별할수 있도록 식별 아이디를 갖도록 설계
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long num;
	
	@Column(name = "carname",length=100)//컬럼의 길이와 null값허용여부
	private String carname;
	
	//@Column(name = "carprice") //생략가능
	private int carprice;	
	private String carcolor;	
	private String carguip;	
	private String carphoto;
	
	//@Transient: 테이블의 컬럼으로는 생성되지 않고 객체에서만 사용가능한 멤버변수
	@Transient
	private String message;
	
	@Column(name = "writeday",updatable = false) //수정시 컬럼 제외
	@CreationTimestamp //엔터티가 생성되는 시점의 시간이 자동등록
	private Timestamp writeday;
}