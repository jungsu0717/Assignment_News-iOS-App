# 🚨 ** Assignment - News iOS App **

## 🗓️ ** Preview **

** Light Mode **
https://github.com/jungsu0717/Assignment_News-iOS-App/assets/6903839/c47bd883-d6b6-4a91-bcf7-35de2d35e661

** Dark Mode **
https://github.com/jungsu0717/Assignment_News-iOS-App/assets/6903839/4abd2b01-f433-4f68-9753-239b1a5f643d

<br>

## 🗓️ ** 일정 **
- 2024년 5월 23일(목) 오후 5시 ~ 5월 29일(수) 오후 11시

<br>

## 🛠 **프로젝트 실행 방법**

- Github 에서 코드 설치 다운로드

1. 하단의 Code 버튼을 눌러 경로를 복사한 후 복제

```
$ https://github.com/jungsu0717/Sample.git
```
2. Sample.xcodeproj 실행
3. Target Device 선택 > Run
- ** 실행이 되지 않을 경우 SPM > Alamofire, Realm 설치 **

<br>

## 📝 **과제 기술 요건 & 요구 조건**

### 🙆‍♂️ [기술 요건]

- swift, Objective C (혼용시 가점)
- MVVM, MVP 중에 하나 사용
- combine 사용
- alamofire 사용, 또는 직접 네트워크 모듈 구현
- CoreData 또는 Realm 사용

### ✔️ [요구 조건]

- [x]  News API – Search News and Blog Articles on the Web 통해 api키를 발급 받습니다.
- [x]  https://newsapi.org/v2/top-headlines?country=kr&apiKey={api-key} 이 api를 통하여 raw데이터를 가져옵니다.
- [x]  메인 화면에는 일반 폰에서는 portrait일때 1개의 colume를 사용하여 아래로 스크롤 되는 UI를 작성합니다.
- [x]  landscape 일때는 5개의 colume을 사용하여 스크롤 되는 UI를 작성합니다.
    - [x]  landscape 일때의 cell size는 300px, 120px 설정 (가로로도 스크롤)
- [x]  api를 통해 받은 데이터는 로컬에 저장하여 api call이 실패하거나 오프라인 상태일때 저장된 데이터를 사용하여 UI를 표시합니다.
- [x] urlToImage 의 이미지 데이터 역시 로컬에 저장하여 오프라인 상태일때 저장된 데이터를 사용하여 이미지를 표시합니다. 또는 온라인 상태 일때도 저장된 데이터가 있는 경우 사용합니다.
- [x]  한개의 셀에 표시할 데이터는 title, urlToImage, publishedAt 입니다. 그외의 추가 ui는 자유롭게 표시해주세요.
- [x]  셀을 터치 시에 webView 가 전체를 덮는 ViewController 를 표시합니다.
    - [x]  상단의 Navi bar가 표시되고, title label과 back 버튼이 표시
    - [x]  Navi bar를 제외한 모든 영역은 webView가 차지
- [x]  물리 백버튼 이벤트에서 webView ViewController를 닫습니다.
- [x]  한번 진입했던 cell에는 title 의 text 컬러를 red 로 설정합니다.
- [x]  이외의 ui, 인터렉션 등은 자유롭게 표시해 주세요.

<br>

## 🔨 사용 기술

-   Language : <img src="https://img.shields.io/badge/Swift-F05138?style=flat&logo=Swift&logoColor=white"/></a>
-   Architecture : <img src="https://img.shields.io/badge/MVVM-8A2BE2?style=flat&logo=MVVM&logoColor=white"/></a>
-   Framework : <img src="https://img.shields.io/badge/Combine-8A2BE2?style=flat&logo=Combine&logoColor=white"/></a>
-   Tool : <img src="https://img.shields.io/badge/Xcode-147EFB?style=flat&logo=Xcode&logoColor=white"/></a> <img src="https://img.shields.io/badge/GitHub-181717?style=flat&logo=GitHub&logoColor=white"/></a> <img src="https://img.shields.io/badge/Figma-F24E1E?style=flat&logo=Figma&logoColor=white"/></a>
-   Package : <img src="https://img.shields.io/badge/Realm-39477F?style=flat&logo=Realm&logoColor=white"/></a> <img src="https://img.shields.io/badge/Alamofire-8A2BE2?style=flat&logo=Alamofire&logoColor=white"/></a>

<br>

