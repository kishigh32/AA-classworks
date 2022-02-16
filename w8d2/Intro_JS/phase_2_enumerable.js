Array.prototype.myEach = function (callback_1) {
  for (let i = 0; i < this.length; i++) {
    callback_1(this[i]);
  }
}

Array.prototype.myMap = function(callback_2){
  const new_array = [];
  this.myEach(function(ele) {
    new_array.push(callback_2(ele))
  })
  console.log(new_array);
  return new_array;
}

let test_array = [1,2,3,4,5];
// function double(ele) {
//   return ele * 2;
// }
// [1, 2, 3, 4, 5].myMap(double);

Array.prototype.myReduce = function(callback, iv) {
  iv = iv || this.shift();
  let acc = iv;
  this.myEach(function(ele) {
    acc = callback(acc, ele);
  })
  console.log(acc);
  return acc;
}

// test_array.myReduce(function(acc, el) {
//   return acc + el;
// }, 25);