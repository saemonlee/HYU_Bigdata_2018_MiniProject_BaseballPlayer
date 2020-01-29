# HYU_Bigdata_2018_MiniProject_BaseballPlayer

## Explanation
과학기술정보통신부, IITP에서 지원하고 한양대학교에서 주관한 "프로젝트 주도형 빅데이터 전문가 양성과정"에서 진행한 야구선수 평가 시스템 미니프로젝트입니다.

This is a miniproject about the application evaluating baseball players for the HYU bigdata expert course supported by MSIT and IITP of South Korea.

## Summary

야구선수의 능력을 다음과 같이 나눠서 점수와 그에 따른 랭크를 매겨서 보여주는 웹 어플리케이션 제작.

We maked the web application scoring and grading the baseball players' abilities about many fields. The following is the list about what abilities this application evaluates.

- 타자 / Hitter
    - 파워 / Power
    - 정교함 / Contact
    - 선구안 / Batting eye
    - 주루능력 / Running
    - 스피드 / Speed
    - 수비 / Defence

- 투수 / Pitcher
    - 스태미나 / Stamina
    - 구속 / Ball speed
    - 구위 / Ball power
    - 제구력 / Control
    - 위기 대처 능력 / Mind control
    - 피칭 유형 / Pitching type

점수 산출 방식은 정규 분포를 베이스로 한 후 주관적으로 결정.\
이후 수능의 표준 점수 산출 공식 또한 참고.

The method of scoring is subjectively determined by the normal distribution.\
Also I refered to the formula for calculating the standard score for the CSAT.

## Role What I took

- 평가 공식 결정\
/ Determine the formula of scoring
- SQL 쿼리 작성\
/ Create SQL Query