package mycar.data;

import java.sql.Timestamp;

import org.hibernate.annotations.CreationTimestamp;

import com.fasterxml.jackson.annotation.JsonFormat;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
/* * 
 * 은행 서비스에서 사용자(TABLE_USER)가 1개 이상의 계좌(TABLE_ACCOUNT)를 
 * 가질수 있다고 가정할경우 TABLE_USER 입장에서 보면 OneToMany이고, 
 * TABLE_ACCOUNT 입장에서 보면 ManyToOne이다.
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "mycar_comment")
public class MyCarCommentDto {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int idx;
	@ManyToOne
	@JoinColumn(name = "num")
	private MyCarDto mycar;
	private String comment;
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm",timezone = "Asia/Seoul")
	@Column(name = "writeday",updatable = false) //수정시 컬럼 제외
	@CreationTimestamp //엔터티가 생성되는 시점의 시간이 자동등록
	private Timestamp writeday;
}
