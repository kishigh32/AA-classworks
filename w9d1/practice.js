// Given an array nums, write a function to move all 0's to the end of it while maintaining the relative order of the non-zero elements.

// Example:


// Input: [0,1,0,3,12] [1,0,3,12,0]
// Output: [1,3,12,0,0]
// Note:

// Minimize the total number of operations.

function zeroFunction(array) {
    let len = array.length;

    for (let i = 0; i < len; i++) {
        // if (array[0] === 0) {
        //     array.push(array.shift());
        let zero = []
        }
        if (array[i] === 0) {
            zero.push(i);
            // array = array.slice(0,i).concat(array.slice(i+1, len));
            // array.push(0);
            // i--;
        }
    }
    zero.forEach(ele => {
        array = array.slice(0,ele).concat(array.slice(ele+1, len));
        
    });

    return array;
}
let arr = [0,0,1,0,0,3,12];
console.log(zeroFunction(arr));