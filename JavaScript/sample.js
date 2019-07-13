$(document).ready(function(){   //HTMLの読み込みが終わってからfunctionの中の処理を行うという意味。
    function score_indicate(){
      // このような記述をすることで、subject_pointsという変数の中に
      // [国語の点数,英語の点数,数学の点数,理科の点数,社会の点数]という配列を作成できる。
      let subject_points = [Number($('#national_language').val()),      //subject_pointsの配列として国語の点数の値を取得する。
                            Number($('#english').val()),                //Numberで文字列から数値へ変換する。
                            Number($('#mathematics').val()),
                            Number($('#science').val()),
                            Number($('#society').val())
                            ];
  
      // さらにこのような記述をすることで、「合計点：」となっている右の部分に合計点が出力される
      let sum = subject_points.reduce(function(a, b){
          return a + b;
      });
    //   let sum = subject_points[0];
    //   sum = sum + subject_points[1];
    //   sum = sum + subject_points[2];
    //   sum = sum + subject_points[3];
    //   sum = sum + subject_points[4];
      $('#sum_indicate').text(sum);     //合計点：　に５教科の合計点を書き込む。
  
      // ここに、上記を参考にして平均点を出力する処理を書き込む
      let avarage = sum / 5;
      $('#avarage_indicate').text(avarage);
    };
  
    function get_achievement(){
      // ここに、ランクの値の文字列（平均点が80点以上なら"A"、60点以上なら"B"、40点以上なら"C"、それ以下なら"D"）を出力する処理を書き込む
      let achievment = document.getElementById('avarage_indicate');
      let achievment_number = Number(achievment.textContent);
      // console.log(achievment.textCotent);
      let lank = document.getElementById('evaluation');
      // console.log(lank);
      if(achievment_number >= 80){
            lank.textContent = "A";
        }else if(achievment_number >= 60){
            lank.textContent = "B";
        }else if(achievment_number >= 40){
            lank.textContent = "C";
        }else{
            lank.textContent = "D";
        };

    }
  
    function get_pass_or_failure(){
      // ここに、全ての教科が60点以上なら"合格"の文字列、一つでも60点未満の教科があったら"不合格"の文字列を出す処理を書き込む
      let subject_points = 
      [Number($('#national_language').val()), 
      Number($('#english').val()),
      Number($('#mathematics').val()),
      Number($('#science').val()),
      Number($('#society').val())
      ];
      let judge_param = document.getElementById('judge');
      judge_param.textContent = "合格";
      for(let i = 0; i < 5; i++){
          if(subject_points[i] < 60){
              judge_param.textContent = "不合格";
          };
      };
    }
  
    function judgement(){
        $('#alert-indicate').remove();
      // ここに、「最終ジャッジ」のボタンを押したら「あなたの成績はAです。合格です」といった内容を出力する処理を書き込む
      // 下記の記述をすることで、「最終ジャッジ」のボタンを押すと「あなたの成績は（ここに「ランク」の値を入れる）です。（ここに「判定」の値を入れる）です」という文字の入った水色のフキダシが出力される処理が実装される。
    //   console.log($('#evaluation').text());
    //   console.log($('#judge').text());
      $('#declaration').append(`<label id="alert-indicate" class="alert alert-info">あなたの成績は${$('#evaluation').text()}です。${$('#judge').text()}です</label>`);
    };      //declarationのidがついたlabelタグに.append()のカッコ内の内容を追加する。
  
    $('#national_language, #english, #mathematics, #science, #society').change(function() {     //各教科の点数が変更された時の処理を行う。
      score_indicate();
    });
  
    $('#btn-evaluation').click(function() {     //ランクのボタンがクリックされた場合の処理を行う。
      get_achievement();
    });
  
    $('#btn-judge').click(function() {
      get_pass_or_failure();
    });
  
    $('#btn-declaration').click(function() {
      judgement();
    });
  });