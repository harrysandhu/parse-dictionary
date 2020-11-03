Object.size = function(obj) {
    var size = 0, key;
    for (key in obj) {
        if (obj.hasOwnProperty(key)) size++;
    }
    return size;
};
var fs = require('fs');
var obj = JSON.parse(fs.readFileSync('syns.json', 'utf8'));

console.log(Object.size(obj))
