class QuestionData {
  static const List<String> autonomicNervousSystem = [
    "1.\t身體無力？",
    "2.\t心理倦怠？",
    "3.\t生理疲倦？",
    "4.\t盜汗？",
    "5.\t容易感冒？",
    "6.\t感冒很難治好？",
    "7.\t容易暈車？",
    "8.\t手腳冰冷症？",
    "9.\t冒汗(全身、手)？",
    "10.\t不出汗？",
    "11.\t焦躁？",
    "12.\t易怒？",
    "13.\t不易熟睡？",
    "14.\t睡眠較淺？",
    "15.\t早上起床不舒服？",
    "16.\t頭痛？",
    "17.\t頭重感？",
    "18.\t思緒不集中？",
    "19.\t臉疼痛？",
    "20.\t頭暈？",
    "21.\t起立姓暈眩？",
    "22.\t眼睛模糊？",
    "23.\t耳鳴？",
    "25.\t耳朵聽不清楚？",
    "26.\t喉嚨疼痛？",
    "27.\t喉嚨很乾？",
    "28.\t經常出口內炎？",
    "29.\t反覆出現扁條線炎？",
    "30.\t嚐不出味道？",
    "31.\t打噴嚏？",
    "32.\t流鼻水？",
    "33.\t磨牙？",
    "34.\t聞不到氣味？",
    "35.\t打鼾？",
  ];

  static var brainFatigueIndex = [
    ["title","認知層面",],
    ["content","1.\t精神無法集中超過30分鐘？",],
    ["content","2.\t記憶力不佳、容易丟三落四？",],
    ["content","3.\t閱讀速度變慢、容易讀錯或漏讀文字？",],
    ["content","4.\t您是否會「詞不達意」找不到您要的字詞？",],
    ["content","5.\t您的規劃組織能力是否變差？",],
    ["title","情緒層面"],
    ["content","6.\t容易感到焦慮，不斷擔心將來可能會發生的問題？"],
    ["content","7.\t您是否感覺心浮氣躁，容易被激怒，情緒起伏大？"],
    ["content","8.\t您是否連從事自己的興趣卻提不起勁？"],
    ["content","9.\t您的情緒是否容易低落，拿不定主意，凡事往負面去想？"],
    ["content","10.\t您是否對感情麻木，對親友、家人的情感都變淡了？"],
    ["title","身體層面"],
    ["content","11.\t您是否出現心悸、手抖、忽冷忽熱、腸胃不適等症狀？"],
    ["content","12.\t您是否容易感到疲倦、體力下滑、很難打起精神？"],
    ["content","13.\t您是否有睡眠困擾？"],
    ["content","14.\t您的身體是否容易緊繃、僵硬、全身痠痛？"],
    ["content","15.\t您的眼睛是否容易感到疲勞？視力模糊或減退？"],
  ];

  static const List<String> angel = [
  "1.\t經常不合時宜的大笑？",
  "2.\t頭圍會比平均值來的小？",
  "3.\t下顎骨會突出？",
  "4.\t愛吐舌、常流口水？",
  "5.\t經常性癲癇發作？",
  "6.\t膚色及髮色比較淡？",
  "7.\t步態不穩、雙手不自主地甩動拍手？",
  "8.\t情緒很容易激動？",
  "9.\t注意力短暫？",
  "10.\t語言發展遲緩？",
  ];

  static const List<String> dementia = [
  "1.\t與他人有約卻記不住時間日期？",
  "2.\t忘記正確的月份和年份？",
  "3.\t對活動和嗜好的興趣降低？",
  "4.\t判斷力上的困難：例如落入詐騙、騙局、買了對受禮者不合宜的禮物。",
  "5.\t重複相同問題、故事和陳述。",
  "6.\t在學習如何使用工具和小器具上有困難，例如：遙控器、電視、洗衣機、冷氣機。",
  "7.\t有持續的思考和記憶方面的問題。",
  "8.\t處理複雜的財物上有困難。例如：個人或家庭的收支平衡、所得稅、繳費單。",
  ];

  static const List<String> parkinsonsDisease = [
  "1.\t你的手是否曾經在休息放鬆時，出現顫抖的情形？",
  "2.\t走路時有一隻手臂彎曲且不會擺動？",
  "3.\t身體在站立或行進時，姿勢會向前彎曲？",
  "4.\t走路姿勢雜亂、不順，好像打結了或一腳拖在後面？",
  "5.\t寫字變慢而且字體變小？",
  "6.\t步伐小且常常跌倒？",
  "7.\t常覺得懶洋洋，做甚麼事情都沒有動力？",
  "8.\t頸部後方或是肩膀常常疼痛？",
  "9.\t刻意地避免與聊不來的朋友或家人相處？",
  "10.\t音調出現改變？變得更單調、小聲或沙啞？",
  ];

  static const List<String> schizophrenia = [
  "1.\t我到人多的地方，會無法應付那種壓力很大的感覺。",
  "2.\t我覺得自己無法親近別人。",
  "3.\t我曾經聽到某些聲音、叫聲或呼喚我名字的聲音。",
  "4.\t我做什麼都提不起勁。",
  "5.\t我覺得腦力不夠，想東西、唸東西讓我感到疲倦。",
  "6.\t有他人在場時，我大多保持沉默。",
  "7.\t我有時擔心自己的朋友或同事會對我不忠或是不值得信任。",
  "8.\t我盡量不透露自己的心聲。",
  "9.\t我做事無法持續很久，一下子就想休息。",
  "10.\t我覺得自己什麼都做不好。",
  "11.\t我無法表情生動的講話。",
  "12.\t我不擅於社交禮儀的應對。",
  "13.\t當看到別人交談時，我懷疑他們是在談論我。",
  "14.\t我常從別人的談話或行為中，感到藏有威脅或責備的意味。",
  "15.\t如果必須在一群人面前說話，我會感到非常焦慮不安。",
  ];

  static const List<String> insomnia = [
  "1.\t判斷力上的困難：例如我有入睡困難的情形。",
  "2.\t我需要超過一個小時以上才能睡著。",
  "3.\t我夜間會醒來三次以上。",
  "4.\t我夜間醒來，常要花很長的時間才能再度入睡。",
  "5.\t我早上會太早醒來。",
  "6.\t我擔心不能睡好。",
  "7.\t我會喝酒幫助入睡。",
  "8.\t我躺床時，腿部會有不安寧或抽動的感覺。",
  "9.\t我早上會起不來。",
  "10.\t我醒來時仍然感覺疲倦。",
  "11.\t我的睡眠無法讓我感到精神飽滿甦活。",
  "12.\t雖然我躺床的時間夠長，卻未得到足夠需要的睡眠。",
  "13.\t我的睡眠讓我在白天覺得疲乏。",
  ];

  static const List<String> hypersomnia = [
  "1.\t坐著閱讀書報時。",
  "2.\t觀看電視或使用3C用品時。",
  "3.\t在公共場合安靜坐著時(如看電影，開會，上課)。",
  "4.\t坐車超過一個小時（不包含自己開車）。",
  "5.\t午餐後睡午覺（環境許可）。",
  "6.\t坐著與人交談時。",
  "7.\t沒有喝酒情況下，午餐後安靜坐著時。",
  "8.\t開車途中遇到交通問題而停頓幾分鐘時。",
  ];

  static const List<String> depression = [
  "1.\t我常常覺得想哭？ ",
  "2.\t我覺得心情不好？",
  "3.\t我覺得比以前容易發脾氣。",
  "4.\t我睡不好。",
  "5.\t我覺得不想吃東西？",
  "6.\t我覺得胸口悶悶的 ( 心肝頭或胸坎綁綁 )。",
  "7.\t我覺得不輕鬆、不舒服 ( 不爽快 )。",
  "8.\t我覺得身體疲勞虛弱、無力( 身體很虛、沒力氣、元氣及體力 )？",
  "9.\t我覺得很煩？",
  "10.\t我覺得記憶力不好。",
  "11.\t我覺得做事時無法專心。",
  "12.\t我覺得想事情或做事時，比平常要緩慢。",
  "13.\t我覺得比以前較沒信心。",
  "14.\t我覺得比較會往壞處想。",
  "15.\t我覺得想不開、甚至想死。",
  "16.\t我覺得對什麼事都失去興趣。",
  "17.\t我覺得身體不舒服( 頭痛、頭暈、肚子不舒服等 )。",
  "18.\t我覺得自己很沒用。",
  ];

  static const List<String> anxietyDisorder = [
  "1.\t感到緊張、不安或煩躁。",
  "2.\t無法停止或控制憂慮。",
  "3.\t過份憂慮不同的事情。",
  "4.\t難以放鬆。",
  "5.\t心情不寧以至坐立不安。",
  "6.\t容易心煩或易怒。",
  "7.\t感到害怕、就像要發生可怕的事情。",
  ];

  static const List<String> ADHD = [
  "1.\t當進行枯燥或困難的計劃時，你會多常粗心犯錯？ ",
  "2.\t在做枯燥或重複性工作時，你多常有持續專注的困難？",
  "3.\t即使有人直接對你說話，你會多常有困難專注於別人跟你講話的內容？",
  "4.\t一旦完成任何計劃中最具挑戰的部份後，你多常有完成計劃最後細節的困難？",
  "5.\t當必須從事需要有組織規劃性的任務時，你會多常有困難井然有序地去做？",
  "6.\t當有一件需要多費心思考的工作時，你會多常逃避或是延後開始去做？",
  "7.\t在家裡或是在工作時，你會多常沒有把東西放對地方或是找不到東西。",
  "8.\t你會多常因身旁的活動或聲音而分心？",
  "9.\t你會多常有問題去記得約會或是必須要做的事？",
  ];

  static const List<String> herpesZoster = [
  "1.\t經常感到身上有抽痛或鑽痛的感覺？",
  "2.\t時不時感到身上有刀子在割的疼痛？",
  "3.\t身體有部位感到異常抽蓄感？",
  "4.\t身上常有癢痛的感覺卻說不清？",
  "5.\t身體像是被火燒（灼熱痛）？",
  "6.\t感到像被繩子捆綁起來（緊縮痛）？",
  "7.\t身體某部位又麻又痛（麻痛）？",
  "8.\t感覺變得遲鈍？",
  "9.\t時常感到身體有冰冷痛？",
  "10.\t身體被觸摸或按壓時，會感到疼、刺痛？",
  ];

}