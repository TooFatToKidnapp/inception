
const readline = require('readline');

const rl = readline.createInterface({input: process.stdin, output: process.stdout});

try {

	rl.question('What is your name ? ', function(abort) {
		console.log("Hello, "+ answer);
		rl.close();
	});

} catch (error) {
	console.log("somthing went wrong");

}

