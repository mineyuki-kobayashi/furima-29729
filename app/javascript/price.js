//ロードしたときに発火するイベントを記入
window.addEventListener('load', function(){
  //３つの要素（価格、販売手数料。販売利益）を取得
  const itemPrice = document.getElementById("item-price");
  const addTaxPrice =document.getElementById("add-tax-price");
  const profit =document.getElementById("profit");
  //input(価格が入力したとき)に発火するイベント
  itemPrice.addEventListener("input",(e) => {
    const itemValue = document.getElementById("item-price").value;

    //計算式 Math.round();は四捨五入
    const sumAddTaxPrice = Math.round(itemValue * 0.1);
    const sumProfit = itemValue - sumAddTaxPrice;

    //計算したものを代入 
    addTaxPrice.innerHTML = sumAddTaxPrice;
    profit.innerHTML = sumProfit;

  });
})