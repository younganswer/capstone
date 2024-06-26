set -e

mongosh << EOF

use $MONGO_INITDB_DATABASE
db.createUser({
  user:  '$MONGO_INITDB_ROOT_USERNAME',
  pwd: '$MONGO_INITDB_ROOT_PASSWORD',
  roles: [{
    role: 'readWrite',
    db: '$MONGO_INITDB_DATABASE'
  }]
})

db.createCollection('users')
db.createCollection('diaries')

db.users.createIndex({ email: 1 }, { unique: true })

var nicknames = [ "콩두", "시럽발", "피카츄", "순대국", "구름나기", "자연인", "대나무", "모래시계", "화이트", "금계란", "바다소리", "달맞이", "중화요리", "피카부", "늑대인간", "배가본드", "베일리", "단풍나무", "피그말리온", "다크나이트", "닉네임", "골든벨", "토스트", "마법램프", "핑크퐁", "초코파이", "바나나우유", "자라나라", "배고프다", "도라에몽", "새싹농장", "파라다이스", "문어구이", "커피한잔", "바람둥이", "전우치", "무지개", "해피엔딩", "코알라", "파란만장", "스파이더맨", "미니언즈", "유니콘", "불꽃놀이", "블랙핑크", "선인장", "짱구", "메가폰", "귀찮다", "코카콜라", "유리잔", "블루베리", "핫도그", "아니근데오늘진짜", "테슬라", "캐리비안", "포스카", "카레라이스", "톰과제리", "감자튀김", "박하명", "미켈란젤로", "아이언맨", "레인보우", "치킨무", "돌고래", "별이빛나는밤에", "딸기우유", "피자", "사과나무", "화이팅", "삼다수", "블루문", "천사", "푸른하늘", "해피버스데이", "유미", "바람과함께사라지다", "바다", "스파이", "허니버터칩", "레몬에이드", "미래의섬", "청춘", "카카오", "프로틴", "하늘", "빵집", "사과", "소녀시대", "네온사인", "닌텐도", "유리창", "해리포터", "천국", "아몬드", "소라게", "비행기", "드래곤", "오렌지", "루돌프", "비올라", "눈사람", "해적왕", "초콜릿", "눈꽃", "행복", "하루살이", "달리는별", "웃는새", "노래하는벽돌", "뛰는강아지", "손잡는바람", "춤추는나무", "쓰는책", "먹는사과", "움직이는구름", "찾는열쇠", "생각하는고양이", "놀라는해변", "마시는물", "보는책상", "걷는길", "뛰어넘는장애물", "만드는음악", "울고있는구름", "웃고있는해", "생각하는문", "눈치채는그림", "기다리는열매", "꿈꾸는풍선", "읽는신문", "만족하는바다", "느끼는햇빛", "마주치는바람", "찾아다니는자전거", "고민하는구름", "빛나는별", "담는물고기", "가는길", "웃음짓는꽃", "높이는하늘", "내리는비", "올라가는숲", "열심히하는일", "기대하는미래", "주는선물", "받는편지", "싸우는호랑이", "청소하는비누", "바라보는눈빛", "느껴지는감정", "물어보는질문", "날아다니는구름", "달려가는바람", "빛내는별빛", "살아가는바다", "믿는사람", "놀라운모습", "열심히하는노력", "생각하는마음", "바라는희망", "이끌어가는길", "마주치는목표", "가르치는선생님", "빛나는꿈", "포기하지않는희망", "연주하는노래", "열정적인눈빛", "넘어가는장애", "미루는일정", "깨우는새벽", "좋아하는음식", "귀여워하는강아지", "울려주는노래", "응원하는친구", "지키는약속", "들리는소리", "돌아보는과거", "남겨지는추억", "영원히하는사랑", "커지는꿈", "남는흔적", "불러주는노래", "되돌아가는시간", "가르치는지식", "속삭이는바람", "알려주는정보", "마주하는미래", "말하는이야기", "만날것이다", "부드러운별", "따뜻한바람", "행복한꽃", "선명한하늘", "화려한모래", "맑은물", "신선한이슬", "착한사람", "귀여운강아지", "밝은달", "예쁜꽃", "신나는노래", "고마운친구", "정직한마음", "따뜻한햇살", "느긋한하루", "좋은사람", "아름다운바다", "신비로운숲", "깨끗한하늘", "따뜻한침대", "상쾌한모닝", "신나는파티", "유쾌한웃음", "착한마음", "신선한바람", "밝은미소", "빛나는별", "따스한풍경", "평화로운밤", "신비로운꿈", "설레는시작", "달콤한휴식", "행복한날", "화려한색깔", "새로운시작", "신선한기운", "상큼한콜라", "따뜻한목소리", "아름다운하루", "달콤한꿀", "상쾌한아침", "따스한봄날", "신선한냄새", "상큼한과일", "유쾌한음악", "달콤한여행", "신선한물고기", "상쾌한바다", "아름다운소리", "상큼한빛", "신나는춤", "착한가족", "새로운사랑", "달콤한초콜릿", "화려한꽃", "귀여운곰돌이", "따뜻한친구", "신선한사랑", "선명한별빛", "행복한생각", "상큼한사과", "신비로운세계", "설레는하루", "유쾌한시간", "선명한하늘", "달콤한밤", "행복한마음", "화려한빛", "따뜻한봄날", "상쾌한냄새", "선명한사진", "신선한바다", "아름다운꽃밭", "달콤한향기", "신나는음악", "설레는모습", "유쾌한이야기", "착한햇살", "새로운모습", "톡쏘는콜라", "아름다운자연", "선명한눈", "신비로운이야기", "행복한여행", "설레는느낌", "따뜻한봄바람", "착한친구", "선명한하루", "상쾌한바람", "근사한음식", "신선한기운", "달콤한꿈", "행복한시간", "신나는놀이", "귀여운아기", "신선한아침", "새로운도전", "아름다운풍경" ];
var titles = [ "따뜻한날의숲속", "신선한아침의산책", "달콤한휴식의시간", "평화로운바다의여행", "선명한하늘과나", "신나는노래와함께", "착한마음으로사는", "상큼한과일로채운", "아름다운자연의풍경", "새로운도전과결과", "따스한봄바람과함께", "설레는첫만남의날", "유쾌한이야기와웃음", "신비로운세계를탐험", "달콤한꿈으로빠져들", "행복한시간을함께", "상쾌한아침의출발", "선명한별빛아래서", "신선한공기와산책", "귀여운아기와함께", "신나는놀이와즐거움", "선명한눈물의이유", "신비로운이야기와모험", "달콤한향기가가득", "행복한여행의기록", "상쾌한바람과함께", "근사한음식으로감동", "신선한감정을느끼며", "달콤한사랑이시작되다", "새로운시작과도전", "아름다운풍경을바라보며", "상쾌한빛이비치는", "신선한사랑의시작", "따뜻한봄날의기억", "설레는느낌이가득", "유쾌한음악과함께", "신비로운이야기를들어", "달콤한꿈을꾸다", "행복한시간을보내며", "상쾌한아침의시작", "선명한눈빛이빛나는", "신선한공기와함께", "근사한음식과즐거움", "신선한감정이느껴지는", "달콤한사랑이피어난", "새로운도전과성공", "상쾌한빛이비치는", "신선한사랑의시작", "아니근데오늘진짜", "신선한감정이느껴지는", "달콤한사랑이피어난" ];
var contents = [ "한 걸음씩 나아가며 즐거운 하루를 보냈습니다.", "새로운 시작과 함께 행복한 일상이 펼쳐졌어요.", "자연의 아름다움을 느끼며 즐거운 시간을 보냈습니다.", "가족과 함께한 소중한 순간들이 행복을 안겨주었어요.", "감사함을 느끼며 평온한 마음으로 하루를 마무리했습니다.", "자신을 믿고 도전했던 순간이 즐거운 기억으로 남았어요.", "소중한 이들과 함께한 시간은 행복의 원동력이 되었습니다.", "자연과 어우러진 힐링 타임을 보내며 마음이 풍요로워졌어요.", "좋은 친구들과 함께한 시간은 늘 소중하고 따뜻했습니다.", "새로운 사랑의 시작은 기쁨과 설렘으로 가득 찼어요.", "매일매일이 새로운 도전이고 성장의 기회였습니다.", "함께한 시간이 지나면서 우리의 인연이 더 깊어졌어요.", "자신을 믿고 나아가며 행복을 찾아 나섰습니다.", "좋은 음악과 함께한 시간은 마음을 달래주었습니다.", "자연의 아름다움을 담은 순간은 평온함을 안겨주었어요.", "마음이 따뜻해지는 이야기들이 함께했던 하루였습니다.", "소중한 사람들과 함께한 시간은 늘 소중하고 행복했습니다.", "자신을 믿고 도전한 순간은 더 나은 내일을 꿈꾸게 했습니다.", "새로운 도전과 시도로 인해 더 많이 배웠습니다.", "자신의 가치와 가능성을 믿고 나아가는 순간이었습니다.", "마음이 풍요로워지는 자연의 아름다움을 느끼며 행복했습니다.", "소중한 사람들과 함께한 특별한 순간은 기억에 남을 것입니다.", "자신의 가능성을 믿고 도전한 순간은 큰 보람을 주었습니다.", "마음이 편안해지는 아름다운 자연 속에서 평온함을 느꼈습니다.", "소중한 이들과 함께한 하루는 늘 행복한 기억으로 남을 것입니다.", "자신의 가치를 믿고 나아가는 순간은 소중한 성장의 시간이었습니다.", "마음이 따뜻해지는 순간들이 함께했던 특별한 하루였습니다.", "자연과 어우러진 평온한 순간은 마음을 편안하게 해주었습니다.", "소중한 사람들과 함께한 특별한 순간은 늘 기억에 남을 것입니다.", "자신의 가능성을 믿고 도전한 순간은 더 나은 내일을 위한 시작이었습니다.", "마음이 평화로워지는 아름다운 자연 속에서의 시간은 특별했습니다.", "소중한 이들과 함께한 하루는 늘 행복한 기억으로 남을 것입니다.", "자신의 가치를 믿고 나아가는 순간은 소중한 성장의 시간이었습니다.", "마음이 따뜻해지는 순간들이 함께했던 특별한 하루였습니다.", "자연과 어우러진 평온한 순간은 마음을 편안하게 해주었습니다.", "소중한 사람들과 함께한 특별한 순간은 늘 기억에 남을 것입니다.", "자신의 가능성을 믿고 도전한 순간은 더 나은 내일을 위한 시작이었습니다.", "마음이 평화로워지는 아름다운 자연 속에서의 시간은 특별했습니다.", "소중한 이들과 함께한 하루는 늘 행복한 기억으로 남을 것입니다." ];

for (let i = 0; i < 100; i++) {
  var index = Math.floor(Math.random() * nicknames.length);
  var nickname = nicknames[index];
  nicknames.splice(index, 1);

  var email = nickname + "@test.com";
  var profileImageId = '/image/default-image-0' + Math.floor(Math.random() * 10) + '.png';
  var createdAt, updatedAt;
  createdAt = updatedAt = new Date();
  
  var user = db.users.insertOne({ email, nickname, profileImageId, createdAt, updatedAt });
  var userId = user.insertedId;
  db.users.dropIndex('profileImageId_1')

  var album = db.albums.insertOne({ userId, title: 'Recents', count: 0, createdAt, updatedAt });
  var albumId = [ album.insertedId ];
  db.albums.dropIndex('userId_1')

  for (let j = 0; j < 10; j++) {
	var title = titles[Math.floor(Math.random() * titles.length)];
	var content = contents[Math.floor(Math.random() * contents.length)];
	var isPublic = Math.random() < 0.5;
	var images = [];
	var imageLength = Math.floor(Math.random() * 5);
	for (let k = 0; k < imageLength; k++) {
	  images.push('/image/default-image-0' + Math.floor(Math.random() * 10) + '.png');
	}
	createdAt = updatedAt = new Date();
    db.diaries.insertOne({ userId, title, content, isPublic, images, albumId, createdAt, updatedAt });
  }
}
  
EOF