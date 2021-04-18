# 맞춤형 취업 준비 시스템 workruit

인공지능을 활용하여 파악한 관심 분야의 동향과 그 분야의 채용 공고를 제공하는 웹 시스템 입니다.

#### 기간 : 2019.11.25 ~ 2019.12.18
#### 참여 인원 : 4명
#### 역할 : 팀원
* 시스템 : 개인 맞춤형 시스템 설계 및 구현, 외부 API 연동, 뉴스기사 크롤링
* 데이터베이스 : 설계, 구축

---

### 기획

기존 채용 정보 제공 사이트가 많아서 원하는 분야의 공고를 찾는 데 시간이 오래 걸립니다. 또 자기소개서 작성과 면접 준비를 위해 직무와 기업에 대한 정보가 필요하여 업계에 대한 동향을 따로 찾아봐야 한다는 불편함이 있습니다.

따라서 본 프로젝트를 통해  Google custom search를 이용해 맞춤 검색 엔진을 만들고 maum ai 텍스트 분류 인공지능을 활용하여 관심 분야의 기사를 검색하여 그 분야의 동향과 채용 공고를 제공하는 웹 시스템을 개발하였습니다. 이 시스템을 이용하여 여러 채용 정보 사이트의 공고를 종합하여 설정한 관심 분야 맞춤형의 공고를 제공하고 관심 직종에 대한 정보들을 주제 별로 분류하여 필요한 정보만 제공 합니다. 또한 기업의 채용 일정과 더불어 개인 일정까지 캘린더에 저장하여 월별 스케줄을 한 눈에 확인할 수 있습니다.

※ maum ai 텍스트 분류 : 뉴스 기사를 입력하면 기사의 주제를 정확하게 분류해 냅니다. 더불어 분류의 근거를 문장 단위와 단어 단위로 제공하는 '설명 가능한 AI' 입니다.


---

### 설계

* 시스템 구성도

![system](https://user-images.githubusercontent.com/49244233/111894990-f3f80080-8a52-11eb-84e2-5a2fe8ebcceb.png)


* 서비스 흐름도

![flow](https://user-images.githubusercontent.com/49244233/111894995-f8bcb480-8a52-11eb-9c99-4a2c6a1c8006.png)


---

### 주요 기능 시연

* 메인 화면 - 로그인 전

![main1](https://user-images.githubusercontent.com/49244233/111895007-0eca7500-8a53-11eb-8446-64e97d6b300d.png)


* 메인 화면 - 로그인 후

![main2](https://user-images.githubusercontent.com/49244233/111895018-1d189100-8a53-11eb-86db-b4bf84417ec1.png)
![main3](https://user-images.githubusercontent.com/49244233/111895021-1f7aeb00-8a53-11eb-8d0b-9f7c9763c4ae.png)


* 즐겨찾기

![bookmark](https://user-images.githubusercontent.com/49244233/111895029-273a8f80-8a53-11eb-9f1d-1837ae0dbecf.png)


* 일정 관리

![calendar](https://user-images.githubusercontent.com/49244233/111895033-2c97da00-8a53-11eb-9841-cc729ece13f0.png)


* 업계 동향

![ai](https://user-images.githubusercontent.com/49244233/111895040-34577e80-8a53-11eb-894a-1197e8e8a635.png)


---

### 개발 후기

* 기대 효과

사용자의 관심 분야에 맞는 공고를 출력하여 정보의 정확성을 증가시킬 수 있습니다. 즐겨찾기 기능으로는 사용자에게 관심 채용 정보에 대한 접근성을 증가시켜주고 일정 관리 기능을 통해 관심 기업의 채용 일정을 확인하고 개인 스케줄 조정 및 면접 대비가 가능합니다. 또한 업계 동향 기능으로 관심 기업 면접 준비에 필요한 기업 동향이나 현재 상황 및 이슈들을 맞춤형으로 학습 가능합니다.

결과적으로는 맞춤형 정보 제공으로 탐색에 소요되는 시간을 단축하고 이력서 작성 및 면접에 집중할 수 있게 됩니다.

* 향후 개선 방향

당초 기존 채용 정보 사이트의 API를 이용하여 채용 공고를 불러오려고 했으나 API 제공이 B2B로 제한되어 임시로 채용 정보 데이터들을 직접 데이터베이스에 저장하여 이용하였습니다. 따라서 기업 차원에서 개발 시 API 사용으로 데이터 수집이 용이하여 더 방대한 채용 공고를 제공할 수 있을 것으로 예상됩니다.

---

## Program Stacks
### Client
* HTML
* CSS
* JavaScript
* jQuery
* Bootstrap

### Server
* Apache Tomcat
* MySQL
* Java
* JSP
* Google custom search
* Google API
* maum ai 텍스트 분류
