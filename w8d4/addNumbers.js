const readline = require('readline');
const reader = readline.createInterface({ 
    input: process.stdin, output: process.stdout
})

function addNumbers(sum = 0, numsLeft, completionCallback) {
    if (numsLeft === 0) {
        reader.close();
        return completionCallback(sum);
    }

    if (numsLeft > 0) {
        reader.question('Give us a number: ', (res) => {
            sum += parseInt(res);
            
            return addNumbers(sum, --numsLeft, completionCallback);
        })
    }
}

addNumbers(0, 3, sum => console.log(`Total Sum: ${sum}`));