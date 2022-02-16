
/// Array#Unique 

Array.prototype.uniq = function(){
  const new_arr = [];
  this.forEach(el => {
    if (!new_arr.includes(el))
    {
    new_arr.push(el);
    }
  })
  console.log(new_arr);
  return new_arr;
}

/// Test case
// let testArray = [1,2,2,3,3,3];
// testArray.uniq();
// [1,2,2,3,3,3].uniq();

// Array#twoSum

Array.prototype.twoSum = function(){
  const new_arr = [];
  for (let i = 0; i < this.length; i++) {
    for (let j = i; j < this.length; j++) {
      if (this[i] + this[j] === 0) {
        // let i_arr = [i, j];
        new_arr.push([i, j]);
      }
    }
  }

  console.log(new_arr);
  return new_arr;
}

// let testCase = [1, 2, -1, 3, 4, -4];
// testCase.twoSum();
// [1, -1, 4].twoSum();

Array.prototype.transpose = function() {
  const new_arr = [];
  for (let j = 0; j < this[0].length; j++) {
    const row = [];
    for (let i = 0; i < this.length; i++) {
      row.push(this[i][j]);
    }
    new_arr.push(row);
  }

  console.log(new_arr);
  return new_arr;
}

let test = [[1, 2, 3], 
            [4, 5, 6], 
            [7, 8, 9]];
test.transpose();