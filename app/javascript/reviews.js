const stars = document.querySelector(".ratings").children; //.ratingsの子要素全てをHTMLCollectionオブジェクトで取得。const stars = document.getElementsByClassName("ratings").children;でも可能。
const ratingValue = document.getElementById("rating-value"); // hidden_fieldのid = "rating-valueの要素を取得" / score
const ratingValueDisplay = document.getElementById("rating-value-display"); // 数字の部分 → 今は0

let index; // indexという変数を定義（クリックされた星（位置）を記録するため）

// reviewの投稿ページに遷移するとstars.lengthの値(5)だけ繰り返し
for(let i = 0; i < stars.length; i++) {
  
  // マウスが星にhoverした時に実行する関数を定義
  stars[i].addEventListener("mouseover", function() {
    // stars.lengthの値（5）だけ繰り返し
    // 星にマウスが乗った際に一度星を全てくり抜く（塗りつぶしを削除）→ 毎回カーソルを置くたびにリセットできる（5 → 3にしたいときは減らさなくてはならないため）
    for(let j = 0; j < stars.length; j++) {
      stars[j].classList.remove("fa-star");
      stars[j].classList.add("fa-star-o");
    }
    // カーソルが乗ったところまで星を塗りつぶす
    // 星の数だけ以下の関数が繰り返される
    for(let j = 0; j <= i; j++) {
      stars[j].classList.remove("fa-star-o");
      stars[j].classList.add("fa-star");
    }
  });
  // クリックされた星の番号+1をratingValueに代入
  stars[i].addEventListener("click", function() {
    ratingValue.value = i + 1; // +1をする理由 → 要素に振られているindex番号(0~4)で、index番号が「1」の場合はユーザーは「2（星の2つ目）」を選択している状態
    ratingValueDisplay.textContent = ratingValue.value;
    // クリックされた星の配列番号を代入
    index = i;
  });
  // 星からカーソルが離れたときに実行される関数
  stars[i].addEventListener("mouseout", function() {
    for(let j = 0; j < stars.length; j++) {
      // まず全ての星をくり抜く
      stars[j].classList.remove("fa-star");
      stars[j].classList.add("fa-star-o");
    }
    for(let j = 0; j <= index; j++) {
      // クリックされている星まで塗りつぶす
      stars[j].classList.remove("fa-star-o");
      stars[j].classList.add("fa-star");
    }
  });
}