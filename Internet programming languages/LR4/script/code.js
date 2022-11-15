cnt = 0;

function CreateData() {
    var pr_name = document.getElementById("product_name").value;
    var pr_price = document.getElementById("product_price").value;
    table = document.getElementById("info_table");
    var row = document.createElement("tr");
    var name_td = document.createElement("td");
    name_td.innerText = pr_name;
    var price_td = document.createElement("td");
    price_td.innerText = pr_price;
    row.appendChild(name_td);
    row.appendChild(price_td);
    // row.setAttribute("OnMouseOver", "MouseOver(this)");
    // row.setAttribute("OnMouseOut", "MouseOut(this)");
    // row.setAttribute("onclick", "AddProduct(this)");
    row.addEventListener ("click", function() {AddProduct(row);});
    row.addEventListener ("mouseover", function() {MouseOver(row);});
    row.addEventListener ("mouseout", function() {MouseOut(row);});
    table.appendChild(row);
}

function MouseOver(el) {
    el.style.backgroundColor = "#e0f0ff";
}

function MouseOut(el) {
    el.style.backgroundColor = "white";
}

function AddProduct(el) {
    cnt++;
    table = document.getElementById("cart");
    var pr_name = el.children[0].innerText;
    var pr_price = el.children[1].innerText;
    var row = document.createElement("tr");
    var name_td = document.createElement("td");
    name_td.innerText = pr_name;
    price_td = document.createElement("td");
    price_td.setAttribute("id", `pr${cnt}`);
    price_td.innerText = pr_price;
    row.appendChild(name_td);
    row.appendChild(price_td);
    table.appendChild(row);
}

function FullPrice() {
    price = 0;
    cell = document.getElementById("full_price");
    for(k=1; k<=cnt; k++) {
        x = document.getElementById(`pr${k}`);
        price += Number(x.innerText);
    }
    cell.innerText = price.toString();
}