     function confirmDelete_p (event_opl) {
        if ((event_opl.target.tagName.toLowerCase() == 'a' )&&
            (event_opl.target.className == "clDelete") ) {
                if(confirm('Wollen Sie den Datensatz wirklich loeschen?')){

                }
                else{
                    onsubmit(event_opl)
                }
                }
            }




            window.onload = function () {
                    let body_o = document.getElementsByTagName('body')[0];
                    body_o.addEventListener('click', confirmDelete_p, false);
                    body_o.addEventListener('load', sortTable(), false);
            }


function select_Weiter(data) {


                var p = document.getElementById('create_check');
                var i = 0;

                for (var prop in data) {
                    var checkbox = document.createElement('input');

                        if (data[prop].status === "None"){
                            data[prop].status = "angemeldet"
                        }


                            var checkbox_str = JSON.stringify(data[prop]);


                            checkbox.type = "checkbox";
                            checkbox.id = "Weiterbildung_spa_" + i;
                            checkbox.name = "Weiterbildung_spa";
                            checkbox.value = checkbox_str;

                            var label = document.createElement('label');
                            var tn = document.createTextNode(JSON.stringify(data[prop]["bezeichnung"]));
                            label.htmlFor = "cbid";
                            label.appendChild(tn);
                            p.appendChild(label);
                            p.appendChild(checkbox);


                        i++;


     }
 }


    function sortTable() {
  var table, rows, switching, i, x, y, shouldSwitch;
  table = document.getElementById("Mitarbeitertabelle");
  if (table == null){
      return;
  }
  switching = true;
  sortTable2();

  while (switching) {

    switching = false;
    rows = table.rows;

    for (i = 1; i < (rows.length - 1); i++) {

      shouldSwitch = false;

      x = rows[i].getElementsByTagName("TD")[0];
      y = rows[i + 1].getElementsByTagName("TD")[0];

      if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {

        shouldSwitch = true;
        break;
      }
    }
    if (shouldSwitch) {

      rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
      switching = true;
    }
  }
}

 function sortTable2() {

   var table,switching, i, x, y;
   table = document.getElementById("Mitarbeitertabelle");
   switching = true;

        while (switching) {

            switching = false;


        for (i = 1; i < (table.rows.length - 1); i++) {

            x = table.rows[i].getElementsByTagName("TD")[5];
            y = table.rows[i + 1].getElementsByTagName("TD")[5];
            var xdate=new Date(x.innerHTML);
            var ydate=new Date(y.innerHTML);

        if (xdate > ydate) {

            table.rows[i].parentNode.insertBefore(table.rows[i + 1], table.rows[i]);
            switching = true;
            break;

       }
     }

   }

 }


