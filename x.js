Object.size = function(obj) {
    var size = 0, key;
    for (key in obj) {
        if (obj.hasOwnProperty(key)) size++;
    }
    return size;
};
var fs = require('fs');
var obj = JSON.parse(fs.readFileSync('./websterdic1.json', 'utf8'));

count = 0

for (var key in obj) {
    // skip loop if the property is from prototype

    var words = obj[key]["words"];
    for (var prop in words) {
        // skip loop if the property is from prototype
        count += 1

    }
}

console.log(count)