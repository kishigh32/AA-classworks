const readline = require('readline');
const reader = readline.createInterface({
    input: process.stdin, output: process.stdout
});

function askIfGreaterThan(el1, el2, callback) {
    reader.question(`Is ${el1} greater than ${el2}? `, (res) => {
        if(res === 'yes') {
            callback(true);
        } else {
            callback(false); 
        }
           // reader.close();
    });
}

function innerBubbleSortLoop(arr, i, madeAnySwaps, outerBubbleSortLoop) {
    if(i < arr.length -1) {
        askIfGreaterThan(arr[i], arr[i+1], function (isGreaterThan) {
            if(isGreaterThan) {
                [arr[i], arr[i+1]] = [arr[i+1], arr[i]];
                madeAnySwaps = true;
            }

            innerBubbleSortLoop(arr, i+1, madeAnySwaps, outerBubbleSortLoop);

        });
       
    } else if( i == arr.length - 1) {
        return outerBubbleSortLoop(madeAnySwaps);
    }
}

function absurdBubbleSort(arr, sortCompletionCallback) {
    function outerBubbleSortLoop(madeAnySwaps) {
        // Begin an inner loop if you made any swaps. Otherwise, call
        // `sortCompletionCallback`.
        madeAnySwaps ? innerBubbleSortLoop(arr, 0, false, outerBubbleSortLoop) : sortCompletionCallback(arr);
      }
    
      // Kick the first outer loop off, starting `madeAnySwaps` as true.
      return outerBubbleSortLoop(true);
    }
    
    absurdBubbleSort([3, 2, 1, 7, 12], function(arr) {
      console.log("Sorted array: " + JSON.stringify(arr));
      reader.close();
    });

// askIfGreaterThan(2, 5, (res)=> { console.log(res)})
// innerBubbleSortLoop([1,5,2,3,7,4], 0, false, (swaps) => { 
//     console.log('Im here');
//     reader.close();
// });
