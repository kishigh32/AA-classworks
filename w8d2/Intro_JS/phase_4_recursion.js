function range(start, end) {
    if (start === end) {
        return [end];
    }
    let rangeArr = [];
    rangeArr.push(start);
    rangeArr = rangeArr.concat(range(start+1, end));
    return rangeArr;
}

// console.log(range(1, 5));

function sumRec(arr) {
    if (arr.length === 1) {
        return arr[0];
    }
    let sum = 0;
    sum += arr[0];

    sum += sumRec(arr.slice(1));
    return sum;
}

// let test = [1, 2, 3, 4, 5];
// console.log(sumRec(test));

function exponent1(base, exp) {
    if (exp === 0) {
        return 1;
    }
    let sum = 1;
    sum *= base;
    sum *= exponent(base, exp - 1);
    return sum;
}

function exponent2(base, exp) {
    if (exp === 0) {
        return 1;
    }
    if (exp % 2 === 0) {
        return exponent2(base, exp / 2) * exponent2(base, exp / 2);
    } 

    else {
        return base * (exponent2(base, (exp - 1) / 2)) * (exponent2(base, (exp - 1) / 2));
    }
}

// console.log(exponent2(5, 1));

function fibonacci(n){
    if (n === 1){
        return [1];
    }
    if (n === 2) {
        return [1,1]
    }

    let fibArr = []
    let previous_fib = fibonacci(n -1)
    fibArr.push(previous_fib[previous_fib.length - 1] + previous_fib[previous_fib.length - 2]);
    fibArr = previous_fib.concat(fibArr);
    return fibArr
}

function deepDup(arr){
    let new_arr = [];
    if (Array.is_Array(arr)) {
        new_arr.concat(deepDup(arr))
    }
    else {  
        new_arr.push(arr)
    }

    return new_arr ;
}

/// Ruby Code

// def deep_dup(arr)
// arr.map{ | el | el.is_a ? (Array) ? deep_dup(el) : el }
// end

