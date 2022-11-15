function activate() {
    document.getElementById("result").innerHTML = "<h4>Результат обхода дерева элементов документа:<\h4><br>"
    tree(document.body);
}

var depth = 0;
function tree(elem) {
    var c = elem.children
    if ( c.length > 0) {
        console.log(elem.nodeName);
        for (var k = 0; k < depth; k++)
            document.getElementById("result").innerHTML += "&nbsp&nbsp&nbsp";
        document.getElementById("result").innerText += elem.nodeName;
        document.getElementById("result").innerHTML += "<br>";
        for (var i = 0; i < c.length; i++) 
            if (c[i].className != "invisible") {
                depth++;                            
                tree(c[i]);
            }
            depth--;     
    }
    else {
        console.log(elem.nodeName);
        for (var k = 0; k < depth; k++)
            document.getElementById("result").innerHTML += "&nbsp&nbsp&nbsp";
        document.getElementById("result").innerText += elem.nodeName;
        document.getElementById("result").innerHTML += "<br>";
        depth--;
    }
}