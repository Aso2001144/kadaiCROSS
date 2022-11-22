<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>チャットルーム</title>
    <link rel="stylesheet" href="./css/chat.css">
</head>
<h1>チャット</h1>
<body>
<header class="header">
    <!-- ハンバーガーメニュー部分 -->
    <div class="nav">

        <!-- ハンバーガーメニューの表示・非表示を切り替えるチェックボックス -->
        <input id="drawer_input" class="drawer_hidden" type="checkbox">

        <!-- ハンバーガーアイコン -->
        <label for="drawer_input" class="drawer_open"><span></span></label>

        <!-- メニュー -->
        <nav class="nav_content">
            <ul class="nav_list">
                <li class="nav_item"><a href="">メニュー1</a></li>
                <li class="nav_item"><a href="">メニュー2</a></li>
                <li class="nav_item"><a href="">メニュー3</a></li>
            </ul>
        </nav>

    </div>
</header>
<form action="chat.php" method="post" onsubmit="return validate()" name="form">
    ユーザーID
    <div><input type="text" name="y_i"></div>
    メッセージ
    <div><textarea name="m"></textarea></div>
    <div class="chat-submit">
        <input type="submit" value="送信" name="submit">
    </div>
</form>
<!-----------DBに書き込み--------------->
<?php
if(isset($_POST['n'])) {

    $my_y_i=htmlspecialchars($_POST["y_i"], ENT_QUOTES);//名前を$my_y_iに代入
    $my_mes=htmlspecialchars($_POST["m"], ENT_QUOTES);//メッセージを$my_mesに代入
    $pdo= "mysql:host=localhost;dbname=LAA1291148-kadai;charset=utf8";
    $user="LAA1291148";
    $pass="kadai";

    try{

        $db = new PDO($pdo,$user,$pass);//データベースへアクセス（PDO文）
        $db->query("INSERT INTO `msgs` (ban,y_i,mes,dat)
            VALUES (NULL,'$my_y_i','$my_mes',NOW())");//テーブルに値を入れる（Mysqlのqueryを実行）
        //SQL文で'msgs'テーブルに番号・名前・メッセージ・日付の内容を取得して保存していく
    }catch (Exception $e) {
        echo $e->getMessage() . PHP_EOL;//エラーが出たときの処理
    }

    header("Location: {$_SERVER['PHP_SELF']}");//このページに戻ってくる（header関数）
    exit;

}
?>
<!-----------DBに書き込み--------------->
    <!-----------DBから取り込む--------------->
    <?php
    $pdo= "mysql:host=localhost;dbname=LAA1291148-kadai;charset=utf8";
    $user="LAA1291148";
    $pass="kadai";
    try {
        $pdo = new PDO($pdo, $user, $pass);
    } catch (PDOException $e) {
        echo 'Connection failed: ' . $e->getMessage();
    }
    $ps = $pdo->query("SELECT * FROM `msgs` ORDER BY ban DESC");//「msgs」テーブルから番号の降順に投稿内容を取得する


//ここから「何分前」の表示プログラム====================================

//定数======================================================
    const SECMINUITE = 60;                    //1分（秒）
    const SECHOUR = 60 * 60;                //1時間（秒）
    const SECDAY = 60 * 60 * 24;            //1日（秒）
    const SECWEEK = 60 * 60 * 24 * 7;        //1週（秒）
    const SECMONTH = 60 * 60 * 24 * 30;    //1月（秒）
    const SECYEAR = 60 * 60 * 24 * 365;    //1年（秒）
//========================================================

    function niceTime($dest,$sour) {
        $sour = (func_num_args() == 1) ? time() : func_get_arg(1);

        $tt = $dest - $sour;


        if ($tt / SECYEAR  < -1) return abs(round($tt / SECYEAR))    . '年前';
        if ($tt / SECMONTH < -1) return abs(round($tt / SECMONTH))   . 'ヶ月前';
        if ($tt / SECWEEK  < -1) return abs(round($tt / SECWEEK))    . '週間前';
        if ($tt / SECDAY   < -1) return abs(round($tt / SECDAY))     . '日前';
        if ($tt / SECHOUR  < -1) return abs(round($tt / SECHOUR))    . '時間前';
        if ($tt / SECMINUITE < -1)   return abs(round($tt / SECMINUITE)) . '分前';
        if ($tt < 0)                return abs(round($tt)) . '秒前';
        if ($tt / SECYEAR  > +1) return abs(round($tt / SECYEAR))    . '年後';
        if ($tt / SECMONTH > +1) return abs(round($tt / SECMONTH))   . 'ヶ月後';
        if ($tt / SECWEEK  > +1) return abs(round($tt / SECWEEK))    . '週間後';
        if ($tt / SECDAY   > +1) return abs(round($tt / SECDAY))     . '日後';
        if ($tt / SECHOUR  > +1) return abs(round($tt / SECHOUR))    . '時間後';
        if ($tt / SECMINUITE > +1)   return abs(round($tt / SECMINUITE)) . '分後';
        if ($tt > 0)                return abs(round($tt)) . '秒後';
        return '現在';
    }
 //===================================================

 //ここまで「何分前」の表示プログラム====================================

        try{

            while($r = $ps->fetch()){ //それぞれの投稿内容（ユーザーID＋メッセージ＋番号＋日時）を$rに代入（while文とfetch関数を使用）

//ここから「何分前」の表示プログラム==================
    $beforedest = $r['dat'];//投稿された時刻を$beforedestに代入
    $dest = strtotime($beforedest);//$beforedestの時刻をUnix タイムスタンプに変換（strtotime関数を使用）
    $sour = time(); //現在の時刻を$sourに代入
    $outstr = nicetime($dest,$sour);//上で作ったnicetime関数に第一・ニ引数を入れて$outstrに代入
?>

                <div class="chat-list">
                    <div class="chat-name">
                        <?php
                        print "{$r['y_i']}";?>//ユーザーIDの表示
                    </div>

                    <div class="chat-date">
                        <?php
                        print $outstr;?>//何分前の表示
                    </div>

                    <div class="chat-message">
                        <?php
                        print nl2br($r['mes']); ?> //メッセージを表示
                    </div>

                </div><hr>
            <?php }

        }catch(Exception $e){
            echo $e->getMessage() . PHP_EOL;//エラーが出たときの処理
        }
      ?>
</body>
</html>
