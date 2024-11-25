const stars = document.querySelector(".ratings").children; //.ratingsの子要素全てをHTMLCollectionオブジェクトで取得。
const ratingValue = document.getElementById("rating-value");
const ratingValueDisplay = document.getElementById("rating-value-display");

let index;

for(let i = 0; i < stars.length; i++) {
  // マウスがhoverした時の処理
  // 一度星を全てくり抜く（塗りつぶしを削除）→ 毎回カーソルを置くたびにリセットできる（5→3にしたいときは減らさなくてはならないため）
  stars[i].addEventListener("mouseover", function() {
    for(let j = 0; j < stars.length; j++) {
      stars[j].classList.remove("fa-star");
      stars[j].classList.add("fa-star-o");
    }
    // カーソルが乗ったところまで星を塗りつぶす
    for(let j = 0; j <= i; j++) {
      stars[j].classList.remove("fa-star-o");
      stars[j].classList.add("fa-star");
    }
  });
  stars[i].addEventListener("click", function() {
    ratingValue.value = i + 1; // +1をする理由 → 要素に振られているindex番号(0~4)で、index番号が「1」の場合はユーザーは「2」を選択している状態
    ratingValueDisplay.textContent = ratingValue.value;
    index = i;
  });
  stars[i].addEventListener("mouseout", function() {
    for(let j = 0; j < stars.length; j++) {
      stars[j].classList.remove("fa-star");
      stars[j].classList.add("fa-star-o");
    }
    for(let j = 0; j <= index; j++) {
      stars[j].classList.remove("fa-star-o");
      stars[j].classList.add("fa-star");
    }
  });
}