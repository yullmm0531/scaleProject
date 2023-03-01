# scaleProject
 
***

# Contents <br>
1. [개요](#star-개요)  
2. [팀 소개 및 주요 기능](#star-팀-소개-및-주요-기능)
3. [구현 기능](#star-구현-기능)
    - [상품 상세페이지](#pushpin-상품상세페이지)
    - [찜하기](#pushpin-찜하기)
    - [구매 - 사이즈 선택](#pushpin-구매-사이즈선택)
    - [구매가 설정](#pushpin-구매가-설정)
    - [배송지 설정](#pushpin-배송지-설정)   
    - [결제 구현](#pushpin-결제-구현)   
    - [판매 - 사이즈 선택](#pushpin-판매-사이즈선택)
    - [판매가 설정](#pushpin-판매가-설정)
    - [계좌 설정](#pushpin-계좌-설정)
    - [판매](#pushpin-계좌-설정)
    - [관리자:입찰리스트](#pushpin-관리자:입찰리스트)
    - [관리자:거래리스트](#pushpin-관리자:거래리스트)
    - [shop차단](#pushpin-shop차단)

4. [Document](#star-document)

***

# :star: 개요
- 프로젝트명 : scaleProject <br>

- 보고서 : [도미파솔라조_SCALE_최종보고서.pdf](https://github.com/yullmm0531/scaleProject/files/10849236/_SCALE_.pdf)<br>

- 기획 의도  <br>
  - 늘어난 중고거래 속 가품사기 방지 필요성 증가 <br>
  - 믿을만한 중간역할 중개자의 필요 <br>
  - 1대1 거래서비스에서 원하는 가격에 구매 <br>
  - 1대1 거래서비스에서 원하는 가격에 판매 <br>

- 개발 환경 <br><br>
![image](https://user-images.githubusercontent.com/115603858/221830442-edf7066a-29dc-4288-9f90-3c6306eb630e.png)<br>

***

# :star: 팀 소개 및 주요 기능
![image](https://user-images.githubusercontent.com/115603858/221831163-b235dd60-382b-4981-bf52-9663c21982cc.png)
![image](https://user-images.githubusercontent.com/115603858/221831218-f8bb8b1a-52e4-406f-9354-4099f2b8a5b7.png)

***
# :star: 구현 기능
 

### :pushpin: 상품상세페이지
![상품상세페이지1](https://user-images.githubusercontent.com/115603858/222121953-a059111e-7286-40e8-a4a5-e1bb955a31df.gif)
- 구현 기능 설명
   - 상품사진, 브랜드명, 상품명(영어, 한글) 최근거래가, 상품정보, 시세 조회
   - ajax를 사용하여 사이즈 별 시세 조회
   - 모달에서는 전체 내역 조회 가능
<br><br>

### :pushpin: 찜하기
![찜하기](https://user-images.githubusercontent.com/115603858/222123915-1a640727-7157-4dc4-84f4-ecd1485468af.gif)
- 구현 기능 설명
   - 로그인 후 찜하기 클릭시 ajax로 찜하기/찜해제 구현
   - ajax로 해당 상품에 찜한 회원수 조회
<br><br>

### :pushpin: 구매 사이즈선택
![구매사이즈선택](https://user-images.githubusercontent.com/115603858/222128250-8a48c759-4cc3-4cf9-a519-d131e47feed8.gif)
- 구현 기능 설명
   - 구매하기 클릭 시 사이즈별 판매 입찰가의 최소가 확인 가능
   - 판매 입찰이 없는 사이즈의 경우 구매 입찰 표시
   - 구매약관의 검수기준보기/이용정책보기 클릭시 모달로 확인 가능
   - 구매약관 모두 동의해야 다음 단계 진행 구현
 <br><br>
 
### :pushpin: 구매가 설정
![구매가설정](https://user-images.githubusercontent.com/115603858/222129542-772c51a4-3048-496d-b0ea-e935addfb354.gif)
- 구현 기능 설명
   - 판매입찰가가 있는 사이즈를 선택한 경우 즉시 구매가 확인
   - 구매 입찰을 눌러 입찰가 설정 가능
   - 입력한 구매 입찰가가 즉시 구매가보다 높다면 자동으로 즉시 구매로 이동
   - 판매 입찰이 없는 사이즈를 선택한 경우 구매 입찰만 가능(즉시 구매 불가능)
 <br><br>
  
### :pushpin: 배송지 설정
![배송지설정](https://user-images.githubusercontent.com/115603858/222131025-e34bf73c-0a8a-49ae-b9bd-f567b1779e7a.gif)
- 구현 기능 설명
   - 주문서에 기본적으로 기본배송지 조회
   - 배송지 추가 클릭시 주소 api를 연동하여 배송지 추가 기능 구현
   - 확인 클릭 시 ajax를 사용하여 DB에 주소 insert 후 주문서에 해당 주소를 불러오는 기능 구현
   - 배송지 목록 클릭시 ajax로 해당 회원의 저장된 배송지 조회 (기본배송지를 첫번째로 조회) 구현
   - 리스트 중 하나를 선택하고 확인 클릭시 ajax로 주문서에 불러오는 기능 구현
   - 배송 메세지 직접입력 클릭 시 메세지를 입력할 수 있는 박스 display되고, 직접 입력 가능
<br><br>  

### :pushpin: 결제 구현
![결제](https://user-images.githubusercontent.com/115603858/222132873-e108e5bd-9e50-48d7-a50f-dcacd11ad5da.gif)
- 구현 기능 설명
   - 다음단계 클릭 시 결제 api 호출
   - 아임포트 결제 api에 상품명, 구매자 이메일, 구매자 이름, 구매자 휴대폰번호, 구매자 주소와 우편번호 작성
   - 실제 결제를 하여 테스트 하기 때문에 가격은 1,000원이 결제 되도록 지정
   - 실제 결제 후 확인 페이지 로딩 구현

<img width="317" alt="KakaoTalk_Photo_2023-03-01-21-06-19" src="https://user-images.githubusercontent.com/115603858/222134914-74e11253-e8a3-48a7-8729-266c1f830b62.png"><br>
#### 📍 구매입찰 성공 확인
<img width="1129" alt="구매입찰완료" src="https://user-images.githubusercontent.com/115603858/222135584-8401fe42-8d79-44cb-a9f2-310eadbd6dd4.png">

  - 285사이즈 200,000만원 구매 입찰에서 확인 가능(입찰가가 높은 것부터 조회)

<br><br>
  
### :pushpin: 판매 사이즈선택
![판매사이즈선택](https://user-images.githubusercontent.com/115603858/222155047-4643ff68-329b-47b3-8960-a7e30480ebd6.gif)
- 구현 기능 설명
   - 판매하기 클릭 시 사이즈별 구매 입찰가의 최대가 확인 가능
   - 구매 입찰이 없는 사이즈의 경우 판매 입찰 표시
<br><br>

### :pushpin: 판매가 설정
![판매가설정](https://user-images.githubusercontent.com/115603858/222155900-cb5b8e4d-00d8-4048-a0be-1aff77f96a5c.gif)
- 구현 기능 설명
   - 구매 입찰가가 있는 사이즈를 선택한 경우 즉시 판매가 확인
   - 판매 입찰을 눌러 입찰가 설정 가능
   - 입력한 판매 입찰가가 즉시 판매가보다 낮다면 자동으로 즉시 판매로 이동
   - 구매 입찰이 없는 사이즈를 선택한 경우 판매 입찰만 가능(즉시 판매 불가능)
 <br><br>
  
### :pushpin: 계좌 설정
![계좌정보설정](https://user-images.githubusercontent.com/115603858/222156892-975736bc-230a-47fc-a32b-b12af686390e.gif)
- 구현 기능 설명
   - 변경 클릭 시 기존 정보 조회 가능
   - 예금주가 회원의 이름과 일치하지 않는 경우 등록 불가능
   - 변경 클릭 시 ajax를 사용하여 DB에 update 후 주문서에 해당 정보를 불러오는 기능 구현 
 <br><br>

### :pushpin: 판매
![판매](https://user-images.githubusercontent.com/115603858/222161374-bae47f24-b370-4e8f-bf46-eb5b676a8edd.gif)
- 구현 기능 설명
   - 모든 판매 약관 동의 시 다음단계로 진행 가능
   - 판매유형에 따라 즉시판매|판매입찰 성공 페이지로 이동

#### 📍 즉시 판매 성공
<img width="1113" alt="즉시판매성공" src="https://user-images.githubusercontent.com/115603858/222162136-94aef4ab-064d-4b10-bd8f-31e7ab9822d6.png"><br>
- 체결 거래 목록에서 확인 가능
<br><br>

### :pushpin: 관리자:입찰리스트
![입찰리스트](https://user-images.githubusercontent.com/115603858/222166544-7fd3d521-6817-4bc8-82e7-3e18c3a886af.gif)
- 구현 기능 설명
   - 입찰번호, 상품번호, 상품명, 사이즈, 입찰종류, 아이디, 입찰금액, 입찰일시, 입찰상태 조회
   - 입찰 유형에 따라 버튼 눌러서 조회 가능
   - 페이징 처리
<br><br>

### :pushpin: 관리자:거래리스트
![거래리스트](https://user-images.githubusercontent.com/115603858/222168729-568743f6-ad4b-4fd7-a6bf-c85a45a0cfee.gif)
- 구현 기능 설명
   - 입찰번호, 상품번호, 상품명, 판매자, 구매자, 입고완료일, 검수완료일, 출고일, 진행상태 조회
   - 변경 버튼 눌러서 진행상태 변경 가능
   - 입고완료 | 검수완료 or 검수미통과 | 출고완료 로 상태 변경시 ajax를 사용하여 해당 날짜 업데이트 후 리스트에서 확인 가능
<br><br>

### :pushpin: shop차단
![shop차단](https://user-images.githubusercontent.com/115603858/222170541-d3a4dab9-540f-4a28-88c1-41655d9a6cc9.gif)
- 구현 기능 설명
   - 관리자 페이지에서 판매자의 검수미통과가 세번 되는 순간 트리거를 이용해 해당 회원 shop 차단 기능 구현
<br><br>

***
# :star: Document

## 개발 일정 <br>
<img width="1519" alt="scale일정" src="https://user-images.githubusercontent.com/115603858/222172225-fb978526-b900-47b5-9c14-766c87c00b10.png">
<br>

## 유스케이스 <br>
![use_case](https://user-images.githubusercontent.com/115603858/222172313-c7e3f1ed-f061-4595-a0a1-f9c745f5fafb.jpg)
<br>

## DB 설계 <br>
<img width="1436" alt="scaleDB" src="https://user-images.githubusercontent.com/115603858/222171803-047a9066-7e0b-43b2-9aba-f943b4fd83cd.png">
<br>
