# KOSTAGRAM(코스타그램)
<p align="center"><img src="https://user-images.githubusercontent.com/88620416/141291035-e2215d44-8d4e-444a-9315-5c2a83adfaac.png"></p>

## 🚀 프로젝트 개요
### 프로젝트명 : KOSTAGRAM
- 사용자간의 자유로운 의사소통과 정보공유를 위한 커뮤니티 프로젝트입니다.
- 개개인을 브랜딩화하여 일상을 공유하고 사회적 관계를 생성 및 강화시키는 것에 목적을 두고 있습니다.
- 그동안 교육을 통해 배웠던 내용들을 복습하고, 기획부터 구현, 유지보수의 모든 과정을 경험해보는 프로젝트입니다.

### 팀명 : Koverloper
- Kosta가 키운 유능한 개발자들

### 팀원 및 구현 기능
- `양성원` / [SeongWon Yang](https://github.com/seongwonyang) : 메인개발자 및 팀장<br>
- `신유라` / [Youra Shin](https://github.com/diverJenny) : 메인개발자
- `이 용` / [nogy21](https://github.com/nogy21) : 메일개발자
- `이주형` / [juhyung96](https://github.com/juhyung96) : 메일개발자
- `임지원` / [zheld12](https://github.com/zheld12) : 메일개발자
- `김서연` / [westkitekim](https://github.com/westkitekim) : 메일개발자

## 🚀 회의록
- [2021.11.04 4차 회의록](https://github.com/diverJenny/KOSTAGRAM/wiki/2021.11.04)
- [2021.11.05 5차 회의록](https://github.com/diverJenny/KOSTAGRAM/wiki/2021.11.05)
- [2021.11.07(일) 6차 회의록](https://github.com/diverJenny/KOSTAGRAM/wiki/2021.11.07(%EC%9D%BC)-%ED%9A%8C%EC%9D%98%EB%A1%9D)
- [2021.11.08(월) 7차 회의록](https://github.com/diverJenny/KOSTAGRAM/wiki/2021.11.08(%EC%9B%94)-%ED%9A%8C%EC%9D%98%EB%A1%9D)
- [2021.11.09(화) 8차 회의록](https://github.com/diverJenny/KOSTAGRAM/wiki/2021.11.09(%ED%99%94)-%ED%9A%8C%EC%9D%98%EB%A1%9D)
- [2021.11.10(수) 9차 회의록](https://github.com/diverJenny/KOSTAGRAM/wiki/2021.11.10(%EC%88%98)-%ED%9A%8C%EC%9D%98%EB%A1%9D)
- [2021.11.11(목) 10차 회의록](https://github.com/diverJenny/KOSTAGRAM/wiki/2021.11.11(%EB%AA%A9)-%ED%9A%8C%EC%9D%98%EB%A1%9D)

## 🚀 개발기간
- 프로젝트 수행 기간  
2021.11.01 ~ 2021.11.12

## 🚀 개발환경 및 적용기술 
<img src="http://img.shields.io/badge/-git-black?&logo=git"><br>
<img src="http://img.shields.io/badge/-github-black?&logo=github"><br>
<img src="https://img.shields.io/badge/java-v1.8-007396?logo=java"><br>
<img src="https://img.shields.io/badge/Apache Tomcat-v8.5-F8DC75?logo=Apache Tomcat"><br>
<img src="https://img.shields.io/badge/javascript-ES6+-F7DF1E?logo=javascript"><br>
<img src="https://img.shields.io/badge/git-v2.32.2-F05032?logo=git"><br>
<img src="https://img.shields.io/badge/Oracle-v11-F80000?logo=Oracle"><br>
<img src="https://img.shields.io/badge/HTML5-v5-E34F26?logo=HTML5"><br>
<img src="https://img.shields.io/badge/CSS3-v3-1572B6?logo=CSS3"><br>
<img src="https://img.shields.io/badge/Bootstrap-v4-7952B3?logo=Bootstrap"><br>
<img src="https://img.shields.io/badge/Eclipse IDE-v4-2C2255?logo=Eclipse IDE"><br>
<img src="https://img.shields.io/badge/Trello--0052CC?logo=Trello"><br>



## 🚀 요구사항

### 1차 구현 
  - 메인페이지
    - 상단에 회원 및 게시글(헤시태그) 검색폼 제공한다.
    - 팔로우한 유저들의 최신글들을 수직으로 제공한다.
    - 비회원인 경우 팔로우가 많은 게시글을 몇개 볼수있도록 제공한다.
  - 회원관리
    - 로그인 : 아이디와 패스워드를 입력해서 로그인을진행한다. 로그인이 성공하면 메인페이지로 이동한다.
    - 회원가입 : 아이디, 사용자이름, 이메일을 입력해서 회원가입이 가능하다.
    - 회원정보수정 : 로그인한 사용자의 아이디,이름,이메일,전화번호를 수정가능하다.
    - 비밀번호변경 : 로그인 상태일 때 비밀번호 변경이 가능하다.

  - 유저 
    - 유저디테일 : 유저의 프로필사진, 소개글, 게시물 수, 팔로우 수, 팔로워 수를 보여준다.
    - 프로필 수정 : 프로필사진을 삭제(기본이미지로 변경), 수정하고 소개글을 수정한다.  
  - 포스트 
    - 포스트 상세보기 : 회원인 경우에만 게시글 상세보기가 가능하고 사진, 내용, 업로드일자, 좋아요, 댓글을 볼 수 있다.
  본인이 작성한 게시글에는 수정/삭제 버튼이 보인다.
  - 친구관리 
    - 아이디검색 
      - 메인페이지 상단에 검색폼이 위치한다.
      - 로그인하지 않아도 회원 아이디를 검색할 수 있다.(1차: 아이디를 정확히 입력, 2차: 일부 입력 가능)
  <br>
  
  ### 2차 구현 
  - 포스트 업로드 
    - 로그인한 회원은 사진, 내용을 작성하고 V 버튼을 누르면 업로드 할 수 있다.
    - 게시물 내용에는 해시태그와 함께 작성이 가능하다.
  - 포스트 수정 
    - 게시글 수정에서 사진은 수정 불가하고 게시글만 수정 가능하다. 
  - 포스트 삭제
    - 로그인한 회원은 게시글 상세보기에서 본인이 작성한 게시글에서만 삭제 버튼을 볼 수 있다.
    - 삭제 버튼을 누르면 '삭제하시겠습니까?' 알럿이 뜨고 확인을 누르면 게시글이 삭제된다.
  - 댓글 기능 추가 
    - 로그인한 회원은 게시글 상세보기에서 댓글을 추가할 수 있다.
  - 좋아요 
    - 로그인 한 회원은 게시글 상세보기에서 마음에 드는 게시글에 좋아요를 누를 수 있다.
  <br>
  
  ### 3차 구현 
  - 포스트 추가 기능 
    - 포스트 검색
      - 메인페이지 상단에 검색폼이 위치한다.
      - 로그인 하지 않아도 게시글을 검색할 수 있다.(해시태그)
  - 해시태그 추가 
  - 포스트 링크공유 
    - 게시물의 링크를 복사해서 공유할 수 있다.
  - 회원 
    - 회원 검색 기능 추가 
    - 팔로우 기능 추가 : 관심있는 유저들의 게시글들을 메인 페이지에서 제공하도록 한다.
  <br>
  
  ### 4차 구현 
  - 회원 
    - 회원탈퇴 : 사용자의 패스워드를 확인후 재입력하여 회원탈퇴를 진행한다.
    - 채팅
  - 포스트 
    - 위치등록 : 게시물 업로드 시 위치등록이 가능하다.
    - 
## 🚀 개발 프로세스 및 설계

## 🚀 트러블슈팅


