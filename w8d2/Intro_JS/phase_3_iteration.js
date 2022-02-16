
Array.prototype.bubbleSort = function(){
  let sorted = false;
  while (!sorted){
    sorted = true;
    for (let i = 0; i < this.length -1; i++){
      if (this[i] > this[i + 1]){
        sorted = false;
        let temp = this[i];
        this[i] = this[i + 1];
        this[i + 1] = temp;
      }
    }
  }
  console.log(this);
  return this;
}
// let test = [4,5,2,1]
// test.bubbleSort();

String.prototype.substrings = function(){
  let new_arr = [];

  for (let i = 0; i < this.length; i++){
    for (let j = i + 1; j < this.length + 1; j++){
      new_arr.push(this.substring(i,j));
    }
  }
  console.log(new_arr);
  return new_arr;
}

let check = "cattanan";
check.substrings();